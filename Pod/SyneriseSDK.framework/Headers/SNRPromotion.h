//
//  SNRPromotion.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

#import "SNRBaseModel.h"
#import "SNRPromotionStatus.h"
#import "SNRPromotionType.h"
#import "SNRPromotionDiscountType.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRPromotion
 */

NS_SWIFT_NAME(Promotion)
@interface SNRPromotion : SNRBaseModel

@property (copy, nonatomic, nonnull, readonly) NSString *uuid;
@property (copy, nonatomic, nonnull, readonly) NSString *code;
@property (assign, nonatomic, readonly) SNRPromotionStatus status;
@property (assign, nonatomic, readonly) SNRPromotionType type;

@property (copy, nonatomic, nullable, readonly) NSNumber *redeemLimitPerClient;
@property (copy, nonatomic, nullable, readonly) NSNumber *redeemQuantityPerActivation;
@property (copy, nonatomic, nonnull, readonly) NSNumber *currentRedeemedQuantity;
@property (copy, nonatomic, nullable, readonly) NSNumber *currentRedeemLimit;
@property (copy, nonatomic, nonnull, readonly) NSNumber *activationCounter;
@property (assign, nonatomic, readonly) SNRPromotionDiscountType discountType;
@property (copy, nonatomic, nonnull, readonly) NSNumber *discountValue;
@property (copy, nonatomic, nullable, readonly) NSNumber *requireRedeemedPoints;
@property (copy, nonatomic, nonnull, readonly) NSNumber *price;

@property (copy, nonatomic, nullable, readonly) NSString *name;
@property (copy, nonatomic, nullable, readonly) NSString *headline;
@property (copy, nonatomic, nullable, readonly) NSString *descriptionText;
@property (copy, nonatomic, nullable, readonly) NSArray<NSDictionary *> *images;

@property (copy, nonatomic, nullable, readonly) NSDate *startAt;
@property (copy, nonatomic, nullable, readonly) NSDate *expireAt;
@property (copy, nonatomic, nullable, readonly) NSDate *lastingAt;

@property (copy, nonatomic, nullable, readonly) NSDictionary *params;
@property (copy, nonatomic, nullable, readonly) NSArray<NSString *> *catalogIndexItems;

@end

NS_ASSUME_NONNULL_END
