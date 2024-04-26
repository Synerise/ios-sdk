//
//  SNRPromotionDiscountStep.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRPromotionDiscountStep
 */

NS_SWIFT_NAME(PromotionDiscountStep)
@interface SNRPromotionDiscountStep : SNRBaseModel

@property (copy, nonatomic, nonnull, readonly) NSNumber *discountValue;
@property (copy, nonatomic, nonnull, readonly) NSNumber *usageThreshold;

@end

NS_ASSUME_NONNULL_END
