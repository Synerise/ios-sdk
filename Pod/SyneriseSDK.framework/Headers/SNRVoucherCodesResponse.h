//
//  SNRVoucherCodesResponse.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

#import "SNRBaseModel.h"

@class SNRVoucherCodesData;

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRVoucherCodesResponse
 */

NS_SWIFT_NAME(VoucherCodesResponse)
@interface SNRVoucherCodesResponse : SNRBaseModel

@property (strong, nonatomic, nonnull, readonly) NSArray<SNRVoucherCodesData *> *items;

@end

NS_ASSUME_NONNULL_END
