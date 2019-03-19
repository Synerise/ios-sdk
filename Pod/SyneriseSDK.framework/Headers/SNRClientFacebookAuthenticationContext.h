//
//  SNRClientFacebookAuthenticationContext.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2019 Synerise. All rights reserved.
//

#import "SNRClientAgreements.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRClientFacebookAuthenticationContext
 */

NS_SWIFT_NAME(ClientFacebookAuthenticationContext)
@interface SNRClientFacebookAuthenticationContext : SNRBaseModel

@property (copy, nonatomic, nullable, readwrite) SNRClientAgreements *agreements;

@property (copy, nonatomic, nullable, readwrite) NSDictionary *attributes;

@end

NS_ASSUME_NONNULL_END
