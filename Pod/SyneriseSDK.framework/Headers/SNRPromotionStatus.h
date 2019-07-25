//
//  SNRPromotionStatus.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

typedef NSString *SNRPromotionStatusString;

FOUNDATION_EXPORT SNRPromotionStatusString const SNR_PROMOTION_STATUS_NONE;
FOUNDATION_EXPORT SNRPromotionStatusString const SNR_PROMOTION_STATUS_ACTIVE;
FOUNDATION_EXPORT SNRPromotionStatusString const SNR_PROMOTION_STATUS_ASSIGNED;
FOUNDATION_EXPORT SNRPromotionStatusString const SNR_PROMOTION_STATUS_REDEEMED;

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
