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
- (void)syneriseUserInteractionWithDeepLink:(NSString*)deepLink;

@end

@interface SNRSynerise : NSObject

+ (instancetype)new __unavailable;
- (instancetype)init __unavailable;

/**
 Initializes SyneriseSDK.
 
 @note This method needs to be called before any other method of SyneriseSDK and only once during application lifecycle.
 
 @param businessProfileApiKey Synerise API Key for Business Profile.
 @param clientApiKey Synerise API Key for Business Profile.
 */
+ (void)initializeWithBusinessProfileApiKey:(NSString*)businessProfileApiKey andClientApiKey:(NSString*)clientApiKey;

/**
 Initializes SyneriseSDK.
 
 @note This method
 
 @param delegate object that implement SyneriseSDK callback methods
 */
+ (void)setDelegate:(id<SNRSyneriseDelegate>)delegate;

/**
 * This method checkes that notification's sender is Synerise
 *
 * @param userInfo Key-Value map of data. Key "issuer" must be set to "Synerise" value.
 */
+ (BOOL)isSyneriseNotification:(NSDictionary*)userInfo;

/**
 * This method handles new push message and starts activity, which build proper views from provided data.
 *
 * @param userInfo Key-Value map of data. Key "issuer" must be set to "Synerise" value.
 */
+ (void)handleNotification:(NSDictionary*)userInfo;

@end

NS_ASSUME_NONNULL_END
