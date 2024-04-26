//
//  SNRClientConditionalAuthStatus.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @enum SNRClientConditionalAuthStatus
 */

typedef NS_ENUM(NSUInteger, SNRClientConditionalAuthStatus) {
    SNRClientConditionalAuthStatusSuccess,
    SNRClientConditionalAuthStatusUnauthorized,
    SNRClientConditionalAuthStatusActivationRequired,
    SNRClientConditionalAuthStatusRegistrationRequired,
    SNRClientConditionalAuthStatusApprovalRequired,
    SNRClientConditionalAuthStatusTermsAcceptanceRequired,
    SNRClientConditionalAuthStatusMFARequired,
    SNRClientConditionalAuthStatusUnknown
} NS_SWIFT_NAME(ClientConditionalAuthStatus);

NSString * SNR_ClientConditionalAuthStatusToString(SNRClientConditionalAuthStatus status);
SNRClientConditionalAuthStatus SNR_StringToClientConditionalAuthStatus(NSString * _Nullable string);

NS_ASSUME_NONNULL_END
