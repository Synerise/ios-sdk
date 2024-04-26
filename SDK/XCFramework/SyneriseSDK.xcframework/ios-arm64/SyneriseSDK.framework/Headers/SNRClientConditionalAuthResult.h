//
//  SNRClientConditionalAuthResult.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRClientConditionalAuthStatus.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRClientConditionalAuthResult
 */

NS_SWIFT_NAME(ClientConditionalAuthResult)
@interface SNRClientConditionalAuthResult : SNRBaseModel

@property (assign, nonatomic, readonly) SNRClientConditionalAuthStatus status;
@property (copy, nonatomic, nullable, readonly) NSArray<NSObject *> *conditions;

@end

NS_ASSUME_NONNULL_END
