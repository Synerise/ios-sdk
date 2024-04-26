//
//  SNRPromotionType.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

typedef NSString * SNRPromotionTypeString;

FOUNDATION_EXPORT SNRPromotionTypeString const SNR_PROMOTION_TYPE_UNKNOWN;
FOUNDATION_EXPORT SNRPromotionTypeString const SNR_PROMOTION_TYPE_MEMBERS_ONLY;
FOUNDATION_EXPORT SNRPromotionTypeString const SNR_PROMOTION_TYPE_CUSTOM;
FOUNDATION_EXPORT SNRPromotionTypeString const SNR_PROMOTION_TYPE_GENERAL;
FOUNDATION_EXPORT SNRPromotionTypeString const SNR_PROMOTION_TYPE_HANDBILL;

/**
 * @enum SNRPromotionType
 */

typedef NS_ENUM(NSUInteger, SNRPromotionType) {
    SNRPromotionTypeUnknown = 0,
    SNRPromotionTypeMembersOnly,
    SNRPromotionTypeCustom,
    SNRPromotionTypeGeneral,
    SNRPromotionTypeHandbill
} NS_SWIFT_NAME(PromotionType);

NSString * SNR_PromotionTypeToString(SNRPromotionType type);
SNRPromotionType SNR_StringToPromotionType(NSString * _Nullable string);

NS_ASSUME_NONNULL_END
