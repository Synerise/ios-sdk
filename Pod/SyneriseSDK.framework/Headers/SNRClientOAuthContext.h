//
//  SNRClientOauthContext.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2019 Synerise. All rights reserved.
//

#import "SNRClientAgreements.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRClientOauthContext
 */

NS_SWIFT_NAME(ClientOAuthContext)
@interface SNRClientOAuthContext : SNRBaseModel

@property (copy, nonatomic, nullable, readwrite) SNRClientAgreements *agreements;

@property (copy, nonatomic, nullable, readwrite) NSDictionary *attributes;

@end

NS_ASSUME_NONNULL_END
