//
//  SNRPromotionStatus.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

/**
 * @enum SNRPromotionStatus
 */

typedef NS_ENUM(NSUInteger, SNRPromotionStatus) {
    SNRPromotionStatusNone = 0,
    SNRPromotionStatusActive,
    SNRPromotionStatusAssigned,
    SNRPromotionStatusRedeemed
} NS_SWIFT_NAME(PromotionStatus);

NSString * SNR_PromotionStatusToString(SNRPromotionStatus type);
SNRPromotionStatus SNR_StringToPromotionStatus(NSString *string);
