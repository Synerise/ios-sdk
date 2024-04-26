//
//  SNRClientIdentityProvider.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @enum SNRClientIdentityProvider
 */

typedef NS_ENUM(NSUInteger, SNRClientIdentityProvider) {
    SNRClientIdentityProviderSynerise,
    SNRClientIdentityProviderOAuth,
    SNRClientIdentityProviderFacebook,
    SNRClientIdentityProviderApple,
    SNRClientIdentityProviderGoogle,
    SNRClientIdentityProviderUnknown
} NS_SWIFT_NAME(ClientIdentityProvider);

NSString * SNR_ClientIdentityProviderToString(SNRClientIdentityProvider type);
SNRClientIdentityProvider SNR_StringToClientIdentityProvider(NSString * _Nullable string);

NS_ASSUME_NONNULL_END
