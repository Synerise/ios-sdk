//
//  SNRAuthConfig.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 Abstract class representing authentication config.
 */
@interface SNRAuthConfig : NSObject <NSCopying>

@property (readonly, nonatomic, copy) NSURL *baseURL;

- (instancetype)init
__attribute__((unavailable("Use initWithBaseURL: instead")));
+ (instancetype)new
__attribute__((unavailable("Use initWithBaseURL: instead")));

@end

NS_ASSUME_NONNULL_END
