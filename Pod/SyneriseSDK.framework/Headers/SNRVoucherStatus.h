//
//  SNRVoucherStatus.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

/**
 * @enum SNRVoucherStatus
 */

typedef NS_ENUM(NSUInteger, SNRVoucherStatus) {
    SNRVoucherStatusUnassigned = 0,
    SNRVoucherStatusAssigned,
    SNRVoucherStatusRedeemed,
    SNRVoucherStatusCanceled
} NS_SWIFT_NAME(VoucherStatus);

NSString * SNR_VoucherStatusToString(SNRVoucherStatus type);
SNRVoucherStatus SNR_StringToVoucherStatus(NSString *string);
