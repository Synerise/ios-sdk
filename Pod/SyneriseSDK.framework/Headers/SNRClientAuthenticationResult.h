//
//  SNRClientAuthenticationResult.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2021 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRClientAuthenticationStatus.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRClientAuthenticationResult
 */

NS_SWIFT_NAME(ClientAuthenticationResult)
@interface SNRClientAuthenticationResult : SNRBaseModel

@property (assign, nonatomic, readonly) BOOL isSuccess;
@property (copy, nonatomic, nullable, readonly) NSString *token;

@property (assign, nonatomic, readonly) SNRClientAuthenticationStatus status;

@property (copy, nonatomic, nullable, readonly) NSArray<NSObject *> *conditions;

@end

NS_ASSUME_NONNULL_END
