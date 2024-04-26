//
//  SNRPromotionDiscountType.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @enum SNRPromotionDiscountType
 */

typedef NS_ENUM(NSUInteger, SNRPromotionDiscountType) {
    SNRPromotionDiscountTypeNone = 0,
    SNRPromotionDiscountTypePercent,
    SNRPromotionDiscountTypeAmount,
    SNRPromotionDiscountType2For1,
    SNRPromotionDiscountTypePoints,
    SNRPromotionDiscountTypeMultibuy,
    SNRPromotionDiscountTypeExactPrice
} NS_SWIFT_NAME(PromotionDiscountType);

NSString * SNR_PromotionDiscountTypeToString(SNRPromotionDiscountType type);
SNRPromotionDiscountType SNR_StringToPromotionDiscountType(NSString * _Nullable string);

NS_ASSUME_NONNULL_END
