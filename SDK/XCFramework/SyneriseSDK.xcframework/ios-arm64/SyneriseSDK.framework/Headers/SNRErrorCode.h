//
//  SNRErrorCode.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @enum SNRErrorCode
 */

typedef NS_ENUM(NSInteger, SNRErrorCode) {
    SNRErrorCodeUnknownError = -101,
    SNRErrorCodeInvalidArgument = 3050,
    SNRErrorCodeInternalInconsistency = 3060,
    SNRErrorCodeInvalidImageResources = 3090,
    SNRErrorCodeImageNotDownloaded = 3110,
    SNRErrorCodeWebViewNotPreloaded = 3130,
    SNRErrorCodeCryptoFailedError = 3610,
    SNRErrorCodeMigrationError = 3710,
    SNRErrorCodeContentWidgetError = 3810,
    SNRErrorCodeNotificationServiceExtensionError = 3910,
    SNRErrorCodeObjectConsistencyError = 4010,
    
    SNRErrorCodeUnknownApiError = -102,
    SNRErrorCodeNetworkApiError = -105,
    SNRErrorCodeInvalidRequestApiError = -103,
    SNRErrorCodeInvalidRequestSessionApiError = -104,
    SNRErrorCodeInvalidResponseApiError = -106,
    SNRErrorCodeInvalidEtagCacheResponseApiError = -107,
    SNRErrorCodeRequestBlockedByCircuitBreakerApiError = -108,
    SNRErrorCodeClientSessionUnauthorizedApiError = 3200,
    SNRErrorCodeClientSessionExpiredApiError = 3210,
    SNRErrorCodeClientSessionAlreadySignedOutApiError = 3220,
    SNRErrorCodeJWTValidationFailedApiError = 3300,
    SNRErrorCodeJWTProcessingFailedApiError = 3310,
    SNRErrorCodeMissingPublicKeyApiError = 3320,
};

NS_ASSUME_NONNULL_END
