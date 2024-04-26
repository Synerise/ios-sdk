//
//  SNRCrashEvent.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNREvent.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRCrashEvent
 *
 * Represents a 'application crashed' event.
 */

NS_SWIFT_NAME(CrashEvent)
@interface SNRCrashEvent : SNREvent

- (void)setExceptionName:(NSString *)exceptionName;
- (void)setExceptionReason:(NSString *)exceptionReason;
- (void)setExceptionStacktrace:(NSString *)exceptionStacktrace;

@end

NS_ASSUME_NONNULL_END
