//
//  SNRVoucherStatus.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2020 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

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
SNRVoucherStatus SNR_StringToVoucherStatus(NSString * _Nullable string);

NS_ASSUME_NONNULL_END
