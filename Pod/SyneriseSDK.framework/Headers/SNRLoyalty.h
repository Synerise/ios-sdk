//
//  SNRLoyalty.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

@class SNRPromotionResponse;
@class SNRPromotion;
@class SNRAssignVoucherResponse;
@class SNRVoucherCodesResponse;

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRLoyalty
 */

NS_SWIFT_NAME(Loyalty)
@interface SNRLoyalty : NSObject

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

/**
 * Enables/disables console logs from SNRLoyalty.
 *
 * @param enabled Specifies that console logs are enabled/disabled.
 *
 * @note It is not recommended to use debug mode in release version of your application.
 */
+ (void)setLoggingEnabled:(BOOL)enabled;

/**
 * Use this method to get all available promotions that are defined for this client.
 *
 * @param success A block when operation is success.
 * @param failure A block when operation is failure.
 */
+ (void)getPromotionsWithSuccess:(nullable void (^)(SNRPromotionResponse *promotionResponse))success
                         failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotions(success:failure:));

/**
 * Use this method to get promotions that are matched for parameters.
 *
 * @param statuses List of statuses for query (@enum SNRPromotionStatus).
 * @param types List of types for query (@enum SNRPromotionType).
 * @param page Page number.
 * @param success A block when operation is success.
 * @param failure A block when operation is failure.
 */
+ (void)getPromotionsStatuses:(nullable NSArray<NSNumber *> *)statuses
                        types:(nullable NSArray<NSNumber *> *)types
                         page:(NSInteger)page
                      success:(nullable void (^)(SNRPromotionResponse *promotionResponse))success
                      failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotions(statuses:types:page:success:failure:));

/**
 * Use this method to get promotions that are matched for parameters.
 *
 * @param statuses List of statuses for query (@enum SNRPromotionStatus).
 * @param types List of types for query (@enum SNRPromotionType).
 * @param limit Limit of items in response.
 * @param page Page number.
 * @param success A block when operation is success.
 * @param failure A block when operation is failure.
 */
+ (void)getPromotionsStatuses:(nullable NSArray<NSNumber *> *)statuses
                        types:(nullable NSArray<NSNumber *> *)types
                        limit:(NSInteger)limit
                         page:(NSInteger)page
                      success:(nullable void (^)(SNRPromotionResponse *promotionResponse))success
                      failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotions(statuses:types:limit:page:success:failure:));

/**
 * Use this method to get promotions that are matched for parameters.
 *
 * @param statuses List of statuses for query (@enum SNRPromotionStatus).
 * @param types List of types for query (@enum SNRPromotionType).
 * @param limit Limit of items in response.
 * @param page Page number.
 * @param includeMeta Specifies that meta data should be included in response.
 * @param success A block when operation is success.
 * @param failure A block when operation is failure.
 */
+ (void)getPromotionsWithStatuses:(nullable NSArray<NSNumber *> *)statuses
                            types:(nullable NSArray<NSNumber *> *)types
                            limit:(NSInteger)limit
                             page:(NSInteger)page
                      includeMeta:(BOOL)includeMeta
                          success:(nullable void (^)(SNRPromotionResponse *promotionResponse))success
                          failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotions(statuses:types:limit:page:includeMeta:success:failure:));

/**
 * Use this method to get promotion that has uuid passed as parameter.
 *
 * @param uuid UUID of promotion.
 * @param success A block when operation is success.
 * @param failure A block when operation is failure.
 */
+ (void)getPromotionByUuid:(NSString *)uuid
                   success:(nullable void (^)(SNRPromotion *promotion))success
                   failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotion(uuid:success:failure:));

/**
 * Use this method to get promotion that has code passed as parameter.
 *
 * @param code Code of promotion.
 * @param success A block when operation is success.
 * @param failure A block when operation is failure.
 */
+ (void)getPromotionByCode:(NSString *)code
                   success:(nullable void (^)(SNRPromotion *promotion))success
                   failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotion(code:success:failure:));

/**
 * Use this method to activate promotion that has uuid passed as parameter.
 *
 * @param uuid UUID of promotion that will be activated.
 * @param success A block when operation is success.
 * @param failure A block when operation is failure.
 */
+ (void)activatePromotionByUuid:(NSString *)uuid
                        success:(nullable void (^)(BOOL isSuccess))success
                        failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(activatePromotion(uuid:success:failure:));

/**
 * Use this method to activate promotion that has code passed as parameter.
 *
 * @param code Code of promotion that will be activated.
 * @param success A block when operation is success.
 * @param failure A block when operation is failure.
 */
+ (void)activatePromotionByCode:(NSString *)code
                        success:(nullable void (^)(BOOL isSuccess))success
                        failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(activatePromotion(code:success:failure:));

/**
 * Use this method to deactivate promotion that has uuid passed as parameter.
 *
 * @param uuid UUID of promotion that will be deactivated.
 * @param success A block when operation is success.
 * @param failure A block when operation is failure.
 */
+ (void)deactivatePromotionByUuid:(NSString *)uuid
                          success:(nullable void (^)(BOOL isSuccess))success
                          failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(deactivatePromotion(uuid:success:failure:));

/**
 * Use this method to deactivate promotion that has code passed as parameter.
 *
 * @param code Code of promotion that will be deactivated.
 * @param success A block when operation is success.
 * @param failure A block when operation is failure.
 */
+ (void)deactivatePromotionByCode:(NSString *)code
                          success:(nullable void (^)(BOOL isSuccess))success
                          failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(deactivatePromotion(code:success:failure:));

/**
 * Use this method to get voucher code only once or assign voucher with provided pool uuid for the client.
 *
 * @param poolUUID Pool's universally unique identifier.
 * @param success A block when operation is success.
 * @param failure A block when operation is failure.
 */
+ (void)getOrAssignVoucherWithPoolUUID:(NSString *)poolUUID
                               success:(nullable void (^)(SNRAssignVoucherResponse *assignVoucherResponse))success
                               failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getOrAssignVoucher(poolUUID:success:failure:));

/**
 * Use this method to assign voucher with provided pool uuid for the client.
 * Every request returns different code until the pool is empty.
 *
 * @param poolUUID Pool's universally unique identifier.
 * @param success A block when operation is success.
 * @param failure A block when operation is failure.
 *
 * @note 416 HTTP status code is returned when pool is empty.
 */
+ (void)assignVoucherCodeWithPoolUUID:(NSString *)poolUUID
                              success:(nullable void (^)(SNRAssignVoucherResponse *assignVoucherResponse))success
                              failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(assignVoucherCode(poolUUID:success:failure:));

/**
 * Use this method to get client's voucher codes.
 *
 * @param success A block when operation is success.
 * @param failure A block when operation is failure.
 */
+ (void)getAssignedVoucherCodesWithSuccess:(nullable void (^)(SNRVoucherCodesResponse *voucherCodesResponse))success
                                   failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getAssignedVoucherCodes(success:failure:));

@end

NS_ASSUME_NONNULL_END
