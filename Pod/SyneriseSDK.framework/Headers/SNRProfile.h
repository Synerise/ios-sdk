//
//  SNRProfile.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

@class UIDevice;

@class SNRClientProfileContext;
@class SNRUpdateClientContext;
@class SNRCreateClientContext;
@class SNRRegisterClientContext;
@class SNRClientPasswordResetRequestContext;
@class SNRClientPasswordResetConfirmationContext;
@class SNRProfilePromotionResponse;
@class SNRProfilePromotion;
@class SNRVoucherInformation;
@class SNRVoucherCodesResponse;

/**
 * SNRProfile is responsible for integration with Synerise profile methods.
 */

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(Profile)
@interface SNRProfile : NSObject

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

/**
 * Enables/disables console logs from SNRProfile.
 *
 * @note It is not recommended to use debug mode in release version of your application.
 *
 * @param enabled Enables/disables console logs.
 */
+ (void)setLoggingEnabled:(BOOL)enabled;

/**
 * Sets pool's universally unique identifier.
 *
 * Provide your pool's universally unique identifier to assign available voucher to the customer right before registration.
 *
 * @param poolUuid pool's universally unique identifier.
 */
+ (void)setPoolUuid:(NSString *)poolUuid;

/**
 * Initializes SNRProfile module.
 *
 * @note This method needs to be called before any other method of SNRProfile class and only once during application lifecycle.
 *
 * @param apiKey Synerise API Key.
 */
+ (void)initialize:(NSString *)apiKey;

/**
 * Get client with email.
 * Note, that you have to be logged in as business profile and use API Key, which has REALM_CLIENT scope assigned
 * or you have to be logged in as a user and have a ROLE_CLIENT_SHOW role assigned.
 *
 * @param clientEmail - client’s email
 * @param success success block.
 * @param failure failure block.
 *
 * @throws NSInvalidArgumentException if an email is invalid. Email should be valid.
 */
+ (void)getClient:(NSString *)clientEmail
          success:(nullable void (^)(SNRClientProfileContext *context))success
          failure:(nullable void (^)(NSError *error))failure;

/**
 * Creates a new client record if no identifier has been assigned for him before in Synerise.
 *
 * @param context SNRCreateClientContext object with client's optional data. Not provided fields are not modified.
 * @param success A block object to be executed when the request finishes successfully. This block has no return value and takes one BOOL argument.
 * @param failure A block object to be executed when the request fails. This block has no return value and takes one @c NSError argument.
 */
+ (void)createClient:(SNRCreateClientContext *)context
             success:(nullable void (^)(BOOL isSuccess))success
             failure:(nullable void (^)(NSError *error))failure;

/**
 * Register new Client with email with activation, with email without activation or with phone (depending on context model), password and optional data.
 * Please note that you should NOT allow to sign in again (or sign up) when a user is already signed in. Please sign out user first.
 * Moreover, please do not create multiple instances nor call this method multiple times before execution.
 *
 * @param context SNRRegisterClientContext object with client's email, password, and other optional data. Not provided fields are not modified.
 * @param success A block object to be executed when the request finishes successfully. This block has no return value and takes one BOOL argument.
 * @param failure A block object to be executed when the request fails. This block has no return value and takes one @c NSError argument.
 *
 * @throws NSIllegalArgumentException if unable to obtain a code from poolUuid (either pool is the empty or other problem has occurred).
 */
+ (void)registerClient:(SNRRegisterClientContext *)context
               success:(nullable void (^)(BOOL isSuccess))success
               failure:(nullable void (^)(NSError *error))failure;

/*
 * Activates client's account.
 *
 * @param email - client’s email.
 * @param success - success block.
 * @param failure - failure block.
 *
 * @throws NSInvalidArgumentException if an email is invalid. Email should be valid.
 *
 */
+ (void)activateAccount:(NSString *)email
                success:(nullable void (^)(BOOL isSuccess))success
                failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(activateAccount(email:success:failure:));

/**
 * Confirm account with confirmation code received by phone.
 *
 * @param phone client's phone.
 * @param confirmationCode client's confirmation code received by phone.
 * @param success success block.
 * @param failure failure block.
 *
 * @throws NSInvalidArgumentException if phone is invalid - phone number should match ^(\\+[0-9]{6,19})|([0-9]{6,20})$ regex pattern.
 */
+ (void)confirmAccountWithPhone:(NSString *)phone
               confirmationCode:(NSString *)confirmationCode
                        success:(nullable void (^)(BOOL isSuccess))success
                        failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(confirmAccount(phone:confirmationCode:success:failure:));

/**
 * Updates client with id and optional data.
 *
 * @param clientId client's id
 * @param context SNRUpdateClientContext object with client's optional data. Not provided fields are not modified.
 * @param success A block object to be executed when the request finishes successfully. This block has no return value and takes one BOOL argument.
 * @param failure A block object to be executed when the request fails. This block has no return value and takes one @c NSError argument.
 */
+ (void)updateClient:(NSInteger)clientId
             context:(SNRUpdateClientContext *)context
             success:(nullable void (^)(BOOL isSuccess))success
             failure:(nullable void (^)(NSError *error))failure;

/**
 * Deletes client with provided id
 *
 * @param clientId client's id to be deleted.
 * @param success A block object to be executed when the request finishes successfully. This block has no return value and takes one BOOL argument.
 * @param failure A block object to be executed when the request fails. This block has no return value and takes one @c NSError argument.
 */
+ (void)deleteClient:(NSInteger)clientId
             success:(nullable void (^)(BOOL isSuccess))success
             failure:(nullable void (^)(NSError *error))failure;

/**
 * Requests client's password reset with email. A client will receive a token on the provided email address in order to use.
 * @c [SNRProfile confirmResetPassword:success:failure] method.
 *
 * @param context SNRClientPasswordResetRequestContext object with client's email.
 * @param success A block object to be executed when the request finishes successfully. This block has no return value and takes one BOOL argument.
 * @param failure A block object to be executed when the request fails. This block has no return value and takes one @c NSError argument.
 */
+ (void)resetPassword:(SNRClientPasswordResetRequestContext *)context
              success:(nullable void (^)(BOOL isSuccess))success
              failure:(nullable void (^)(NSError *error))failure;

/**
 * Confirms client's password reset with new password and token provided.
 *
 * @param context SNRClientPasswordResetRequestContext object with client's password and token.
 * @param success A block object to be executed when the request finishes successfully. This block has no return value and takes one BOOL argument.
 * @param failure A block object to be executed when the request fails. This block has no return value and takes one @c NSError argument.
 */
+ (void)confirmResetPassword:(SNRClientPasswordResetConfirmationContext *)context
                     success:(nullable void (^)(BOOL isSuccess))success
                     failure:(nullable void (^)(NSError *error))failure;

/**
 * Use this method to get all available promotions that are defined for your business profile.
 *
 * @param success success block.
 * @param failure failure block.
 */
+ (void)getPromotionsWithSuccess:(nullable void (^)(SNRProfilePromotionResponse *promotionResponse))success
                         failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotions(success:failure:));

/**
 * Use this method to get promotions with external ID specified as externalId param.
 *
 * @param externalId specified in promotion.
 * @param success success block.
 * @param failure failure block.
 */
+ (void)getPromotionsByExternalId:(NSString *)externalId
                          success:(nullable void (^)(SNRProfilePromotionResponse *promotionResponse))success
                          failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotions(externalId:success:failure:));

/**
 * Use this method to get promotions with phone number specified as phoneNumber param.
 *
 * @param phoneNumber specified in promotion.
 * @param success success block.
 * @param failure failure block.
 */
+ (void)getPromotionsByPhoneNumber:(NSString *)phoneNumber
                           success:(nullable void (^)(SNRProfilePromotionResponse *promotionResponse))success
                           failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotions(phoneNumber:success:failure:));

/**
 * Use this method to get promotions with client ID specified as clientId param.
 *
 * @param clientId specified in promotion.
 * @param success success block.
 * @param failure failure block.
 */
+ (void)getPromotionsByClientId:(NSString *)clientId
                        success:(nullable void (^)(SNRProfilePromotionResponse *promotionResponse))success
                        failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotions(clientId:success:failure:));

/**
 * Use this method to get promotions with email specified as email param.
 *
 * @param email specified in promotion.
 * @param success success block.
 * @param failure failure block.
 */
+ (void)getPromotionsByEmail:(NSString *)email
                     success:(nullable void (^)(SNRProfilePromotionResponse *promotionResponse))success
                     failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotions(email:success:failure:));

/**
 * Use this method to get promotion with UUID specified as uuid param.
 *
 * @param uuid specified in promotion.
 * @param success success block.
 * @param failure failure block.
 */
+ (void)getPromotionByUuid:(NSString *)uuid
                   success:(nullable void (^)(SNRProfilePromotion *promotion))success
                   failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotion(uuid:success:failure:));

/**
 * Use this method to get promotion with code specified as code param.
 *
 * @param code specified in promotion.
 * @param success success block.
 * @param failure failure block.
 */
+ (void)getPromotionByCode:(NSString *)code
                   success:(nullable void (^)(SNRProfilePromotion *promotion))success
                   failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotion(code:success:failure:));

/**
 * Use this method to redeem promotion with specified phone number and promotion code.
 *
 * @param phoneNumber specified in promotion.
 * @param promotionCode specified in promotion.
 * @param success success block.
 * @param failure failure block.
 */
+ (void)redeemPromotionByPhoneNumber:(NSString *)phoneNumber
                       promotionCode:(NSString *)promotionCode
                             success:(nullable void (^)(BOOL isSuccess))success
                             failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(redeemPromotion(phoneNumber:promotionCode:success:failure:));

/**
 * Use this method to redeem promotion with specified client ID and promotion code.
 *
 * @param clientId specified in promotion.
 * @param promotionCode specified in promotion.
 * @param success success block.
 * @param failure failure block.
 */
+ (void)redeemPromotionByClientId:(NSString *)clientId
                    promotionCode:(NSString *)promotionCode
                          success:(nullable void (^)(BOOL isSuccess))success
                          failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(redeemPromotion(clientId:promotionCode:success:failure:));

/**
 * Use this method to redeem promotion with specified custom ID and promotion code.
 *
 * @param customId specified in promotion.
 * @param promotionCode specified in promotion.
 * @param success success block.
 * @param failure failure block.
 */
+ (void)redeemPromotionByCustomId:(NSString *)customId
                    promotionCode:(NSString *)promotionCode
                          success:(nullable void (^)(BOOL isSuccess))success
                          failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(redeemPromotion(customId:promotionCode:success:failure:));

/**
 * Use this method to redeem promotion with specified email and promotion code.
 *
 * @param email specified in promotion.
 * @param promotionCode specified in promotion.
 * @param success success block.
 * @param failure failure block.
 */
+ (void)redeemPromotionByEmail:(NSString *)email
                 promotionCode:(NSString *)promotionCode
                       success:(nullable void (^)(BOOL isSuccess))success
                       failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(redeemPromotion(email:promotionCode:success:failure:));

/**
 * Registers user for push notifications.
 *
 * @param registrationToken device token string returned after successful push notifications registration on a device or @c fcmToken from Firebase.
 * @param success A block object to be executed when the request finishes successfully. This block has no return value and takes one BOOL argument.
 * @param failure A block object to be executed when the request fails. This block has no return value and takes one @c NSError argument.
 */
+ (void)registerForPush:(NSString *)registrationToken
                success:(nullable void (^)(BOOL isSuccess))success
                failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(registerForPush(registrationToken:success:failure:));

/**
 * Retrieves current Profile authentication token. This method provides valid token if Profile is initialized.
 *
 * @param success A block object to be executed when the request finishes successfully. This block has no return value and takes one argument containing Profile authentication token.
 * @param failure A block object to be executed when the request fails. This block has no return value and takes one @c NSError argument.
 */
+ (void)getTokenWithSuccess:(nullable void (^)(NSString *token))success
                    failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getToken(success:failure:));

@end

NS_ASSUME_NONNULL_END
