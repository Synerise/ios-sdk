// Copyright (c) 2014-present, Facebook, Inc. All rights reserved.
//
// You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
// copy, modify, and distribute this software in source code or binary form for use
// in connection with the web services and APIs provided by Facebook.
//
// As with any software that integrates with the Facebook platform, your use of
// this software is subject to the Facebook Developer Principles and Policies
// [http://developers.facebook.com/policy/]. This copyright notice shall be
// included in all copies or substantial portions of the software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "TargetConditionals.h"

#if !TARGET_OS_TV

 #import "FBSDKMetadataIndexer.h"

 #import <UIKit/UIKit.h>

 #import <objc/runtime.h>
 #import <sys/sysctl.h>
 #import <sys/utsname.h>

 #import "FBSDKAppEventsUtility.h"
 #import "FBSDKCoreKitBasicsImport.h"
 #import "FBSDKServerConfigurationManager.h"
 #import "FBSDKSwizzler.h"
 #import "FBSDKUtility.h"
 #import "FBSDKViewHierarchy.h"

@interface FBSDKUserDataStore (Internal)

+ (void)setInternalHashData:(nullable NSString *)hashData
                    forType:(FBSDKAppEventUserDataType)type;
+ (void)setEnabledRules:(NSArray<NSString *> *)rules;

+ (nullable NSString *)getInternalHashedDataForType:(FBSDKAppEventUserDataType)type;

@end

static const int FBSDKMetadataIndexerMaxTextLength = 100;
static const int FBSDKMetadataIndexerMaxIndicatorLength = 100;
static const int FBSDKMetadataIndexerMaxValue = 5;

static NSString *const FIELD_K = @"k";
static NSString *const FIELD_V = @"v";
static NSString *const FIELD_K_DELIMITER = @",";

@interface FBSDKMetadataIndexer ()

@property (nonatomic, readonly, strong) NSMutableDictionary<NSString *, NSDictionary<NSString *, NSString *> *> *rules;
@property (nonatomic, readonly, strong) NSMutableDictionary<NSString *, NSMutableArray<NSString *> *> *store;
@property (nonatomic, readonly, strong) dispatch_queue_t serialQueue;

@end

@implementation FBSDKMetadataIndexer

+ (instancetype)shared
{
  static dispatch_once_t nonce;
  static FBSDKMetadataIndexer *instance;
  dispatch_once(&nonce, ^{
    instance = [self new];
  });
  return instance;
}

- (instancetype)init
{
  _rules = [NSMutableDictionary new];
  _serialQueue = dispatch_queue_create("com.facebook.appevents.MetadataIndexer", DISPATCH_QUEUE_SERIAL);
  return self;
}

- (void)enable
{
  @try {
    if ([FBSDKAppEventsUtility shouldDropAppEvent]) {
      return;
    }

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      NSDictionary<NSString *, id> *AAMRules = [FBSDKServerConfigurationManager cachedServerConfiguration].AAMRules;
      if (AAMRules) {
        [self setupWithRules:AAMRules];
      }
    });
  } @catch (NSException *exception) {
    NSLog(@"Fail to enable Automatic Advanced Matching, exception reason: %@", exception.reason);
  }
}

- (void)setupWithRules:(NSDictionary<NSString *, id> *_Nullable)rules
{
  if (0 == rules.count) {
    return;
  }
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    [self constructRules:rules];
    [self initStore];

    BOOL isEnabled = NO;
    for (NSString *key in _rules) {
      if (_rules[key]) {
        isEnabled = YES;
        break;
      }
    }

    if (isEnabled) {
      [FBSDKUserDataStore setEnabledRules:_rules.allKeys];
      [self setupMetadataIndexing];
    }
  });
}

- (void)initStore
{
  _store = [NSMutableDictionary new];
  for (NSString *key in _rules) {
    NSString *data = [FBSDKUserDataStore getInternalHashedDataForType:key];
    if (data.length > 0) {
      [FBSDKTypeUtility dictionary:_store setObject:[NSMutableArray arrayWithArray:[data componentsSeparatedByString:FIELD_K_DELIMITER]] forKey:key];
    }
  }

  for (NSString *key in _rules) {
    if (!_store[key]) {
      [FBSDKTypeUtility dictionary:_store setObject:[NSMutableArray new] forKey:key];
    }
  }
}

- (void)constructRules:(NSDictionary<NSString *, id> *_Nullable)rules
{
  for (NSString *key in rules) {
    NSDictionary<NSString *, NSString *> *value = [FBSDKTypeUtility dictionaryValue:rules[key]];
    if (value[FIELD_K].length > 0 && value[FIELD_V]) {
      [FBSDKTypeUtility dictionary:_rules setObject:value forKey:key];
    }
  }
}

- (void)setupMetadataIndexing
{
  void (^block)(UIView *) = ^(UIView *view) {
    // Indexing when the view is removed from window and conforms to UITextInput, and skip UIFieldEditor, which is an internval view of UITextField
    if (![view window] && ![NSStringFromClass([view class]) isEqualToString:@"UIFieldEditor"] && [view conformsToProtocol:@protocol(UITextInput)]) {
      NSString *text = [FBSDKViewHierarchy getText:view];
      NSString *placeholder = [FBSDKViewHierarchy getHint:view];
      BOOL secureTextEntry = [self checkSecureTextEntry:view];
      NSArray<NSString *> *labels = [self getLabelsOfView:view];
      UIKeyboardType keyboardType = [self getKeyboardType:view];
      dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        [self getMetadataWithText:text
                      placeholder:placeholder
                           labels:labels
                  secureTextEntry:secureTextEntry
                        inputType:keyboardType];
      });
    }
  };

  [FBSDKSwizzler swizzleSelector:@selector(didMoveToWindow) onClass:[UIView class] withBlock:block named:@"metadataIndexingUIView"];

  // iOS 12: UITextField implements didMoveToWindow without calling parent implementation
  if (@available(iOS 12, *)) {
    [FBSDKSwizzler swizzleSelector:@selector(didMoveToWindow) onClass:[UITextField class] withBlock:block named:@"metadataIndexingUITextField"];
  } else {
    [FBSDKSwizzler swizzleSelector:@selector(didMoveToWindow) onClass:[UIControl class] withBlock:block named:@"metadataIndexingUIControl"];
  }
}

- (NSArray<UIView *> *)getSiblingViewsOfView:(UIView *)view
{
  NSObject *parent = [FBSDKViewHierarchy getParent:view];
  if (parent) {
    NSArray<id> *views = [FBSDKViewHierarchy getChildren:parent];
    if (views) {
      NSMutableArray<id> *siblings = [NSMutableArray arrayWithArray:views];
      [siblings removeObject:view];
      return [siblings copy];
    }
  }
  return nil;
}

- (NSArray<NSString *> *)getLabelsOfView:(UIView *)view
{
  NSMutableArray<NSString *> *labels = [NSMutableArray new];

  NSString *placeholder = [self normalizeField:[FBSDKViewHierarchy getHint:view]];
  if (placeholder.length > 0) {
    [FBSDKTypeUtility array:labels addObject:placeholder];
  }

  NSArray<id> *siblingViews = [self getSiblingViewsOfView:view];
  for (id sibling in siblingViews) {
    if ([sibling isKindOfClass:[UILabel class]]) {
      NSString *text = [self normalizeField:[FBSDKViewHierarchy getText:sibling]];
      if (text.length > 0) {
        [FBSDKTypeUtility array:labels addObject:text];
      }
    }
  }
  return [labels copy];
}

- (BOOL)checkSecureTextEntry:(UIView *)view
{
  if ([view isKindOfClass:[UITextField class]]) {
    return ((UITextField *)view).secureTextEntry;
  }
  if ([view isKindOfClass:[UITextView class]]) {
    return ((UITextView *)view).secureTextEntry;
  }

  return NO;
}

- (UIKeyboardType)getKeyboardType:(UIView *)view
{
  if ([view isKindOfClass:[UITextField class]]) {
    return ((UITextField *)view).keyboardType;
  }
  if ([view isKindOfClass:[UITextView class]]) {
    return ((UITextView *)view).keyboardType;
  }

  return UIKeyboardTypeDefault;
}

- (void)getMetadataWithText:(NSString *)text
                placeholder:(NSString *)placeholder
                     labels:(NSArray<NSString *> *)labels
            secureTextEntry:(BOOL)secureTextEntry
                  inputType:(UIKeyboardType)inputType
{
  text = [self normalizeValue:text];
  placeholder = [self normalizeField:placeholder];
  if (secureTextEntry || [placeholder containsString:@"password"]
      || text.length == 0
      || text.length > FBSDKMetadataIndexerMaxTextLength
      || placeholder.length >= FBSDKMetadataIndexerMaxIndicatorLength) {
    return;
  }

  for (NSString *key in _rules) {
    NSDictionary<NSString *, NSString *> *rule = _rules[key];
    BOOL isRuleKMatched = [self checkMetadataHint:placeholder matchRuleK:rule[FIELD_K]]
    || [self checkMetadataLabels:labels matchRuleK:rule[FIELD_K]];
    if (!isRuleKMatched) {
      continue;
    }

    NSString *preProcessedText = text;
    if ([key isEqualToString:@"r2"]) {
      preProcessedText = [[text componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"+- ()."]] componentsJoinedByString:@""];
    }
    BOOL isRuleVMatched = [rule[FIELD_V] isEqualToString:@""] || [self checkMetadataText:preProcessedText matchRuleV:rule[FIELD_V]];
    if (isRuleVMatched) {
      NSString *prunedText = [self pruneValue:preProcessedText forKey:key];
      [self checkAndAppendData:prunedText forKey:key];
      continue;
    }
  }
}

 #pragma mark - Helper Methods

- (void)checkAndAppendData:(NSString *)data
                    forKey:(NSString *)key
{
  NSString *hashData = [FBSDKUtility SHA256Hash:data];
  __weak typeof(_store) weakStore = _store;
  dispatch_block_t checkAndAppendDataBlock = ^{
    if (hashData.length == 0 || [weakStore[key] containsObject:hashData]) {
      return;
    }

    while (weakStore[key].count >= FBSDKMetadataIndexerMaxValue) {
      [weakStore[key] removeObjectAtIndex:0];
    }
    [FBSDKTypeUtility array:weakStore[key] addObject:hashData];
    [FBSDKUserDataStore setInternalHashData:[weakStore[key] componentsJoinedByString:FIELD_K_DELIMITER]
                                    forType:key];
  };
#ifdef FBSDKTEST
  checkAndAppendDataBlock();
#else
  dispatch_async(_serialQueue, checkAndAppendDataBlock);
#endif
}

- (BOOL)checkMetadataLabels:(NSArray<NSString *> *)labels
                 matchRuleK:(NSString *)ruleK
{
  for (NSString *label in labels) {
    if ([self checkMetadataHint:label matchRuleK:ruleK]) {
      return YES;
    }
  }
  return NO;
}

- (BOOL)checkMetadataHint:(NSString *)hint
               matchRuleK:(NSString *)ruleK
{
  if (hint.length > 0 && ruleK) {
    NSArray<NSString *> *items = [ruleK componentsSeparatedByString:FIELD_K_DELIMITER];
    for (NSString *item in items) {
      if ([hint containsString:item]) {
        return YES;
      }
    }
  }
  return NO;
}

- (BOOL)checkMetadataText:(NSString *)text
               matchRuleV:(NSString *)ruleV
{
  if (text.length > 0 && ruleV) {
    NSRegularExpression *regex = [[NSRegularExpression alloc] initWithPattern:ruleV
                                                                      options:NSRegularExpressionCaseInsensitive
                                                                        error:nil];
    return [regex numberOfMatchesInString:text options:0 range:NSMakeRange(0, text.length)] == 1;
  }
  return NO;
}

- (NSString *)normalizeField:(NSString *)field
{
  if (field.length == 0) {
    return @"";
  }
  NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[_-]|\\s"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil];
  return [regex stringByReplacingMatchesInString:field
                                         options:0
                                           range:NSMakeRange(0, field.length)
                                    withTemplate:@""].lowercaseString;
}

- (NSString *)normalizeValue:(NSString *)value
{
  if (value.length == 0) {
    return @"";
  }
  return [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].lowercaseString;
}

- (NSString *)pruneValue:(NSString *)value forKey:(NSString *)key
{
  if (value.length == 0) {
    return @"";
  }
  if ([key isEqualToString:@"r3"]) {
    if ([value hasPrefix:@"m"] || [value hasPrefix:@"b"] || [value hasPrefix:@"ge"]) {
      value = @"m";
    } else {
      value = @"f";
    }
  } else if ([key isEqualToString:@"r4"] || [key isEqualToString:@"r5"]) {
    value = [[value componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet] invertedSet]] componentsJoinedByString:@""];
  } else if ([key isEqualToString:@"r6"]) {
    value = [FBSDKTypeUtility array:[value componentsSeparatedByString:@"-"] objectAtIndex:0];
  }
  return value;
}

@end

#endif
