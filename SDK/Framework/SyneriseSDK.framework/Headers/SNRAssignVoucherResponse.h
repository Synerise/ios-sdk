//
//  SNRAssignVoucherResponse.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>
#import <SyneriseSDK/SNRAssignVoucherData.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRAssignVoucherResponse
 */

NS_SWIFT_NAME(AssignVoucherResponse)
@interface SNRAssignVoucherResponse : SNRBaseModel

@property (copy, nonatomic, nonnull, readonly) NSString *message;
@property (strong, nonatomic, nonnull, readonly) SNRAssignVoucherData *assignVoucherData;

@end

NS_ASSUME_NONNULL_END
