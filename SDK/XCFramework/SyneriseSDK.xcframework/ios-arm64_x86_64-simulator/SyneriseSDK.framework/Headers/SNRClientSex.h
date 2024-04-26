//
//  SNRClientSex.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @enum SNRClientSex
 */

typedef NS_ENUM(NSUInteger, SNRClientSex) {
    SNRClientSexNotSpecified = 0,
    SNRClientSexMale,
    SNRClientSexFemale,
    SNRClientSexOther,
} NS_SWIFT_NAME(ClientSex);

NSString * SNR_ClientSexToString(SNRClientSex clientSex);
SNRClientSex SNR_StringToClientSex(NSString * _Nullable string);

NS_ASSUME_NONNULL_END

