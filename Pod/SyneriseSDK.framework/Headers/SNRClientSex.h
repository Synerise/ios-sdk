//
//  SNRClientSex.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright © 2018 Synerise. All rights reserved.
//

/**
 * @enum SNRClientSex
 */

typedef NS_ENUM(NSUInteger, SNRClientSex) {
    SNRClientSexNotSpecified = 0,
    SNRClientSexMale,
    SNRClientSexFemale,
    SNRClientSexOther,
} NS_SWIFT_NAME(ClientSex);

NSString * _Nonnull SNR_ClientSexToString(SNRClientSex type);
SNRClientSex SNR_StringToClientSex(NSString * _Nullable string);

