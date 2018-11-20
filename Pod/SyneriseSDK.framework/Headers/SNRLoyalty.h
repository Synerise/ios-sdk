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

NS_SWIFT_NAME(Loyalty)
@interface SNRLoyalty : NSObject

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

/**
 * Enables/disables console logs from SNRLoyalty.
 *
 * @note It is not recommended to use debug mode in release version of your application.
 *
 * @param enabled - specified is console logs are enabled.
 */
+ (void)setLoggingEnabled:(BOOL)enabled;

/**
 * Use this method to get all available promotions that are defined for this client.
 *
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)getPromotionsWithSuccess:(nullable void (^)(SNRPromotionResponse *promotionResponse))success
                         failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotions(success:failure:));

/**
 * Use this method to get promotions that are matched for parameters.
 *
 * @param statuses - list of statuses for query (@enum SNRPromotionStatus).
 * @param types - list of types for query (@enum SNRPromotionType).
 * @param page - page number.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)getPromotionsStatuses:(nullable NSArray<NSNumber *> *)statuses
                        types:(nullable NSArray<NSNumber *> *)types
                         page:(NSInteger)page
                      success:(nullable void (^)(SNRPromotionResponse *promotionResponse))success
                      failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotions(statuses:types:page:success:failure:));

/**
 * Use this method to get promotions that are matched for parameters.
 *
 * @param statuses - list of statuses for query (@enum SNRPromotionStatus).
 * @param types - list of types for query (@enum SNRPromotionType).
 * @param limit - limit of items in response.
 * @param page - page number.
 * @param success - success block.
 * @param failure - failure block.
 *
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
 * @param statuses - list of statuses for query (@enum SNRPromotionStatus).
 * @param types - list of types for query (@enum SNRPromotionType).
 * @param limit - limit of items in response.
 * @param page - page number.
 * @param includeMeta - should response include meta data.
 * @param success - success block.
 * @param failure - failure block.
 *
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
 * @param uuid - uuid of promotion.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)getPromotionByUuid:(NSString *)uuid
                   success:(nullable void (^)(SNRPromotion *promotion))success
                   failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotion(uuid:success:failure:));

/**
 * Use this method to get promotion that has code passed as parameter.
 *
 * @param code - code of promotion.
 * @param success - success block.
 * @param failure - failure block.
 */
+ (void)getPromotionByCode:(NSString *)code
                   success:(nullable void (^)(SNRPromotion *promotion))success
                   failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPromotion(code:success:failure:));

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
