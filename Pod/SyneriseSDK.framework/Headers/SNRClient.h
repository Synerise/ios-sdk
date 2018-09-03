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
+ (void)initialize:(NSString *)apiKey;

/**
 * Sets configuration of client
 *
 * @param configuration of client.
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
 * @throws NSInvalidArgumentException if an email is invalid. Email should be valid.
 * @throws NSInvalidArgumentException if a password is invalid. The password should consist of at least one uppercase, one lowercase, one special character and be at least 8 characters long.
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
 * @param phone - client's phone.
 * @param password - client's password.
 * @param deviceId - deviceId.
 * @param success - success block.
 * @param failure - failure block.
 *
 * @throws NSInvalidArgumentException if phone is invalid - phone number should match ^(\\+[0-9]{6,19})|([0-9]{6,20})$ regex pattern.
 * @throws NSInvalidArgumentException if a password is invalid. The password should consist of at least one uppercase, one lowercase, one special character and be at least 8 characters long.
 */
+ (void)logInWithPhone:(NSString *)phone
              password:(NSString *)password
              deviceId:(nullable NSString *)deviceId
               success:(nullable void (^)(BOOL isSuccess))success
               failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(login(phone:password:deviceId:success:failure:));

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
+ (void)getAccountWithSuccess:(nullable void (^)(SNRClientAccountInformation *accountInformation))success
                      failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getAccount(success:failure:));

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
 * @param name metrics data's name to filter through all available metrics.
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
 * Use this method to activate promotion that has uuid passed as parameter.
 *
 * @param uuid uuid of promotion that will be activated.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)activatePromotionByUuid:(NSString *)uuid
                        success:(nullable void (^)(BOOL isSuccess))success
                        failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(activatePromotion(uuid:success:failure:));

/**
 * Use this method to activate promotion that has code passed as parameter.
 *
 * @param code code of promotion that will be activated.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)activatePromotionByCode:(NSString *)code
                        success:(nullable void (^)(BOOL isSuccess))success
                        failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(activatePromotion(code:success:failure:));

/**
 * Use this method to get promotion that has uuid passed as parameter.
 *
 * @param uuid uuid of promotion.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)getPromotionByUuid:(NSString *)uuid
                   success:(nullable void (^)(SNRClientPromotion *promotion))success
                   failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotion(uuid:success:failure:));

/**
 * Use this method to get promotion that has code passed as parameter.
 *
 * @param code code of promotion.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)getPromotionByCode:(NSString *)code
                   success:(nullable void (^)(SNRClientPromotion *promotion))success
                   failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotion(code:success:failure:));
/*
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
 * Delete client's account information.
 *
 * @param success success block.
 * @param failure failure block.
 */
+ (void)deleteAccountWithSuccess:(nullable void (^)(BOOL isSuccess))success
                      failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(deleteAccount(success:failure:));

/**
 * Update client's account information with optional data.
 *
 * @param context object with client's account information to be modified.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)updateAccount:(SNRClientUpdateAccountContext *)context
              success:(nullable void (^)(BOOL isSuccess))success
              failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(updateAccount(context:success:failure:));

/*
 * Update client's phone number request.
 *
 * @param phoneNumber client's phone.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)updatePhoneNumber:(NSString *)phoneNumber
                  success:(nullable void (^)(BOOL isSuccess))success
                  failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(updatePhoneNumber(phoneNumber:success:failure:));

/*
 * Confirm client's phone number update.
 *
 * @param phoneNumber client's phone.
 * @param confirmationCode client's confirmation code received by phone.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)confirmPhoneNumber:(NSString *)phoneNumber
          confirmationCode: (NSString *)confirmationCode
                   success:(nullable void (^)(BOOL isSuccess))success
                   failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(confirmPhoneNumber(phoneNumber:confirmationCode:success:failure:));



/**
 * Retrieves current Client authentication token. This method provides valid token if Client is logged in and current token is not expired.
 *
 * @param success A block object to be executed when the request finishes successfully. This block has no return value and takes one argument containing Client authentication token.
 * @param failure A block object to be executed when the request fails. This block has no return value and takes one @c NSError argument.
 */
+ (void)getTokenWithSuccess:(nullable void (^)(NSString *token))success
                    failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getToken(success:failure:));

/**
 * Retrieve current client's UUID.
 */
+ (NSString*)getUUID;

/**
 * Retrieve whether client is signed in (is client's token not expired).
 */
+ (BOOL)isSignedIn;

@end

NS_ASSUME_NONNULL_END
