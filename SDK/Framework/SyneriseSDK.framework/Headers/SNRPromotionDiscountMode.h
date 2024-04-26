//
//  SNRPromotionDiscountMode.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @enum SNRPromotionDiscountMode
 */

typedef NS_ENUM(NSUInteger, SNRPromotionDiscountMode) {
    SNRPromotionDiscountModeStatic = 0,
    SNRPromotionDiscountModeStep
} NS_SWIFT_NAME(PromotionDiscountMode);

NSString * SNR_PromotionDiscountModeToString(SNRPromotionDiscountMode mode);
SNRPromotionDiscountMode SNR_StringToPromotionDiscountMode(NSString * _Nullable string);

NS_ASSUME_NONNULL_END
