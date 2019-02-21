//
//  SNRClient.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "SNRTokenOrigin.h"

@class SNRClientRegisterAccountContext;
@class SNRClientFacebookAuthenticationContext;
@class SNRClientOAuthContext;
@class SNRClientAccountInformation;
@class SNRClientUpdateAccountContext;
@class SNRClientPasswordResetRequestContext;
@class SNRClientPasswordResetConfirmationContext;

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRClient
 */

NS_SWIFT_NAME(Client)
@interface SNRClient : NSObject

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

/**
 * This method enables/disables console logs from Client SDK.
 * It is not recommended to use debug mode in release version of your application.
 *
 * @param enabled Specifies that console logs are enabled/disabled.
 */
+ (void)setLoggingEnabled:(BOOL)enabled;

/**
 * Registers new client account.
 * Please note that you should NOT allow to sign in again (or sign up) when a user is already signed in. Please sign out user first.
 * Moreover, please do not create multiple instances nor call this method multiple times before execution.
 *
 * @param context SNRClientRegisterAccountContext object with client's email, password, and other optional data. Not provided fields are not modified.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)registerAccount:(SNRClientRegisterAccountContext *)context
                success:(nullable void (^)(BOOL isSuccess))success
                failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(registerAccount(context:success:failure:));

/*
 * Confirms client's account.
 *
 * @param email Confirmation token.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)confirmAccount:(NSString *)token
               success:(nullable void (^)(BOOL isSuccess))success
               failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(confirmAccount(token:success:failure:));

/*
 * Activates client's account.
 *
 * @param email Client’s email.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)activateAccount:(NSString *)email
                success:(nullable void (^)(BOOL isSuccess))success
                failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(activateAccount(email:success:failure:));

/**
 * Signs in a client in order to obtain the JWT token, which could be used in subsequent requests.
 * This SDK will refresh token before each call if it is expiring (but not expired).
 * Please note that you should not allow to sign in again (or sign up) when a user is already signed in. Please sign out user first.
 * Moreover, please do not create multiple instances nor call this method multiple times before execution.
 *
 * @param email Client's email.
 * @param password Client's password.
 * @param deviceId Device identificator.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)signInWithEmail:(NSString *)email
               password:(NSString *)password
               deviceId:(nullable NSString *)deviceId
                success:(nullable void (^)(BOOL isSuccess))success
                failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(signIn(email:password:deviceId:success:failure:));

/**
 * Signs in a client with Facebook Token.
 *
 * @param facebookToken Token from Facebook active session.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)authenticateByFacebookWithFacebookToken:(NSString *)facebookToken
                                        context:(nullable SNRClientFacebookAuthenticationContext *)context
                                        success:(nullable void (^)(BOOL isSuccess))success
                                        failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(authenticateByFacebook(facebookToken:context:success:failure:));

/**
 * Signs in a registered client with Facebook Token.
 *
 * @param facebookToken Token from Facebook active session.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)authenticateByFacebookIfRegisteredWithFacebookToken:(NSString *)facebookToken
                                        success:(nullable void (^)(BOOL isSuccess))success
                                        failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(authenticateByFacebookIfRegistered(facebookToken:success:failure:));

/**
 * Signs in a client with OAuth Access Token.
 *
 * @param accessToken Token OAuth Access Token.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)authenticateByOAuthWithAccessToken:(NSString *)accessToken
                                    context:(nullable SNRClientOAuthContext *)context
                                    success:(nullable void (^)(BOOL isSuccess))success
                                    failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(authenticateByOAuth(accessToken:context:success:failure:));

/**
 * Checks whether client is signed in (is client's token not expired).
 */
+ (BOOL)isSignedIn;

/**
 * Signs out client.
 */
+ (void)signOut NS_SWIFT_NAME(signOut());

/**
 * Retrieves current client's token. This method provides valid token if client is signed in and current token is not expired.
 *
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getTokenWithSuccess:(nullable void (^)(NSString *token, SNRTokenOrigin origin))success
                    failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getToken(success:failure:));

/**
 * Retrieves current client's UUID.
 */
+ (NSString *)getUUID;

/**
 * Regenerates client's UUID.
 */
+ (void)regenerateUUID;

/**
 * Gets client's account information.
 *
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getAccountWithSuccess:(nullable void (^)(SNRClientAccountInformation *accountInformation))success
                      failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getAccount(success:failure:));

/**
 * Updates client's account information.
 *
 * @param context SNRClientUpdateAccountContext object with client's account information to be modified. Not provided fields are not modified.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)updateAccount:(SNRClientUpdateAccountContext *)context
              success:(nullable void (^)(BOOL isSuccess))success
              failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(updateAccount(context:success:failure:));

/**
 * Requests client's password reset with email. A client will receive a token on the provided email address in order to use.
 *
 * @param context SNRClientPasswordResetRequestContext object with client's email.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)requestPasswordReset:(SNRClientPasswordResetRequestContext *)context
                     success:(nullable void (^)(BOOL isSuccess))success
                     failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(requestPasswordReset(context:success:failure:));

/**
 * Confirms client's password reset with new password and token provided.
 *
 * @param context SNRClientPasswordResetConfirmationContext object with client's password and token.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)confirmResetPassword:(SNRClientPasswordResetConfirmationContext *)context
                     success:(nullable void (^)(BOOL isSuccess))success
                     failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(confirmResetPassword(context:success:failure:));

/**
 * Changes client's password.
 *
 * @param password Client's new password.
 * @param oldPassword Client's old password.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)changePassword:(NSString *)password
           oldPassword:(NSString *)oldPassword
               success:(nullable void (^)(BOOL isSuccess))success
               failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(changePassword(password:oldPassword:success:failure:));

/**
 * Requests client's email change.
 *
 * @param email Client's new email.
 * @param password Client's password.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)requestEmailChange:(NSString *)email
                  password:(NSString *)password
                   success:(nullable void (^)(BOOL isSuccess))success
                   failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(requestEmailChange(email:password:success:failure:));

/**
 * Confirms client's email change with provided token.
 *
 * @param token Client's token provided by email.
 * @param newsletterAgreement Agreement for newsletter with email provided.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)confirmEmailChange:(NSString *)token
        newsletterAgreement:(BOOL)newsletterAgreement
                   success:(nullable void (^)(BOOL isSuccess))success
                   failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(confirmEmailChange(token:newsletterAgreement:success:failure:));

/**
 * Requests client's email change by Facebook.
 *
 * @param email Client's new email.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)requestEmailChangeByFacebook:(NSString *)email
                             success:(nullable void (^)(BOOL isSuccess))success
                             failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(requestEmailChangeByFacebook(email:success:failure:));

/**
 * Requests client's phone update. A client will receive a code on the provided phone in order to use.
 *
 * @param phone Client's phone number.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)requestPhoneUpdate:(NSString *)phone
                   success:(nullable void (^)(BOOL isSuccess))success
                   failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(requestPhoneUpdate(phone:success:failure:));

/**
 * Confirms client's phone update with code provided.
 *
 * @param phone Client's phone number.
 * @param smsAgreement Agreement for SMS with phone number provided.
 * @param confirmationCode Client's confirmation code received by phone.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)confirmPhoneUpdate:(NSString *)phone
          confirmationCode:(NSString *)confirmationCode
              smsAgreement:(BOOL)smsAgreement
                   success:(nullable void (^)(BOOL isSuccess))success
                   failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(confirmPhoneUpdate(phone:confirmationCode:smsAgreement:success:failure:));

/**
 * Deletes client's account information.
 *
 * @param password Client's password.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)deleteAccount:(NSString *)password
              success:(nullable void (^)(BOOL isSuccess))success
              failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(deleteAccount(password:success:failure:));

/**
 * Deletes client's account information by Facebook.
 *
 * @param facebookToken Client's Token from Facebook active session.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)deleteAccountByFacebook:(NSString *)facebookToken
                        success:(nullable void (^)(BOOL isSuccess))success
                        failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(deleteAccountByFacebook(facebookToken:success:failure:));

/**
 * Registers user for push notifications.
 *
 * @param registrationToken Firebase FCM Token returned after successful push notifications registration from Firebase.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)registerForPush:(NSString *)registrationToken
                success:(nullable void (^)(BOOL isSuccess))success
                failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(registerForPush(registrationToken:success:failure:));

@end

NS_ASSUME_NONNULL_END








