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
@class SNRClientPromotionResponse;
@class SNRClientPromotion;
@class SNRVoucherInformation;
@class SNRVoucherCodesResponse;
@class SNRAssignVoucherResponse;

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
 * @param enabled - specified is console logs are enabled.
 */
+ (void)setLoggingEnabled:(BOOL)enabled;

/**
 * Sets pool's universally unique identifier.
 *
 * Provide your pool's universally unique identifier to assign available voucher to the customer right before registration.
 *
 * @param poolUuid - pool's universally unique identifier.
 */
+ (void)setPoolUuid:(NSString *)poolUuid;

/**
 * Initializes SNRProfile module.
 *
 * @note This method needs to be called before any other method of SNRProfile class and only once during application lifecycle.
 *
 * @param apiKey - Synerise API Key.
 */
+ (void)initialize:(NSString *)apiKey;

/**
 * Retrieves current Profile authentication token. This method provides valid token if Profile is initialized.
 *
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)getTokenWithSuccess:(nullable void (^)(NSString *token))success
                    failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getToken(success:failure:));

/**
 * Get client with email.
 * Note, that you have to be logged in as business profile and use API Key, which has REALM_CLIENT scope assigned
 * or you have to be logged in as a user and have a ROLE_CLIENT_SHOW role assigned.
 *
 * @param clientEmail - client’s email.
 * @param success - success block.
 * @param failure - failure block.
 *
 */
+ (void)getClient:(NSString *)clientEmail
          success:(nullable void (^)(SNRClientProfileContext *context))success
          failure:(nullable void (^)(NSError *error))failure;

/**
 * Creates a new client record if no identifier has been assigned for him before in Synerise.
 *
 * @param context - SNRCreateClientContext object with client's optional data. Not provided fields are not modified.
 * @param success - success block.
 * @param failure - failure block.
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
 * @param success - success block.
 * @param failure - failure block.
 *
 * @note SNRIllegalArgumentError is returned in failure block when you have previously set an pool UUID (setPoolUuuid method) for which you can not register an account (either pool is the empty or other problem has occurred).
 */
+ (void)registerClient:(SNRRegisterClientContext *)context
               success:(nullable void (^)(BOOL isSuccess))success
               failure:(nullable void (^)(NSError *error))failure;

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

/*
 * Activates client's account.
 *
 * @param email - client’s email.
 * @param success - success block.
 * @param failure - failure block.
 *
 */
+ (void)activateClient:(NSString *)email
               success:(nullable void (^)(BOOL isSuccess))success
               failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(activateClient(email:success:failure:));

/**
 * Confirm account with confirmation code received by phone.
 *
 * @param phone - client's phone.
 * @param confirmationCode - client's confirmation code received by phone.
 * @param success - success block.
 * @param failure - failure block.
 *
 */
+ (void)confirmPhoneRegistrationWithPhone:(NSString *)phone
                         confirmationCode:(NSString *)confirmationCode
                                  success:(nullable void (^)(BOOL isSuccess))success
                                  failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(confirmPhoneRegistration(phone:confirmationCode:success:failure:));

/**
 * Updates client with id and optional data.
 *
 * @param clientId - client's id.
 * @param context - SNRUpdateClientContext object with client's optional data. Not provided fields are not modified.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)updateClient:(NSInteger)clientId
             context:(SNRUpdateClientContext *)context
             success:(nullable void (^)(BOOL isSuccess))success
             failure:(nullable void (^)(NSError *error))failure;

/**
 * Deletes client with provided id.
 *
 * @param clientId - client's id to be deleted.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)deleteClient:(NSInteger)clientId
             success:(nullable void (^)(BOOL isSuccess))success
             failure:(nullable void (^)(NSError *error))failure;

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
 * Use this method to get all available promotions that are defined for your business profile.
 *
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)getPromotionsWithSuccess:(nullable void (^)(SNRProfilePromotionResponse *promotionResponse))success
                         failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotions(success:failure:));

/**
 * Use this method to get specified number of available promotions that are defined for your business profile.
 *
 * @param limit - maximum number of returned items.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)getPromotionsWithLimit:(NSInteger)limit
                       success:(nullable void (^)(SNRProfilePromotionResponse *promotionResponse))success
                       failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotions(limit:success:failure:));

/**
 * Use this method to get promotions with external ID specified as externalId parameter.
 *
 * @param externalId - external ID specified in promotion.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)getPromotionsByExternalId:(NSString *)externalId
                          success:(nullable void (^)(SNRClientPromotionResponse *promotionResponse))success
                          failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotions(externalId:success:failure:));

/**
 * Use this method to get promotions with phone number specified as phoneNumber parameter.
 *
 * @param phoneNumber - phone number specified in promotion.
 * @param success - success block.
 * @param failure - failure block.
 *
 */
+ (void)getPromotionsByPhoneNumber:(NSString *)phoneNumber
                           success:(nullable void (^)(SNRClientPromotionResponse *promotionResponse))success
                           failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotions(phoneNumber:success:failure:));

/**
 * Use this method to get promotions with client ID specified as clientId parameter.
 *
 * @param clientId - client ID specified in promotion.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)getPromotionsByClientId:(NSString *)clientId
                        success:(nullable void (^)(SNRClientPromotionResponse *promotionResponse))success
                        failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotions(clientId:success:failure:));

/**
 * Use this method to get promotions with email specified as email parameter.
 *
 * @param email - email specified in promotion.
 * @param success - success block.
 * @param failure - failure block.
 *
 */
+ (void)getPromotionsByEmail:(NSString *)email
                     success:(nullable void (^)(SNRClientPromotionResponse *promotionResponse))success
                     failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotions(email:success:failure:));

/**
 * Use this method to get promotion with UUID specified as uuid param.
 *
 * @param uuid - uuid specified in promotion.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)getPromotionByUuid:(NSString *)uuid
                   success:(nullable void (^)(SNRProfilePromotion *promotion))success
                   failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotion(uuid:success:failure:));

/**
 * Use this method to get promotion with code specified as code param.
 *
 * @param code - code specified in promotion.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)getPromotionByCode:(NSString *)code
                   success:(nullable void (^)(SNRProfilePromotion *promotion))success
                   failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotion(code:success:failure:));

/**
 * Use this method to redeem promotion with specified phone number and promotion code.
 *
 * @param phoneNumber - phone number specified in promotion.
 * @param promotionCode - promotion code specified in promotion.
 * @param success - success block.
 * @param failure - failure block.
 *
 */
+ (void)redeemPromotionByPhoneNumber:(NSString *)phoneNumber
                       promotionCode:(NSString *)promotionCode
                             success:(nullable void (^)(BOOL isSuccess))success
                             failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(redeemPromotion(phoneNumber:promotionCode:success:failure:));

/**
 * Use this method to redeem promotion with specified client ID and promotion code.
 *
 * @param clientId - client ID specified in promotion.
 * @param promotionCode - promotion code specified in promotion.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)redeemPromotionByClientId:(NSString *)clientId
                    promotionCode:(NSString *)promotionCode
                          success:(nullable void (^)(BOOL isSuccess))success
                          failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(redeemPromotion(clientId:promotionCode:success:failure:));

/**
 * Use this method to redeem promotion with specified custom ID and promotion code.
 *
 * @param externalId - external ID specified in promotion.
 * @param promotionCode - promotion code specified in promotion.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)redeemPromotionByExternalId:(NSString *)externalId
                    promotionCode:(NSString *)promotionCode
                          success:(nullable void (^)(BOOL isSuccess))success
                          failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(redeemPromotion(customId:promotionCode:success:failure:));

/**
 * Use this method to redeem promotion with specified email and promotion code.
 *
 * @param email - email specified in promotion.
 * @param promotionCode - promotion code specified in promotion.
 * @param success - success block.
 * @param failure - failure block.
 *
 */
+ (void)redeemPromotionByEmail:(NSString *)email
                 promotionCode:(NSString *)promotionCode
                       success:(nullable void (^)(BOOL isSuccess))success
                       failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(redeemPromotion(email:promotionCode:success:failure:));

/**
 * Use this method to get voucher code only once or assign voucher with provided pool uuid for the client.
 *
 * @param poolUUID - pool's universally unique identifier.
 * @param clientUUID - current client uuid will be used if provided uuid is null.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)getOrAssignVoucherWithPoolUUID:(NSString *)poolUUID
                            clientUUID:(nullable NSString *)clientUUID
                               success:(nullable void (^)(SNRAssignVoucherResponse *assignVoucherResponse))success
                               failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getOrAssignVoucher(poolUUID:clientUUID:success:failure:));

/**
* Use this method to get client's voucher codes.
*
* @param clientUUID - current client uuid will be used if provided uuid is null.
* @param success - success block. This block return VoucherCodesResponse with VoucherCodesData object array.
* @param failure - failure block.
*/
+ (void)getClientVoucherCodesWithClientUUID:(nullable NSString *)clientUUID
                                    success:(nullable void (^)(SNRVoucherCodesResponse *voucherInformation))success
                                    failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getClientVoucherCodes(clientUUID:success:failure:));

/**
 * Use this method to assign voucher with provided pool uuid for the client.
 * Every request returns different code until the pool is empty.
 * 416 Http status code is returned when pool is empty.
 *
 * @param poolUUID - pool's universally unique identifier.
 * @param clientUUID - current client uuid will be used if provided uuid is null.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)assignVoucherCodeWithPoolUUID:(NSString *)poolUUID
                           clientUUID:(nullable NSString *)clientUUID
                              success:(nullable void (^)(SNRAssignVoucherResponse *assignVoucherResponse))success
                              failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(assignVoucherCode(poolUUID:clientUUID:success:failure:));

@end

NS_ASSUME_NONNULL_END
