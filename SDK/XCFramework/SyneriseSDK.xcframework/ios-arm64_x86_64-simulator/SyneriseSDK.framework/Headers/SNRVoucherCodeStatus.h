//
//  SNRVoucherCodeStatus.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @enum SNRVoucherCodeStatus
 */

typedef NS_ENUM(NSUInteger, SNRVoucherCodeStatus) {
    SNRVoucherCodeStatusUnassigned = 0,
    SNRVoucherCodeStatusAssigned,
    SNRVoucherCodeStatusRedeemed,
    SNRVoucherCodeStatusCanceled
} NS_SWIFT_NAME(VoucherCodeStatus);

NSString * SNR_VoucherCodeStatusToString(SNRVoucherCodeStatus type);
SNRVoucherCodeStatus SNR_StringToVoucherCodeStatus(NSString * _Nullable string);

NS_ASSUME_NONNULL_END
