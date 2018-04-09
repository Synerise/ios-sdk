//
//  SNRClientAuthConfig.h
//  SyneriseSDK
//
//  Created on 04/12/2017.
//  Copyright © 2017 Synerise. All rights reserved.
//

#import "SNRAuthConfig.h"

@interface SNRClientAuthConfig : SNRAuthConfig

- (instancetype)initWithBaseURL:(NSURL *)baseURL;

@end
