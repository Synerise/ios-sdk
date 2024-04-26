//
//  SNRPromotionDiscountUsageTrigger.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @enum SNRPromotionDiscountUsageTrigger
 */

typedef NS_ENUM(NSUInteger, SNRPromotionDiscountUsageTrigger) {
    SNRPromotionDiscountUsageTriggerTransaction = 0,
    SNRPromotionDiscountUsageTriggerRedeem
} NS_SWIFT_NAME(PromotionDiscountUsageTrigger);

NSString * SNR_PromotionDiscountUsageTriggerToString(SNRPromotionDiscountUsageTrigger trigger);
SNRPromotionDiscountUsageTrigger SNR_StringToPromotionDiscountUsageTrigger(NSString * _Nullable string);

NS_ASSUME_NONNULL_END
