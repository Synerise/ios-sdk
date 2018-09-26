//
//  SNRPromotion.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

#import "SNRBaseModel.h"

/**
 * @enum SNRPromotionType
 */
typedef NS_ENUM(NSUInteger, SNRPromotionType) {
    SNRPromotionTypeUnknown = 0,
    SNRPromotionTypeMembersOnly,
    SNRPromotionTypeCustom,
    SNRPromotionTypeGeneral
};

/**
 * @enum SNRPromotionDiscountType
 */
typedef NS_ENUM(NSUInteger, SNRPromotionDiscountType) {
    SNRPromotionDiscountTypeNone = 0,
    SNRPromotionDiscountTypePercent,
    SNRPromotionDiscountTypeAmount,
    SNRPromotionDiscountType2For1,
    SNRPromotionDiscountTypePoints
};

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(Promotion)
@interface SNRPromotion : SNRBaseModel

+ (NSString *)NSStringFromPromotionType:(SNRPromotionType)promotionType NS_SWIFT_NAME(stringFromPromotionType(_:));
+ (SNRPromotionType)promotionTypeFromNSString:(NSString *)string NS_SWIFT_NAME(promotionTypeFromString(_:));

+ (NSString *)NSStringFromPromotionDiscountType:(SNRPromotionDiscountType)promotionDiscountType NS_SWIFT_NAME(stringFromPromotionDiscountType(_:));
+ (SNRPromotionDiscountType)promotionDiscountTypeFromNSString:(NSString *)string NS_SWIFT_NAME(promotionDiscountTypeFromString(_:));

@end

NS_ASSUME_NONNULL_END
