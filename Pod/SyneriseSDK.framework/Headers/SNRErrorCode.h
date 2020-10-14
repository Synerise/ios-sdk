//
//  SNRErrorCode.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2020 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @enum SNRErrorCode
 */

typedef NS_ENUM(NSInteger, SNRErrorCode) {
    SNRErrorCodeUnknownError = -101,

    SNRErrorCodeUnknownApiError = -102,
    SNRErrorCodeNetworkApiError = -105,
    SNRErrorCodeInvalidRequestApiError = -103,
    SNRErrorCodeInvalidRequestSessionApiError = -104,
    SNRErrorCodeInvalidResponseApiError = -106,

    SNRErrorCodeInvalidArgument = 3050,

    SNRErrorCodeImageNotDownloaded = 3110,
    
    SNRErrorCodeClientSessionUnauthorized = 3200,
    SNRErrorCodeClientSessionExpired = 3210,

    SNRErrorCodeJWTValidationFailed = 3300,

    SNRErrorCodeCryptoFailedError = 3610,

    SNRErrorCodeMigrationError = 3710
};

NS_ASSUME_NONNULL_END
