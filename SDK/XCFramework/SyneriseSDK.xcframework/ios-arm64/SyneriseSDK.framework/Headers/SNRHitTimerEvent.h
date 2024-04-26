//
//  SNRHitTimerEvent.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNREvent.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRHitTimerEvent
 *
 * Represents a 'client hit timer' event.
 *
 * @note This could be used for profiling or activity time monitoring - you can send `SNRHitTimerEvent` when your customer starts doing something and send it once again when they finish, but this time with a different time signature. You can then use our analytics engine to measure, for example, average activity
 */

NS_SWIFT_NAME(HitTimerEvent)
@interface SNRHitTimerEvent : SNREvent

@end

NS_ASSUME_NONNULL_END
