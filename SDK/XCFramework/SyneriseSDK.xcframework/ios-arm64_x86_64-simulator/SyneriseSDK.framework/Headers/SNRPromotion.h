//
//  SNRPromotion.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>
#import <SyneriseSDK/SNRPromotionDetails.h>
#import <SyneriseSDK/SNRPromotionStatus.h>
#import <SyneriseSDK/SNRPromotionType.h>
#import <SyneriseSDK/SNRPromotionDiscountType.h>
#import <SyneriseSDK/SNRPromotionDiscountMode.h>
#import <SyneriseSDK/SNRPromotionDiscountModeDetails.h>
#import <SyneriseSDK/SNRPromotionItemScope.h>
#import <SyneriseSDK/SNRPromotionImage.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSString * SNRPromotionSortingKey;

FOUNDATION_EXPORT SNRPromotionSortingKey const SNR_PROMOTION_SORTING_KEY_EXPIRE_AT;
FOUNDATION_EXPORT SNRPromotionSortingKey const SNR_PROMOTION_SORTING_KEY_CREATED_AT;
FOUNDATION_EXPORT SNRPromotionSortingKey const SNR_PROMOTION_SORTING_KEY_LASTING_AT;
FOUNDATION_EXPORT SNRPromotionSortingKey const SNR_PROMOTION_SORTING_KEY_REQUIRE_REDEEMED_POINTS;
FOUNDATION_EXPORT SNRPromotionSortingKey const SNR_PROMOTION_SORTING_KEY_UPDATED_AT;
FOUNDATION_EXPORT SNRPromotionSortingKey const SNR_PROMOTION_SORTING_KEY_TYPE;
FOUNDATION_EXPORT SNRPromotionSortingKey const SNR_PROMOTION_SORTING_KEY_PRIORITY;

/**
 * @class SNRPromotion
 */

NS_SWIFT_NAME(Promotion)
@interface SNRPromotion : SNRBaseModel

@property (copy, nonatomic, nonnull, readonly) NSString *uuid;
@property (copy, nonatomic, nonnull, readonly) NSString *code;
@property (assign, nonatomic, readonly) SNRPromotionStatus status;
@property (assign, nonatomic, readonly) SNRPromotionType type;
@property (strong, nonatomic, nonnull, readonly) SNRPromotionDetails *details;

@property (copy, nonatomic, nullable, readonly) NSNumber *redeemLimitPerClient;
@property (copy, nonatomic, nullable, readonly) NSNumber *redeemQuantityPerActivation;
@property (copy, nonatomic, nonnull, readonly) NSNumber *currentRedeemedQuantity;
@property (copy, nonatomic, nonnull, readonly) NSNumber *currentRedeemLimit;
@property (copy, nonatomic, nonnull, readonly) NSNumber *activationCounter;
@property (copy, nonatomic, nonnull, readonly) NSNumber *possibleRedeems;
@property (copy, nonatomic, nonnull, readonly) NSNumber *requireRedeemedPoints;

@property (assign, nonatomic, readonly) SNRPromotionDiscountType discountType;
@property (copy, nonatomic, nonnull, readonly) NSNumber *discountValue;
@property (assign, nonatomic, readonly) SNRPromotionDiscountMode discountMode;
@property (strong, nonatomic, nullable, readonly) SNRPromotionDiscountModeDetails *discountModeDetails;

@property (copy, nonatomic, nonnull, readonly) NSNumber *priority;
@property (copy, nonatomic, nonnull, readonly) NSNumber *price;
@property (assign, nonatomic, readonly) SNRPromotionItemScope itemScope;
@property (copy, nonatomic, nullable, readonly) NSNumber *minBasketValue;
@property (copy, nonatomic, nullable, readonly) NSNumber *maxBasketValue;

@property (copy, nonatomic, nonnull, readonly) NSString *name;
@property (copy, nonatomic, nullable, readonly) NSString *headline;
@property (copy, nonatomic, nullable, readonly) NSString *descriptionText;
@property (copy, nonatomic, nullable, readonly) NSArray<SNRPromotionImage *> *images;

@property (copy, nonatomic, nullable, readonly) NSDate *startAt;
@property (copy, nonatomic, nullable, readonly) NSDate *expireAt;
@property (copy, nonatomic, nullable, readonly) NSDate *lastingAt;
@property (copy, nonatomic, nullable, readonly) NSNumber *lastingTime;
@property (copy, nonatomic, nullable, readonly) NSString *displayFrom;
@property (copy, nonatomic, nullable, readonly) NSString *displayTo;

@property (copy, nonatomic, nullable, readonly) NSArray<NSString *> *catalogIndexItems;
@property (copy, nonatomic, nullable, readonly) NSDictionary *params;
@property (copy, nonatomic, nullable, readonly) NSArray *tags;

@end

NS_ASSUME_NONNULL_END
