//
//  SNRClient.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2020 Synerise. All rights reserved.
//

#import "SNRTokenOrigin.h"
#import "SNRClientSessionEndReason.h"

@class SNRClientEventsApiQuery;
@class SNRClientRegisterAccountContext;
@class SNRClientOAuthAuthenticationContext;
@class SNRClientFacebookAuthenticationContext;
@class SNRClientAppleSignInAuthenticationContext;
@class SNRClientAccountInformation;
@class SNRClientEventData;
@class SNRClientUpdateAccountContext;
@class SNRClientPasswordResetRequestContext;
@class SNRClientPasswordResetConfirmationContext;
@class SNRToken;

NS_ASSUME_NONNULL_BEGIN

/**
 * @protocol SNRClientStateDelegate
 *
 * A protocol to handle Client's sign-in state changes.
 *
 */

NS_SWIFT_NAME(ClientStateDelegate)
@protocol SNRClientStateDelegate

@optional

/**
 * This method is called when the client signs in.
 */
- (void)SNR_clientIsSignedIn NS_SWIFT_NAME(snr_clientIsSignedIn());

/**
 * This method is called when the client signs out.
 *
 * @param reason Specifies the reason for signing out.
 */
- (void)SNR_clientIsSignedOutWithReason:(SNRClientSessionEndReason)reason NS_SWIFT_NAME(snr_clientIsSignedOut(reason:));

@end


/**
 * @class SNRClient
 */

NS_SWIFT_NAME(Client)
@interface SNRClient : NSObject

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

/**
 * This method enables/disables console logs from Client SDK.
 * It is not recommended to use debug mode in release version of your application.
 *
 * @param enabled Specifies that console logs are enabled/disabled.
 */
+ (void)setLoggingEnabled:(BOOL)enabled;

/**
 * Sets object for Client's state delegate methods.
 *
 * @param delegate An object that implement SNRClientStateDelegate protocol.
 */
+ (void)setClientStateDelegate:(id<SNRClientStateDelegate>)delegate;

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
                success:(void (^)(BOOL isSuccess))success
                failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(registerAccount(context:success:failure:));

/*
 * Confirms client's account.
 *
 * @param email Confirmation token.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)confirmAccount:(NSString *)token
               success:(void (^)(BOOL isSuccess))success
               failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(confirmAccount(token:success:failure:));

/*
 * Activates client's account.
 *
 * @param email Client’s email.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)activateAccount:(NSString *)email
                success:(void (^)(BOOL isSuccess))success
                failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(activateAccount(email:success:failure:));

/**
 * Signs in a client in order to obtain the JWT token, which could be used in subsequent requests.
 * This SDK will refresh token before each call if it is expiring (but not expired).
 * Please note that you should not allow to sign in again (or sign up) when a user is already signed in. Please sign out user first.
 * Moreover, please do not create multiple instances nor call this method multiple times before execution.
 *
 * @param email Client's email.
 * @param password Client's password.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)signInWithEmail:(NSString *)email
               password:(NSString *)password
                success:(void (^)(BOOL isSuccess))success
                failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(signIn(email:password:success:failure:));

/**
 * Signs in a client with OAuth Access Token.
 *
 * @param accessToken Token OAuth Access Token.
 * @param authID Authorization custom identity.
 * @param context SNRClientOAuthContext object with agreements and optional attributes.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)authenticateByOAuthWithAccessToken:(NSString *)accessToken
                                    authID:(nullable NSString *)authID
                                   context:(nullable SNRClientOAuthAuthenticationContext *)context
                                   success:(void (^)(BOOL isSuccess))success
                                   failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(authenticateByOAuth(accessToken:authID:context:success:failure:));

/**
 * Signs in a registered client with OAuth Access Token.
 *
 * @param accessToken Token OAuth Access Token.
 * @param authID Authorization custom identity.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)authenticateByOAuthIfRegisteredWithAccessToken:(NSString *)accessToken
                                    authID:(nullable NSString *)authID
                                   success:(void (^)(BOOL isSuccess))success
                                   failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(authenticateByOAuthIfRegistered(accessToken:authID:success:failure:));

/**
 * Signs in a client with Facebook Token.
 *
 * @param facebookToken Token from Facebook active session.
 * @param authID Authorization custom identity.
 * @param context SNRClientFacebookAuthenticationContext object with agreements and optional attributes.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)authenticateByFacebookWithFacebookToken:(NSString *)facebookToken
                                         authID:(nullable NSString *)authID
                                        context:(nullable SNRClientFacebookAuthenticationContext *)context
                                        success:(void (^)(BOOL isSuccess))success
                                        failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(authenticateByFacebook(facebookToken:authID:context:success:failure:));

/**
 * Signs in a registered client with Facebook Token.
 *
 * @param facebookToken Token from Facebook active session.
 * @param authID Authorization custom identity.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)authenticateByFacebookIfRegisteredWithFacebookToken:(NSString *)facebookToken
                                                     authID:(nullable NSString *)authID
                                                    success:(void (^)(BOOL isSuccess))success
                                                    failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(authenticateByFacebookIfRegistered(facebookToken:authID:success:failure:));

/**
 * Signs in a client with Sign In With Apple.
 *
 * @param identityToken Token from Sign In With Apple session.
 * @param authID Authorization custom identity.
 * @param context SNRClientAppleSignInAuthenticationContext object with agreements and optional attributes.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)authenticateByAppleSignInWithIdentityToken:(NSData *)identityToken
                                            authID:(nullable NSString *)authID
                                           context:(nullable SNRClientAppleSignInAuthenticationContext *)context
                                           success:(void (^)(BOOL isSuccess))success
                                           failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(authenticateByAppleSignIn(identityToken:authID:context:success:failure:));

/**
 * Signs in a registered client with Sign In With Apple.
 *
 * @param identityToken Token from Sign In With Apple session.
 * @param authID Authorization custom identity.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)authenticateByAppleSignInIfRegisteredWithIdentityToken:(NSData *)identityToken
                                            authID:(nullable NSString *)authID
                                           success:(void (^)(BOOL isSuccess))success
                                           failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(authenticateByAppleSignInIfRegistered(identityToken:authID:success:failure:));

/**
 * Checks whether client is signed in (is client's token not expired).
 */
+ (BOOL)isSignedIn;

/**
 * Signs out client.
 */
+ (void)signOut NS_SWIFT_NAME(signOut());

/**
 * Use this method to refresh your token.
 *
*/
+ (void)refreshTokenWithSuccess:(void (^)(void))success
                        failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(refreshToken(success:failure:));

/**
 * Retrieves current client's token. This method provides valid token if client is signed in and current token is not expired.
 *
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 *
 * @deprecated Deprecated in version 3.4.10
 */
+ (void)getTokenWithSuccess:(void (^)(NSString *token, SNRTokenOrigin origin))success
                    failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(getToken(success:failure:)) DEPRECATED_MSG_ATTRIBUTE("Use `Client.retrieveToken(token:success:failure:)` instead.");

/**
 * Retrieves current client's token. This method provides valid token if client is signed in and current token is not expired.
 *
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)retrieveTokenWithSuccess:(void (^)(SNRToken *token))success
                         failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(retrieveToken(success:failure:));

/**
 * Retrieves current client's UUID.
 */
+ (NSString *)getUUID;

/**
 * Regenerates client's UUID and clear authentication token, eventual login, custom email and custom identifier.
 * Please note that this operation works only if current client is anonymous.
 */
+ (BOOL)regenerateUUID;

/**
 * Regenerates client's UUID and clear authentication token, eventual login, custom email and custom identifier.
 * Please note that this operation works only if current client is anonymous.
 *
 * @param clientIdentifier It is a seed for UUID generation.
 */
+ (BOOL)regenerateUUIDWithClientIdentifier:(nullable NSString *)clientIdentifier NS_SWIFT_NAME(regenerateUUID(clientIdentifier:));

/**
 * Destroys the whole session completely.
 */
+ (void)destroySession NS_SWIFT_NAME(destroySession());

/**
 * Gets client's account information.
 *
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getAccountWithSuccess:(void (^)(SNRClientAccountInformation *accountInformation))success
                      failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(getAccount(success:failure:));

/**
 * Retrieves events for authenticated client.
 *
 * @param apiQuery SNRClientEventsApiQuery object responsible for storing all query parameters.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getEventsWithApiQuery:(SNRClientEventsApiQuery *)apiQuery
                      success:(void (^)(NSArray<SNRClientEventData *> *events))success
                      failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(getEvents(apiQuery:success:failure:));

/**
 * Updates client's account information.
 *
 * @param context SNRClientUpdateAccountContext object with client's account information to be modified. Not provided fields are not modified.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)updateAccount:(SNRClientUpdateAccountContext *)context
              success:(void (^)(BOOL isSuccess))success
              failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(updateAccount(context:success:failure:));

/**
 * Requests client's password reset with email. A client will receive a token on the provided email address in order to use.
 *
 * @param context SNRClientPasswordResetRequestContext object with client's email.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)requestPasswordReset:(SNRClientPasswordResetRequestContext *)context
                     success:(void (^)(BOOL isSuccess))success
                     failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(requestPasswordReset(context:success:failure:));

/**
 * Confirms client's password reset with new password and token provided.
 *
 * @param context SNRClientPasswordResetConfirmationContext object with client's password and token.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)confirmResetPassword:(SNRClientPasswordResetConfirmationContext *)context
                     success:(void (^)(BOOL isSuccess))success
                     failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(confirmResetPassword(context:success:failure:));

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
               success:(void (^)(BOOL isSuccess))success
               failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(changePassword(password:oldPassword:success:failure:));

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
                   success:(void (^)(BOOL isSuccess))success
                   failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(requestEmailChange(email:password:success:failure:));

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
                   success:(void (^)(BOOL isSuccess))success
                   failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(confirmEmailChange(token:newsletterAgreement:success:failure:));

/**
 * Requests client's email change by Facebook.
 *
 * @param email Client's new email.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)requestEmailChangeByFacebook:(NSString *)email
                             success:(void (^)(BOOL isSuccess))success
                             failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(requestEmailChangeByFacebook(email:success:failure:));

/**
 * Requests client's phone update. A client will receive a code on the provided phone in order to use.
 *
 * @param phone Client's phone number.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)requestPhoneUpdate:(NSString *)phone
                   success:(void (^)(BOOL isSuccess))success
                   failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(requestPhoneUpdate(phone:success:failure:));

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
                   success:(void (^)(BOOL isSuccess))success
                   failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(confirmPhoneUpdate(phone:confirmationCode:smsAgreement:success:failure:));

/**
 * Deletes client's account information.
 *
 * @param password Client's password.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)deleteAccount:(NSString *)password
              success:(void (^)(BOOL isSuccess))success
              failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(deleteAccount(password:success:failure:));

/**
 * Deletes client's account information by OAuth.
 *
 * @param accessToken Client's Token from Facebook active session.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)deleteAccountByOAuth:(NSString *)accessToken
                        success:(void (^)(BOOL isSuccess))success
                        failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(deleteAccountByOAuth(accessToken:success:failure:));

/**
 * Deletes client's account information by Facebook.
 *
 * @param facebookToken Client's Token from Facebook active session.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)deleteAccountByFacebook:(NSString *)facebookToken
                        success:(void (^)(BOOL isSuccess))success
                        failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(deleteAccountByFacebook(facebookToken:success:failure:));

/**
 * Deletes client's account information by Sign In With Apple.
 *
 * @param identityToken Client's Token from Facebook active session.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)deleteAccountByAppleSignIn:(NSData *)identityToken
                        success:(void (^)(BOOL isSuccess))success
                        failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(deleteAccountByAppleSignIn(identityToken:success:failure:));

/**
 * Method to recognize anonymous users and save personal information per their CRM entries.
 *
 * @param email Client's email.
 * @param customIdentify Client's custom identifier.
 * @param parameters Client's custom parameters.
 */
+ (void)recognizeAnonymousWithEmail:(nullable NSString *)email customIdentify:(nullable NSString *)customIdentify parameters:(nullable NSDictionary *)parameters NS_SWIFT_NAME(recognizeAnonymous(email:customIdentify:parameters:));


/**
 * Registers user for push notifications.
 *
 * @param registrationToken Firebase FCM Token returned after successful push notifications registration from Firebase.
 * @param mobilePushAgreement Agreement (consent) for mobile push campaigns.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)registerForPush:(NSString *)registrationToken
    mobilePushAgreement:(BOOL)mobilePushAgreement
                success:(void (^)(BOOL isSuccess))success
                failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(registerForPush(registrationToken:mobilePushAgreement:success:failure:));

@end

NS_ASSUME_NONNULL_END








