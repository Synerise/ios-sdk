//
//  SNRPromotionDiscountModeDetails.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>
#import <SyneriseSDK/SNRPromotionDiscountStep.h>
#import <SyneriseSDK/SNRPromotionDiscountUsageTrigger.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRPromotionDiscountModeDetails
 */

NS_SWIFT_NAME(PromotionDiscountModeDetails)
@interface SNRPromotionDiscountModeDetails : SNRBaseModel

@property (copy, nonatomic, nonnull, readonly) NSArray<SNRPromotionDiscountStep *> *discountSteps;
@property (assign, nonatomic, readonly) SNRPromotionDiscountUsageTrigger discountUsageTrigger;

@end

NS_ASSUME_NONNULL_END
