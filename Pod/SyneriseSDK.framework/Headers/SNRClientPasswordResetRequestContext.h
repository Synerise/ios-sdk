//
//  SNRClientPasswordResetRequestContext.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "SNRBaseContext.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(ClientPasswordResetRequestContext)
@interface SNRClientPasswordResetRequestContext : SNRBaseContext

@property (readonly, nonatomic, nonnull, copy) NSString *email;

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

- (instancetype)init:(NSString *)email;

@end

NS_ASSUME_NONNULL_END
