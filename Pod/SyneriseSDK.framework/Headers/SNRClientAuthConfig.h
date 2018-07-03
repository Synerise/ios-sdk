//
//  SNRClientAuthConfig.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "SNRAuthConfig.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(ClientAuthConfig)
@interface SNRClientAuthConfig : SNRAuthConfig

- (instancetype)initWithBaseURL:(NSURL *)baseURL;

@end

NS_ASSUME_NONNULL_END
