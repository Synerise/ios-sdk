//
//  SNRPromotionType.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

/**
 * @enum SNRPromotionType
 */

typedef NS_ENUM(NSUInteger, SNRPromotionType) {
    SNRPromotionTypeUnknown = 0,
    SNRPromotionTypeMembersOnly,
    SNRPromotionTypeCustom,
    SNRPromotionTypeGeneral
} NS_SWIFT_NAME(PromotionType);

NSString * SNR_PromotionTypeToString(SNRPromotionType type);
SNRPromotionType SNR_StringToPromotionType(NSString *string);
