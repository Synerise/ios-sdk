//
//  SNRAssignVoucherData.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

#import "SNRBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRAssignVoucherData
 */

NS_SWIFT_NAME(AssignVoucherData)
@interface SNRAssignVoucherData : SNRBaseModel

@property (copy, nonatomic, nonnull, readonly) NSString *code;
@property (copy, nonatomic, nullable, readonly) NSDate *expireIn;
@property (copy, nonatomic, nullable, readonly) NSDate *redeemAt;
@property (copy, nonatomic, nullable, readonly) NSDate *assignedAt;
@property (copy, nonatomic, nonnull, readonly) NSDate *createdAt;
@property (copy, nonatomic, nonnull, readonly) NSDate *updatedAt;

@end

NS_ASSUME_NONNULL_END
