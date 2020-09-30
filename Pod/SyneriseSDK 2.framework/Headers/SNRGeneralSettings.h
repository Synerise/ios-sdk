//
//  SNRGeneralSettings.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2020 Synerise. All rights reserved.
//

#import "SNRPublicKeyPinningAlgorithm.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRGeneralSettings
 */

NS_SWIFT_NAME(GeneralSettings)
@interface SNRGeneralSettings : NSObject

//This parameter specifies if all of the SDK functionalities are enabled.
//
//Property is true by default.
@property (assign, nonatomic, readwrite) BOOL enabled;

//This parameter identifies the user defaults group used by applications and extensions belongs to.
//Note, that it is required property to allow the SDK communicating with Host App and its extensions for proper handling Rich Media Notifications.
//
//Property is nil by default.
@property (copy, nonatomic, nullable, readwrite) NSString *appGroupIdentifier;

//This parameter identifies the keychain group used by applications, extensions and services belongs to.
//Note, that it is required property to allow the SDK communicating with Host App and notification service extension for proper notification decryption.
//
//Property is nil by default.
@property (copy, nonatomic, nullable, readwrite) NSString *keychainGroupIdentifier;

//This parameter sets time interval counting backwards from expiration time, within which token will be automatically refreshed by SDK.
//Note, that minimum value for this parameter is 1800 seconds (30 minutes).
//
//Property is 1800 seconds (30 minutes) by default.
@property (assign, nonatomic, readwrite) NSTimeInterval minTokenRefreshInterval;

//This parameter sets an array of SSL pins, where each pin is the base64-encoded SHA-256 hash of a certificate's SPKI.
//Note, that these SSL pins are used in case, which you uses Synerise API custom environment URL.
//
// Property is empty array by default.
@property (copy, nonatomic, nullable, readwrite) NSArray *SSLPinningPinset;

//This parameter specifies supported algorithms for generating the SSL pins certificates.
//Note, that this option is only required for proper SSL Pinning support for system versions before iOS 10.
//
// Property is array contained kSNRPublicKeyPinningAlgorithmRsa2048 value by default.
@property (assign, nonatomic, readwrite) NSArray<SNRPublicKeyPinningAlgorithm> *SSLPinningPublicKeySupportedAlgorithms;

//This parameter specifies if session should be destroyed after client api key changes.
//
//Property is true by default.
@property (assign, nonatomic, readwrite) BOOL shouldDestroySessionOnApiKeyChange;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
