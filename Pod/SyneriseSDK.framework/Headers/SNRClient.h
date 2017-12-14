//
//  SNRClient.h
//  SyneriseSDK
//
//  Created on 27/11/2017.
//  Copyright © 2017 Synerise. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SNRClientUpdateAccountContext;
@class SNRClientAccountInformation;
@class SNRClientAuthConfig;

NS_ASSUME_NONNULL_BEGIN

@interface SNRClient : NSObject

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

/**
 Initializes SNRClient module.

 @note This method needs to be called before any other method of SNRTracker class and only once during application lifecycle.

 @param apiKey Synerise API Key.
 */
+ (void)initialize:(NSString * _Nonnull)apiKey;

/**
 Initializes SNRClient module.

 @note This method needs to be called before any other method of SNRTracker class and only once during application lifecycle.

 @param apiKey Synerise API Key.
 @param config Custom configuration for Synerise Client Authorization API.
 */
+ (void)initialize:(NSString * _Nonnull)apiKey
            config:(SNRClientAuthConfig * _Nonnull)config;

/**
 Log in a client in order to obtain the JWT token, which could be used in subsequent requests. The token is valid for 1 hour.
 This SDK will refresh token before each call if it is expiring (but not expired).

 @param email client's email
 @param password client's password
 @param deviceId deviceId
 @param success success block
 @param failure failure block
 */
+ (void)logIn:(NSString *)email
     password:(NSString *)password
     deviceId:(NSString * _Nullable)deviceId
      success:(nullable void (^)(BOOL isSuccess))success
      failure:(nullable void (^)(NSError *error))failure;

/**
 Logs out client.
 */
+ (void)logOut;

/**
 Get client's account information.

 @param success success block
 @param failure failure block
 */
+ (void)getAccountWithSuccess:(nullable void (^)(SNRClientAccountInformation * information))success
                      failure:(nullable void (^)(NSError *error))failure;

/**
 Update client's account information with optional data.

 @param context object with client's account information to be modified.
 @param success success block
 @param failure failure block
 */
+ (void)updateAccount:(SNRClientUpdateAccountContext *)context
              success:(nullable void (^)(BOOL isSuccess))success
              failure:(nullable void (^)(NSError *error))failure;


/**
 This method enables/disables console logs from Client SDK.
 It is not recommended to use debug mode in release version of your application.

 @param enabled specified is console logs are enabled
 */
+ (void)setLoggingEnabled:(BOOL)enabled;

@end

NS_ASSUME_NONNULL_END
