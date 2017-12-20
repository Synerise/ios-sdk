//
//  SNRInjector.h
//  SyneriseSDK
//
//  Created on 12/12/2017.
//  Copyright © 2017 Synerise. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 SNRInjector is responsible for intergration with Synerise mobile content methods.
 */
@interface SNRInjector : NSObject

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

/**
 Initializes SNRInjector.

 @note This method needs to be called before any other method of SNRInjector class and only once during application lifecycle.

 @param apiKey Synerise API Key for Business Profile.
 */
+ (void)initialize:(NSString *)apiKey;

/**
 Handles incoming push notification containing mobile content data.

 @param userInfo Push notification incoming to the system.
 */
+ (void)handlePushNotification:(NSDictionary *)userInfo;

/**
 Gets onboarding from bucket identified by @c bucketName and displays it if no error has occured.

 Onboarding is like tutorial for the application. It consists of series of screens which introduces the application to the user.

 @param bucketName Bucket name. Bucket is the primary storage unit for your content.
 @param completion A block object to be executed when onboarding has finished presenting or an error occured.
 */
+ (void)showOnboardingIfPresentForBucket:(NSString *)bucketName completion:(void (^ __nullable)(void))completion;

/**
 Gets welcome screen from bucket identified by @c bucketName and displays it if no error has occured.

 Welcome screen is just a screen displayed just after opening the application.

 @param bucketName Bucket name. Bucket is the primary storage unit for your content.
 @param completion A block object to be executed when welcome screen has finished presenting or an error occured.
 */
+ (void)showWelcomeScreenIfPresentForBucket:(NSString *)bucketName completion:(void (^ __nullable)(void))completion;

@end

NS_ASSUME_NONNULL_END
