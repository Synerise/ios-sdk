//
//  SNRVoucherCodesData.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

#import "SNRBaseModel.h"
#import "SNRVoucherStatus.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRVoucherCodesData
 */

NS_SWIFT_NAME(VoucherCodesData)
@interface SNRVoucherCodesData : SNRBaseModel

@property (copy, nonatomic, nonnull, readonly) NSString *code;
@property (assign, nonatomic, readonly) SNRVoucherStatus status;
@property (copy, nonatomic, nullable, readonly) NSString *clientId;
@property (copy, nonatomic, nonnull, readonly) NSString *clientUuid;
@property (copy, nonatomic, nonnull, readonly) NSString *poolUuid;
@property (copy, nonatomic, nullable, readonly) NSDate *expireIn;
@property (copy, nonatomic, nullable, readonly) NSDate *redeemAt;
@property (copy, nonatomic, nullable, readonly) NSDate *assignedAt;
@property (copy, nonatomic, nonnull, readonly) NSDate *createdAt;
@property (copy, nonatomic, nonnull, readonly) NSDate *updatedAt;

@end

NS_ASSUME_NONNULL_END
