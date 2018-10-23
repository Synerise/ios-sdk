//
//  SNRClient.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

@class SNRClientUpdateAccountContext;
@class SNRClientAccountInformation;
@class SNRClientPromotionResponse;
@class SNRClientPromotion;
@class SNRAssignVoucherResponse;
@class SNRVoucherCodesResponse;

typedef struct {
    //Enables automatic client's token refresh.
    //By default, client's token is valid for one hour. Synerise SDK will refresh this token when it is expiring (not expired).
    //Enabling this feature causes in saving user's password internally within SDK! The password is obviously stored encrypted.
    //Note, that business profile's token will always be refreshed automatically, even when it is expired.
    //
    //It is disabled by default.
    BOOL autoClientRefresh;
    
} SNRClientConfiguration NS_SWIFT_NAME(ClientConfiguration);

/**
 * SNRClient is responsible for tracking various SNREvents.
 */

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
 * Initializes SNRClient module.
 *
 * @note This method needs to be called before any other method of SNRTracker class and only once during application lifecycle.
 *
 * @param apiKey - Synerise API Key.
 */
+ (void)initialize:(NSString *)apiKey;

/**
 * Sets configuration of client.
 *
 * @param configuration - configuration of client.
 */
+ (void)setConfiguration:(SNRClientConfiguration)configuration;

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
 * @note Email should be valid email address.
 *
 * @throws SNRInvalidEmailException for Obj-C and SNRInvalidEmailError for Swift if an email is invalid.
 */
+ (void)logIn:(NSString *)email
     password:(NSString *)password
     deviceId:(nullable NSString *)deviceId
      success:(nullable void (^)(BOOL isSuccess))success
      failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(login(email:password:deviceId:success:failure:));

/**
 * Log in a client in order to obtain the JWT token, which could be used in subsequent requests. The token is valid for 1 hour.
 * This SDK will refresh token before each call if it is expiring (but not expired).
 * Please note that you should NOT allow to sign in again (or sign up) when a user is already signed in. Please sign out user first.
 * Moreover, please do not create multiple instances nor call this method multiple times before execution.
 *
 * @param phone - client's phone number.
 * @param password - client's password.
 * @param deviceId - deviceId.
 * @param success - success block.
 * @param failure - failure block.
 *
 * @note Phone number should match ^(\\+[0-9]{6,19})|([0-9]{6,20})$ regex pattern.
 *
 * @throws SNRInvalidPhoneNumberException for Obj-C and SNRInvalidPhoneNumberError for Swift if a phone number is invalid.
 */
+ (void)logInWithPhone:(NSString *)phone
              password:(NSString *)password
              deviceId:(nullable NSString *)deviceId
               success:(nullable void (^)(BOOL isSuccess))success
               failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(login(phone:password:deviceId:success:failure:));

/**
 * Use this method to obtain unregistered client's authorization token.
 *
 * @note 401 http status code is returned if you used this method for the client already existing in Synerise database.
 *
 * @param uuid - client's uuid.
 *
 * @throws SNRIllegalArgumentException for Obj-C and SNRIllegalArgumentError if a uuid is invalid string.
 */
+ (void)createAuthTokenByUuid:(NSString *)uuid
                      success:(nullable void (^)(BOOL isSuccess))success
                      failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(createAuthToken(uuid:success:failure:));

/**
 * Use this method to obtain unregistered client's authorization token.
 *
 * @note 401 http status code is returned if you used this method for the client already existing in Synerise database.
 *
 * @note Email should be valid email address.
 *
 * @throws SNRInvalidEmailException for Obj-C and SNRInvalidEmailError for Swift if an email is invalid.
 */
+ (void)createAuthTokenByEmail:(NSString *)email
                       success:(nullable void (^)(BOOL isSuccess))success
                       failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(createAuthToken(email:success:failure:));

/**
 * Use this method to obtain unregistered client's authorization token.
 *
 * @note 401 http status code is returned if you used this method for the client already existing in Synerise database.
 *
 * @param customId - client's custom identifier.
 *
 * @throws SNRIllegalArgumentException for Obj-C and SNRIllegalArgumentError if a customId is invalid string.
 */
+ (void)createAuthTokenByCustomId:(NSString *)customId
                          success:(nullable void (^)(BOOL isSuccess))success
                          failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(createAuthToken(customId:success:failure:));

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
 * Retrieve whether client is signed in (is client's token not expired).
 */
+ (BOOL)isSignedIn;

/**
 * Logs out client.
 */
+ (void)logOut NS_SWIFT_NAME(logout());

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
 * Delete client's account information.
 *
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)deleteAccountWithSuccess:(nullable void (^)(BOOL isSuccess))success
                         failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(deleteAccount(success:failure:));

/**
 * Change client's password.
 *
 * @param password - new client's password.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)changePassword:(NSString *)password
               success:(nullable void (^)(BOOL isSuccess))success
               failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(changePassword(password:success:failure:));

/**
 * Change client's password. Check oldPassword with client's current password.
 *
 * @param newPassword - new client's password.
 * @param oldPassword - old client's password.
 * @param success - success block.
 * @param failure - failure block.
 *
 * @throws SNRPasswordIsNotEqualToSavedPasswordException for Obj-C and SNRPasswordIsNotEqualToSavedPasswordError for Swift if a new password is not equal as old password.
 */
+ (void)changePasswordWithNewPassword:(NSString *)newPassword
                          oldPassword:(nullable NSString *)oldPassword
                              success:(nullable void (^)(BOOL isSuccess))success
                              failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(changePassword(newPassword:oldPassword:success:failure:));

/**
 * Update client's phone number request.
 *
 * @param phoneNumber - client's phone number.
 * @param success - success block.
 * @param failure - failure block.
 *
 * @note Phone number should match ^(\\+[0-9]{6,19})|([0-9]{6,20})$ regex pattern.
 *
 * @throws SNRInvalidPhoneNumberException for Obj-C and SNRInvalidPhoneNumberError for Swift if a phone number is invalid.
 */
+ (void)updatePhoneNumber:(NSString *)phoneNumber
                  success:(nullable void (^)(BOOL isSuccess))success
                  failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(updatePhoneNumber(phoneNumber:success:failure:));

/**
 * Confirm client's phone number update.
 *
 * @param phoneNumber - client's phone number.
 * @param confirmationCode - client's confirmation code received by phone.
 * @param success - success block.
 * @param failure - failure block.
 *
 * @note Phone number should match ^(\\+[0-9]{6,19})|([0-9]{6,20})$ regex pattern.
 *
 * @throws SNRInvalidPhoneNumberException for Obj-C and SNRInvalidPhoneNumberError for Swift if a phone number is invalid.
 */
+ (void)confirmPhoneNumber:(NSString *)phoneNumber
          confirmationCode:(NSString *)confirmationCode
                   success:(nullable void (^)(BOOL isSuccess))success
                   failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(confirmPhoneNumber(phoneNumber:confirmationCode:success:failure:));

/**
 * Get all available Analytics metrics for the client.
 * Please note that in order to use this method, Client must be signed in first.
 *
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)getAnalyticsWithSuccess:(nullable void (^)(NSArray *analyticsMetrics))success
                        failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getAnalytics(success:failure:));

/**
 * Fetch all available Analytics metrics for the client and return the first metric, which matches provided name.
 * Please note that in order to use this method, Client must be signed in first.
 *
 * @param name - metrics data's name to filter through all available metrics.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)getAnalyticsWithName:(NSString *)name
                     success:(nullable void (^)(NSArray *analyticsMetrics))success
                     failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getAnalytics(name:success:failure:));

/**
 * Use this method to get all available promotions that are defined for this client.
 *
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)getPromotionsWithSuccess:(nullable void (^)(SNRClientPromotionResponse *promotionResponse))success
                         failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotions(success:failure:));

/**
 * Use this method to get all possible combinations of promotions statuses, which are defined for this client.
 * Method returns promotions with statuses provided in the list. A special query is build upon this list.
 *
 * @param statuses - decide status of promotions which you want to get in response.
 * @param excludeExpired - decide whether include or exclude already expired promotions.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)getPromotionsWithStatuses:(NSArray<NSNumber *> *)statuses
                   excludeExpired:(BOOL)excludeExpired
                          success:(nullable void (^)(SNRClientPromotionResponse *promotionResponse))success
                          failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotions(statuses:excludeExpired:success:failure:));

/**
 * Use this method to activate promotion that has uuid passed as parameter.
 *
 * @param uuid - uuid of promotion that will be activated.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)activatePromotionByUuid:(NSString *)uuid
                        success:(nullable void (^)(BOOL isSuccess))success
                        failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(activatePromotion(uuid:success:failure:));

/**
 * Use this method to activate promotion that has code passed as parameter.
 *
 * @param code - code of promotion that will be activated.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)activatePromotionByCode:(NSString *)code
                        success:(nullable void (^)(BOOL isSuccess))success
                        failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(activatePromotion(code:success:failure:));

/**
 * Use this method to get promotion that has uuid passed as parameter.
 *
 * @param uuid - uuid of promotion.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)getPromotionByUuid:(NSString *)uuid
                   success:(nullable void (^)(SNRClientPromotion *promotion))success
                   failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotion(uuid:success:failure:));

/**
 * Use this method to get promotion that has code passed as parameter.
 *
 * @param code - code of promotion.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)getPromotionByCode:(NSString *)code
                   success:(nullable void (^)(SNRClientPromotion *promotion))success
                   failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotion(code:success:failure:));

/**
 * Use this method to deactivate promotion that has uuid passed as parameter.
 *
 * @param uuid - uuid of promotion that will be deactivated.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)deactivatePromotionByUuid:(NSString *)uuid
                          success:(nullable void (^)(BOOL isSuccess))success
                          failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(deactivatePromotion(uuid:success:failure:));

/**
 * Use this method to deactivate promotion that has code passed as parameter.
 *
 * @param code - code of promotion that will be deactivated.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)deactivatePromotionByCode:(NSString *)code
                          success:(nullable void (^)(BOOL isSuccess))success
                          failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(deactivatePromotion(code:success:failure:));

/**
 * Use this method to get voucher code only once or assign voucher with provided pool uuid for the client.
 *
 * @param poolUUID - pool's universally unique identifier.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)getOrAssignVoucherWithPoolUUID:(NSString *)poolUUID
                               success:(nullable void (^)(SNRAssignVoucherResponse *assignVoucherResponse))success
                               failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getOrAssignVoucher(poolUUID:success:failure:));

/**
 * Use this method to assign voucher with provided pool uuid for the client.
 * Every request returns different code until the pool is empty.
 *
 * @note 416 HTTP status code is returned when pool is empty.
 *
 * @param poolUUID - pool's universally unique identifier.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)assignVoucherCodeWithPoolUUID:(NSString *)poolUUID
                              success:(nullable void (^)(SNRAssignVoucherResponse *assignVoucherResponse))success
                              failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(assignVoucherCode(poolUUID:success:failure:));

/**
 * Use this method to get client's voucher codes.
 *
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)getAssignedVoucherCodesWithSuccess:(nullable void (^)(SNRVoucherCodesResponse *voucherCodesResponse))success
                                   failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getAssignedVoucherCodes(success:failure:));

@end

NS_ASSUME_NONNULL_END
