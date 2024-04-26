//
//  SNRClientAuthenticationContext.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRClientAgreements.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRClientAuthenticationContext
 */

NS_SWIFT_NAME(ClientAuthenticationContext)
@interface SNRClientAuthenticationContext : SNRBaseModel

@property (copy, nonatomic, nullable, readwrite) SNRClientAgreements *agreements;
@property (copy, nonatomic, nullable, readwrite) NSDictionary *attributes;

@end

NS_ASSUME_NONNULL_END
