//
//  SNRPromotions.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2023 Synerise. All rights reserved.
//

@class SNRPromotionsApiQuery;
@class SNRPromotionResponse;
@class SNRPromotionIdentifier;
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
 * Gets all available promotions that are defined for this client.
 *
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getPromotionsWithSuccess:(void (^)(SNRPromotionResponse *promotionResponse))success
                         failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(getPromotions(success:failure:));

/**
 * Gets promotions that are defined for parameters provided in the query object.
 *
 * @param apiQuery `SNRPromotionsApiQuery` object responsible for storing all query parameters.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getPromotionsWithApiQuery:(SNRPromotionsApiQuery *)apiQuery
                          success:(void (^)(SNRPromotionResponse *promotionResponse))success
                          failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(getPromotions(apiQuery:success:failure:));

/**
 * Gets a promotion identified by UUID.
 *
 * @param uuid UUID of the promotion.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getPromotionByUuid:(NSString *)uuid
                   success:(void (^)(SNRPromotion *promotion))success
                   failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(getPromotion(uuid:success:failure:));

/**
 * Gets a promotion identified by code.
 *
 * @param code Code of the promotion.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getPromotionByCode:(NSString *)code
                   success:(void (^)(SNRPromotion *promotion))success
                   failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(getPromotion(code:success:failure:));

/**
 * Activates a promotion identified by UUID.
 *
 * @param uuid UUID of the promotion that will be activated.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)activatePromotionByUuid:(NSString *)uuid
                        success:(void (^)(BOOL isSuccess))success
                        failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(activatePromotion(uuid:success:failure:));

/**
 * Activates promotion identified by code.
 *
 * @param code Code of the promotion that will be activated.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)activatePromotionByCode:(NSString *)code
                        success:(void (^)(BOOL isSuccess))success
                        failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(activatePromotion(code:success:failure:));

/**
 * Activates promotions with code or with UUID in a batch.
 *
 * @param identifiers List of promotion identifiers to be activated.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */

+ (void)activatePromotionsWithIdentifiers:(NSArray<SNRPromotionIdentifier *> *)identifiers
                                       success:(void (^)(BOOL isSuccess))success
                                       failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(activatePromotions(identifiers:success:failure:));

/**
 * Deactivates a promotion identified by UUID.
 *
 * @param uuid UUID of the promotion that will be deactivated.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)deactivatePromotionByUuid:(NSString *)uuid
                          success:(void (^)(BOOL isSuccess))success
                          failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(deactivatePromotion(uuid:success:failure:));

/**
 * Dectivates promotion identified by code.
 *
 * @param code Code of the promotion that will be deactivated.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)deactivatePromotionByCode:(NSString *)code
                          success:(void (^)(BOOL isSuccess))success
                          failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(deactivatePromotion(code:success:failure:));

/**
 * Deactivates promotions with code or with UUID in a batch.
 *
 * @param identifiers List of promotion identifiers to be deactivated.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */

+ (void)deactivatePromotionsWithIdentifiers:(NSArray<SNRPromotionIdentifier *> *)identifiers
                                       success:(void (^)(BOOL isSuccess))success
                                       failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(deactivatePromotions(identifiers:success:failure:));

/**
 * Gets a voucher code permanently assigned to a customer (the same code every time).
 * If no code is permanently assigned, the method assigns a voucher from the provided pool so that the same code is returned in all future calls.
 *
 * @param poolUUID Pool's universally unique identifier.
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getOrAssignVoucherWithPoolUUID:(NSString *)poolUUID
                               success:(void (^)(SNRAssignVoucherResponse *assignVoucherResponse))success
                               failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(getOrAssignVoucher(poolUUID:success:failure:));

/**
 * Assigns a voucher from a pool to a customer.
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
                              failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(assignVoucherCode(poolUUID:success:failure:));

/**
 * Gets a customer's voucher codes.
 *
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getAssignedVoucherCodesWithSuccess:(void (^)(SNRVoucherCodesResponse *voucherCodesResponse))success
                                   failure:(void (^)(SNRApiError *error))failure NS_SWIFT_NAME(getAssignedVoucherCodes(success:failure:));

@end

NS_ASSUME_NONNULL_END
