//
//  SNRHitTimerEvent.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "SNREvent.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRHitTimerEvent
 *
 * Represents a 'client hit timer' event.
 *
 * @note This could be used for profiling or activity time monitoring - you can send @c SNRHitTimerEvent when your client starts doing something and send it once again when he finishes, but this time with the different time signature. Then you can use our analytics engine to measure e.g. average activity time.
 */

NS_SWIFT_NAME(HitTimerEvent)
@interface SNRHitTimerEvent : SNREvent

@end

NS_ASSUME_NONNULL_END
