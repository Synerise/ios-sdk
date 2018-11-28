//
//  SNRAssignVoucherResponse.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

#import "SNRBaseModel.h"

@class SNRAssignVoucherData;

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRAssignVoucherResponse
 */

NS_SWIFT_NAME(AssignVoucherResponse)
@interface SNRAssignVoucherResponse : SNRBaseModel

@property (copy, nonatomic, nonnull, readonly) NSString *message;
@property (copy, nonatomic, nonnull, readonly) SNRAssignVoucherData *assignVoucherData;

@end

NS_ASSUME_NONNULL_END
