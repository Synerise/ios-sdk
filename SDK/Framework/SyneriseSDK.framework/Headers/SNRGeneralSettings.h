//
//  SNRGeneralSettings.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2023 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRPublicKeyPinningAlgorithm.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRGeneralSettings
 */

NS_SWIFT_NAME(GeneralSettings)
@interface SNRGeneralSettings : NSObject

/**
 * This parameter specifies if all of the SDK functionalities are enabled.
 *
 * The default value is true.
 */
@property (assign, nonatomic, readwrite) BOOL enabled;

/**
 * Identifies the app group that your app and its extensions belong to.
 * This property is required to allow the SDK to share data with the Host App and its extensions.
 *
 * The default value is nil.
 */
@property (copy, nonatomic, nullable, readwrite) NSString *appGroupIdentifier;

/**
 * This parameter identifies the keychain group that your app and its extensions belong to.
 * This property is required to allow the SDK to share sensitive data with the Host App and its extensions.
 *
 * The default value is nil.
 */
@property (copy, nonatomic, nullable, readwrite) NSString *keychainGroupIdentifier;

/**
 * This parameter sets a time counting backwards from expiration time, within which an authentication token will be automatically refreshed by the SDK.
 * That minimum value for this parameter is 1800 seconds (30 minutes).
 *
 * The default value is 1800 seconds (30 minutes).
 */
@property (assign, nonatomic, readwrite) NSTimeInterval minTokenRefreshInterval;

/**
 * This parameter sets an array of SSL pins, where each pin is a base64-encoded SHA-256 hash of a certificate's SPKI.
 * These SSL pins are used when you use a custom URL for the Synerise API.
 *
 * The default value is an empty array.
 */
@property (copy, nonatomic, nullable, readwrite) NSArray *SSLPinningPinset;

/**
 * This parameter specifies the supported algorithms for generating the SSL pins' certificates.
 * This option is only required for proper SSL Pinning support for system versions before iOS 10.
 *
 * The default value is an array containing the `kSNRPublicKeyPinningAlgorithmRsa2048` value.
 */
@property (copy, nonatomic, nullable, readwrite) NSArray<SNRPublicKeyPinningAlgorithm> *SSLPinningPublicKeySupportedAlgorithms;

/**
 * This parameter specifies if a session should be destroyed after Profile API key (formerly Client API Key) changes.
 *
 * The default value is true.
 */
@property (assign, nonatomic, readwrite) BOOL shouldDestroySessionOnApiKeyChange;

@end

NS_ASSUME_NONNULL_END
