//
//  SNRSynerise.h
//  SyneriseSDK
//
//  Copyright © 2017 Synerise. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SNRSyneriseDelegate

- (void)syneriseUserInteractionWithURL:(NSURL*)url;
- (void)syneriseUserInteractionWithDeepLink:(NSURL*)url;

@end

@interface SNRSynerise : NSObject

+ (instancetype)new __unavailable;
- (instancetype)init __unavailable;

+ (void)initializeWithBusinessProfileApiKey:(NSString*)businessProfileApiKey andClientApiKey:(NSString*)clientApiKey;
+ (void)setDelegate:(id<SNRSyneriseDelegate>)delegate;

+ (BOOL)isSyneriseNotification:(NSDictionary*)userInfo;
+ (void)handleNotification:(NSDictionary*)userInfo;

@end

NS_ASSUME_NONNULL_END
