//
//  SNRAssignVoucherResponse.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

#import "SNRBaseModel.h"
#import "SNRAssignVoucherData.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(AssignVoucherResponse)
@interface SNRAssignVoucherResponse : SNRBaseModel

@property (copy, nonatomic, nullable, readonly) NSString *message;
@property (copy, nonatomic, nullable, readonly) SNRAssignVoucherData *data;

@end

NS_ASSUME_NONNULL_END
