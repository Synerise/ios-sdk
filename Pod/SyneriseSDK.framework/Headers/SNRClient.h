//
//  SNRClient.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

@class SNRClientUpdateAccountContext;
@class SNRClientAccountInformation;
@class SNRClientAuthConfig;

/**
 * SNRClient is responsible for tracking various SNREvents.
 */

NS_SWIFT_NAME(Client)
@interface SNRClient : NSObject

NS_ASSUME_NONNULL_BEGIN

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

/**
 * This method enables/disables console logs from Client SDK.
 * It is not recommended to use debug mode in release version of your application.
 *
 * @param enabled specified is console logs are enabled.
 */
+ (void)setLoggingEnabled:(BOOL)enabled;

/**
 * Initializes SNRClient module.
 *
 * @note This method needs to be called before any other method of SNRTracker class and only once during application lifecycle.
 *
 * @param apiKey Synerise API Key.
 */
+ (void)initialize:(NSString * _Nonnull)apiKey;

/**
 * Initializes SNRClient module.
 *
 * @note This method needs to be called before any other method of SNRTracker class and only once during application lifecycle.
 *
 * @param apiKey Synerise API Key.
 * @param config Custom configuration for Synerise Client Authorization API.
 */
+ (void)initialize:(NSString * _Nonnull)apiKey
            config:(SNRClientAuthConfig * _Nonnull)config;

/**
 * Log in a client in order to obtain the JWT token, which could be used in subsequent requests. The token is valid for 1 hour.
 * This SDK will refresh token before each call if it is expiring (but not expired).
 * Please note that you should NOT allow to sign in again (or sign up) when user is already signed in. Please sign out user first.
 * Moreover, please do not create multiple instances nor call this method multiple times before execution.
 *
 * @param email client's email.
 * @param password client's password.
 * @param deviceId deviceId.
 * @param success success block.
 * @param failure failure block.
 */
+ (void)logIn:(NSString *)email
     password:(NSString *)password
     deviceId:(NSString * _Nullable)deviceId
      success:(nullable void (^)(BOOL isSuccess))success
      failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(login(email:password:deviceId:sucess:failure:));

/**
 * Logs out client.
 */
+ (void)logOut NS_SWIFT_NAME(logout());

/**
 * Get client's account information.
 *
 * @param success success block.
 * @param failure failure block.
 */
+ (void)getAccountWithSuccess:(nullable void (^)(SNRClientAccountInformation * information))success
                      failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getAccount(success:failure:));

/**
 * Update client's account information with optional data.
 *
 * @param context object with client's account information to be modified.
 * @param success success block.
 * @param failure failure block.
 */
+ (void)updateAccount:(SNRClientUpdateAccountContext *)context
              success:(nullable void (^)(BOOL isSuccess))success
              failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(updateAccount(context:success:failure:));

/**
 * Retrieves currrent Client authentication token. This method provide valid token if Client is logged in and current token is not expired.
 *
 * @param success A block object to be executed when the request finishes successfully. This block has no return value and takes one argument containing Client authentication token.
 * @param failure A block object to be executed when the request fails. This block has no return value and takes one @c NSError argument.
 */
+ (void)getTokenWithSuccess:(nullable void (^)(NSString * _Nonnull token))success
                    failure:(nullable void (^)(NSError * _Nonnull error))failure NS_SWIFT_NAME(getToken(success:failure:));

NS_ASSUME_NONNULL_END

@end
