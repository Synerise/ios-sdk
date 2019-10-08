//
//  SNRCrashEvent.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2019 Synerise. All rights reserved.
//

#import "SNREvent.h"

NS_ASSUME_NONNULL_BEGIN

@interface SNRCrashEvent : SNREvent

- (void)setExceptionName:(NSString *)exceptionName;
- (void)setExceptionReason:(NSString *)exceptionReason;
- (void)setExceptionStacktrace:(NSString *)exceptionStacktrace;

@end

NS_ASSUME_NONNULL_END
