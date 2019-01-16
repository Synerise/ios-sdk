//
//  SNRTokenOrigin.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2019 Synerise. All rights reserved.
//

/**
 * @enum SNRTokenOrigin
 */

typedef NS_ENUM(NSUInteger, SNRTokenOrigin) {
    SNRTokenOriginUnknown,
    SNRTokenOriginSynerise,
    SNRTokenOriginFacebook,
    SNRTokenOriginOauth
};

NSString * SNR_TokenOriginToString(SNRTokenOrigin type);
SNRTokenOrigin SNR_StringToTokenOrigin(NSString *string);
