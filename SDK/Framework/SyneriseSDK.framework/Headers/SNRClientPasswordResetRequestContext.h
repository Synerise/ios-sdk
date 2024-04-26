//
//  SNRClientPasswordResetRequestContext.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRClientPasswordResetRequestContext
 */

NS_SWIFT_NAME(ClientPasswordResetRequestContext)
@interface SNRClientPasswordResetRequestContext : SNRBaseModel

@property (copy, nonatomic, nonnull, readonly) NSString *email;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithEmail:(NSString *)email NS_SWIFT_NAME(init(email:));

@end

NS_ASSUME_NONNULL_END
