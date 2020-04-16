//
//  SNRClientAppleSignInAuthenticationContext.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2020 Synerise. All rights reserved.
//

#import "SNRClientAgreements.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRClientOAuthAuthenticationContext
 */

NS_SWIFT_NAME(ClientAppleSignInAuthenticationContext)
@interface SNRClientAppleSignInAuthenticationContext : SNRBaseModel

@property (copy, nonatomic, nonnull, readonly) NSData *identityToken;

@property (copy, nonatomic, nullable, readwrite) SNRClientAgreements *agreements;
@property (copy, nonatomic, nullable, readwrite) NSDictionary *attributes;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithIdentityToken:(NSData *)identityToken NS_SWIFT_NAME(init(identityToken:));

@end

NS_ASSUME_NONNULL_END
