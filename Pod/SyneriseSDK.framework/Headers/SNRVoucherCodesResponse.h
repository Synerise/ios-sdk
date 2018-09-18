// 
//  SNRVoucherCodesResponse.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

#import "SNRBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(VoucherCodesResponse)
@interface SNRVoucherCodesResponse : SNRBaseModel

@property (strong, nonatomic, nonnull, readonly) NSArray *vouchers;

@end

NS_ASSUME_NONNULL_END
