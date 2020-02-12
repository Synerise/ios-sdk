//
//  SNRPublicKeyPinningAlgorithm.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2020 Synerise. All rights reserved.
//

#ifndef SNRPublicKeyPinningAlgorithm_h
#define SNRPublicKeyPinningAlgorithm_h

NS_ASSUME_NONNULL_BEGIN

typedef NSString *SNRPublicKeyPinningAlgorithm;

FOUNDATION_EXPORT SNRPublicKeyPinningAlgorithm const kSNRPublicKeyPinningAlgorithmRsa2048;
FOUNDATION_EXPORT SNRPublicKeyPinningAlgorithm const kSNRPublicKeyPinningAlgorithmRsa4096;
FOUNDATION_EXPORT SNRPublicKeyPinningAlgorithm const kSNRPublicKeyPinningAlgorithmEcDsaSecp256r1;
FOUNDATION_EXPORT SNRPublicKeyPinningAlgorithm const kSNRPublicKeyPinningAlgorithmEcDsaSecp384r1;

NS_ASSUME_NONNULL_END

#endif /* SNRPublicKeyPinningAlgorithm_h */
