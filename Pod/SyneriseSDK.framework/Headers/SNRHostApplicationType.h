//
//  SNRHostApplicationType.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2020 Synerise. All rights reserved.
//

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
};

NSString * _Nonnull SNR_HostApplicationTypeToString(SNRHostApplicationType type);
SNRHostApplicationType SNR_StringToHostApplicationType(NSString * _Nullable string);
