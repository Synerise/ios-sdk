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
} NS_SWIFT_NAME(ClientSex);

NSString * SNR_ClientSexToString(SNRClientSex type);
SNRClientSex SNR_StringToClientSex(NSString *string);

