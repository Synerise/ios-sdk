//
//  SNRClientAuthenticationStatus.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2021 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @enum SNRClientAuthenticationStatus
 */

typedef NS_ENUM(NSUInteger, SNRClientAuthenticationStatus) {
    SNRClientAuthenticationStatusSuccess,
    SNRClientAuthenticationStatusUnauthorized,
    SNRClientAuthenticationStatusActivationRequired,
    SNRClientAuthenticationStatusPinActivationRequired,
    SNRClientAuthenticationStatusRegistrationRequired,
    SNRClientAuthenticationStatusApprovalRequired,
    SNRClientAuthenticationStatusTermsAcceptanceRequired,
    SNRClientAuthenticationStatusMFARequired,
    SNRClientAuthenticationStatusUnknown
} NS_SWIFT_NAME(ClientAuthenticationStatus);

NSString * SNR_ClientAuthenticationStatusToString(SNRClientAuthenticationStatus type);
SNRClientAuthenticationStatus SNR_StringToClientAuthenticationStatus(NSString * _Nullable string);

NS_ASSUME_NONNULL_END
