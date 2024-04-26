//
//  SNRHostApplicationType.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @enum SNRHostApplicationType
 */

typedef NS_ENUM(NSUInteger, SNRHostApplicationType) {
    SNRHostApplicationTypeUnknown,
    SNRHostApplicationTypeNative,
    SNRHostApplicationTypeReactNative,
    SNRHostApplicationTypeFlutter,
    SNRHostApplicationTypeXamarin,
    SNRHostApplicationTypeOther
} NS_SWIFT_NAME(HostApplicationType);

NSString * SNR_HostApplicationTypeToString(SNRHostApplicationType type);
SNRHostApplicationType SNR_StringToHostApplicationType(NSString * _Nullable string);

NS_ASSUME_NONNULL_END

