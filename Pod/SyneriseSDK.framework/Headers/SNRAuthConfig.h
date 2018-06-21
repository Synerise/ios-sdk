//
//  SNRAuthConfig.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright © 2018 Synerise. All rights reserved.
//



/**
 Abstract class representing authentication config.
 */
NS_ASSUME_NONNULL_BEGIN
@interface SNRAuthConfig : NSObject <NSCopying>

@property (readonly, nonatomic, copy) NSURL *baseURL;

- (instancetype)init
__attribute__((unavailable("Use initWithBaseURL: instead")));
+ (instancetype)new
__attribute__((unavailable("Use initWithBaseURL: instead")));

@end
NS_ASSUME_NONNULL_END
