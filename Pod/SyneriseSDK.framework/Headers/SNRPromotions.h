//
//  SNRPromotions.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2020 Synerise. All rights reserved.
//

@class SNRPromotionsApiQuery;
@class SNRPromotionResponse;
@class SNRPromotion;
@class SNRAssignVoucherResponse;
@class SNRVoucherCodesResponse;

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRPromotions
 */

NS_SWIFT_NAME(Promotions)
@interface SNRPromotions : NSObject

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

/**
 * Enables/Disables console logs from SNRPromotions.
 *
 * @param enabled Specifies that console logs are enabled/disabled.
 *
 * @note It is not recommended to use debug mode in release version of your application.
 */
+ (void)setLoggingEnabled:(BOOL)enabled;

/**
 * Gets all available promotions that are defined for this client.
 *
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getPromotionsWithSuccess:(void (^)(SNRPromotionResponse *promotionResponse))success
                         failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotions(success:failure:));

/**
 * Gets promotions that are defined for parameters provided in query object.
 *
 * @param apiQuery SNRPromotionsApiQuery object responsible for storing all query parameters.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getPromotionsWithApiQuery:(SNRPromotionsApiQuery *)apiQuery
                          success:(void (^)(SNRPromotionResponse *promotionResponse))success
                          failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotions(apiQuery:success:failure:));

/**
 * Gets promotion that are defined for UUID parameter provided.
 *
 * @param uuid UUID string of promotion.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getPromotionByUuid:(NSString *)uuid
                   success:(void (^)(SNRPromotion *promotion))success
                   failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotion(uuid:success:failure:));

/**
 * Gets promotion that are defined for code parameter provided.
 *
 * @param code Code of promotion.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getPromotionByCode:(NSString *)code
                   success:(void (^)(SNRPromotion *promotion))success
                   failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotion(code:success:failure:));

/**
 * Activates promotion that is defined for UUID parameter provided.
 *
 * @param uuid UUID of promotion that will be activated.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)activatePromotionByUuid:(NSString *)uuid
                        success:(void (^)(BOOL isSuccess))success
                        failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(activatePromotion(uuid:success:failure:));

/**
 * Activates promotion that is defined for code parameter provided.
 *
 * @param code Code of promotion that will be activated.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)activatePromotionByCode:(NSString *)code
                        success:(void (^)(BOOL isSuccess))success
                        failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(activatePromotion(code:success:failure:));

/**
 * Dectivates promotion that is defined for UUID parameter provided.
 *
 * @param uuid UUID of promotion that will be deactivated.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)deactivatePromotionByUuid:(NSString *)uuid
                          success:(void (^)(BOOL isSuccess))success
                          failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(deactivatePromotion(uuid:success:failure:));

/**
 * Dectivates promotion that is defined for code parameter provided.
 *
 * @param code Code of promotion that will be deactivated.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)deactivatePromotionByCode:(NSString *)code
                          success:(void (^)(BOOL isSuccess))success
                          failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(deactivatePromotion(code:success:failure:));

/**
 * Gets voucher code only once or assign voucher with provided pool UUID for the client.
 *
 * @param poolUUID Pool's universally unique identifier.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getOrAssignVoucherWithPoolUUID:(NSString *)poolUUID
                               success:(void (^)(SNRAssignVoucherResponse *assignVoucherResponse))success
                               failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(getOrAssignVoucher(poolUUID:success:failure:));

/**
 * Assigns voucher with provided pool UUID for the client.
 * Every request returns different code until the pool is empty.
 *
 * @param poolUUID Pool's universally unique identifier.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 *
 * @note 416 HTTP status code is returned when pool is empty.
 */
+ (void)assignVoucherCodeWithPoolUUID:(NSString *)poolUUID
                              success:(void (^)(SNRAssignVoucherResponse *assignVoucherResponse))success
                              failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(assignVoucherCode(poolUUID:success:failure:));

/**
 * Gets client's voucher codes.
 *
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getAssignedVoucherCodesWithSuccess:(void (^)(SNRVoucherCodesResponse *voucherCodesResponse))success
                                   failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(getAssignedVoucherCodes(success:failure:));

@end

NS_ASSUME_NONNULL_END
