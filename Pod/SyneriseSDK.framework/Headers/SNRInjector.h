//
//  SNRInjector.h
//  SyneriseSDK
//
//  Created on 12/12/2017.
//  Copyright © 2017 Synerise. All rights reserved.
//

/**
 SNRInjector is responsible for intergration with Synerise mobile content methods.
 */
@interface SNRInjector : NSObject

NS_ASSUME_NONNULL_BEGIN

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

/**
 Enables/disables console logs from SNRInjector.
 
 @note It is not recommended to use debug mode in release version of your application.
 
 @param enabled Enables/disables console logs.
 */
+ (void)setLoggingEnabled:(BOOL)enabled;

/**
 Initializes SNRInjector.

 @note This method needs to be called before any other method of SNRInjector class and only once during application lifecycle.

 @param apiKey Synerise API Key for Business Profile.
 */
+ (void)initialize:(NSString *)apiKey;

NS_ASSUME_NONNULL_END

@end
