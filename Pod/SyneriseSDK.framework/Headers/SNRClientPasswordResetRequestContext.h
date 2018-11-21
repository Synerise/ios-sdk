//
//  SNRClientPasswordResetRequestContext.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

#import "SNRBaseContext.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRClientPasswordResetRequestContext
 */

NS_SWIFT_NAME(ClientPasswordResetRequestContext)
@interface SNRClientPasswordResetRequestContext : SNRBaseContext

@property (copy, nonatomic, nonnull, readonly) NSString *email;

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

- (instancetype)initWithEmail:(NSString *)email NS_SWIFT_NAME(init(email:));

@end

NS_ASSUME_NONNULL_END
