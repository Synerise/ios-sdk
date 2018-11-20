//
//  SNRClient.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright © 2018 Synerise. All rights reserved.
//

@class SNRClientRegisterAccountContext;
@class SNRClientAccountInformation;
@class SNRClientUpdateAccountContext;
@class SNRClientPasswordResetRequestContext;
@class SNRClientPasswordResetConfirmationContext;

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(Client)
@interface SNRClient : NSObject

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

/**
 * This method enables/disables console logs from Client SDK.
 * It is not recommended to use debug mode in release version of your application.
 *
 * @param enabled - specified is console logs are enabled.
 */
+ (void)setLoggingEnabled:(BOOL)enabled;

/**
 * Register new Client with email with activation, with email without activation or with phone (depending on context model), password and optional data.
 * Please note that you should NOT allow to sign in again (or sign up) when a user is already signed in. Please sign out user first.
 * Moreover, please do not create multiple instances nor call this method multiple times before execution.
 *
 * @param context SNRClientRegisterAccountContext object with client's email, password, and other optional data. Not provided fields are not modified.
 * @param success - success block.
 * @param failure - failure block.
 *
 * @note SNRIllegalArgumentError is returned in failure block when you have previously set an pool UUID (setPoolUuuid method) for which you can not register an account (either pool is the empty or other problem has occurred).
 */
+ (void)registerAccount:(SNRClientRegisterAccountContext *)context
                success:(nullable void (^)(BOOL isSuccess))success
                failure:(nullable void (^)(NSError *error))failure;

/*
 * Activates client's account.
 *
 * @param email - client’s email.
 * @param success - success block.
 * @param failure - failure block.
 *
 */
+ (void)activateAccount:(NSString *)email
                success:(nullable void (^)(BOOL isSuccess))success
                failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(activateClient(email:success:failure:));

/**
 * Log in a client in order to obtain the JWT token, which could be used in subsequent requests. The token is valid for 1 hour.
 * This SDK will refresh token before each call if it is expiring (but not expired).
 * Please note that you should NOT allow to sign in again (or sign up) when a user is already signed in. Please sign out user first.
 * Moreover, please do not create multiple instances nor call this method multiple times before execution.
 *
 * @param email - client's email.
 * @param password - client's password.
 * @param deviceId - deviceId.
 * @param success - success block.
 * @param failure - failure block.
 *
 */
+ (void)signInWithEmail:(NSString *)email
               password:(NSString *)password
               deviceId:(nullable NSString *)deviceId
                success:(nullable void (^)(BOOL isSuccess))success
                failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(signIn(email:password:deviceId:success:failure:));

/**
 * Use this method to obtain client's authorization token by Facebook.
 *
 * @param facebookToken - token from Facebook active session.
 *
 */
+ (void)authenticateByFacebookToken:(NSString *)facebookToken
                            success:(nullable void (^)(BOOL isSuccess))success
                            failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(authenticate(facebookToken:success:failure:));

/**
 * Retrieve whether client is signed in (is client's token not expired).
 */
+ (BOOL)isSignedIn;

/**
 * Logs out client.
 */
+ (void)signOut NS_SWIFT_NAME(signOut());

/**
 * Retrieves current Client authentication token. This method provides valid token if Client is logged in and current token is not expired.
 *
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)getTokenWithSuccess:(nullable void (^)(NSString *token))success
                    failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getToken(success:failure:));

/**
 * Retrieve current client's UUID.
 */
+ (NSString *)getUUID;

/**
 * Get client's account information.
 *
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)getAccountWithSuccess:(nullable void (^)(SNRClientAccountInformation *accountInformation))success
                      failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getAccount(success:failure:));

/**
 * Update client's account information with optional data.
 *
 * @param context - context object with client's account information to be modified.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)updateAccount:(SNRClientUpdateAccountContext *)context
              success:(nullable void (^)(BOOL isSuccess))success
              failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(updateAccount(context:success:failure:));

/**
 * Requests client's password reset with email. A client will receive a token on the provided email address in order to use.
 * @c [SNRProfile confirmResetPassword:success:failure] method.
 *
 * @param context - SNRClientPasswordResetRequestContext object with client's email.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)requestPasswordReset:(SNRClientPasswordResetRequestContext *)context
                     success:(nullable void (^)(BOOL isSuccess))success
                     failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(requestPasswordReset(context:success:failure:));

/**
 * Confirms client's password reset with new password and token provided.
 *
 * @param context - SNRClientPasswordResetRequestContext object with client's password and token.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)confirmResetPassword:(SNRClientPasswordResetConfirmationContext *)context
                     success:(nullable void (^)(BOOL isSuccess))success
                     failure:(nullable void (^)(NSError *error))failure;

/**
 * Change client's password.
 *
 * @param password - new client's password.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)changePassword:(NSString *)password
           oldPassword:(NSString *)oldPassword
               success:(nullable void (^)(BOOL isSuccess))success
               failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(changePassword(password:oldPassword:success:failure:));

/**
 * Update client's phone number request.
 *
 * @param phone - client's phone number.
 * @param success - success block.
 * @param failure - failure block.
 *
 */
+ (void)requestPhoneUpdate:(NSString *)phone
                   success:(nullable void (^)(BOOL isSuccess))success
                   failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(requestPhoneUpdate(phone:success:failure:));

/**
 * Confirm client's phone number update.
 *
 * @param phone - client's phone number.
 * @param confirmationCode - client's confirmation code received by phone.
 * @param success - success block.
 * @param failure - failure block.
 *
 */
+ (void)confirmPhoneUpdate:(NSString *)phone
          confirmationCode:(NSString *)confirmationCode
                   success:(nullable void (^)(BOOL isSuccess))success
                   failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(confirmPhoneNumber(phone:confirmationCode:success:failure:));

/**
 * Delete client's account information.
 *
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)deleteAccountWithSuccess:(nullable void (^)(BOOL isSuccess))success
                         failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(deleteAccount(success:failure:));

/**
 * Registers user for push notifications.
 *
 * @param registrationToken - Firebase FCM Token returned after successful push notifications registration from Firebase.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)registerForPush:(NSString *)registrationToken
                success:(nullable void (^)(BOOL isSuccess))success
                failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(registerForPush(registrationToken:success:failure:));

@end

NS_ASSUME_NONNULL_END








