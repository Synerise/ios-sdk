//
//  SNRTrackerSettings.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRTrackerAutoTrackingSettings.h>
#import <SyneriseSDK/SNRTrackerDeclarativeTrackingSettings.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRTrackerSettings
 */

NS_SWIFT_NAME(TrackerSettings)
@interface SNRTrackerSettings : NSObject

@property (strong, nonatomic, nonnull, readonly) SNRTrackerAutoTrackingSettings *autoTracking;

@property (strong, nonatomic, nonnull, readonly) SNRTrackerDeclarativeTrackingSettings *tracking;

/**
 * This parameter specifies if events should be sent when server time synchronization has failed.
 *
 * The default value is true (events are sent if synchronization fails).
 */
@property (assign, nonatomic, readwrite) BOOL isBackendTimeSyncRequired;

/**
 * This parameter sets the minimum number of events in queue required to send them.
 * Adding any event to queue runs auto flush, in which case the SDK attempts to send the queue regardless if the minimum number of events is queued.
 * The maximum value for this parameter is 100.
 *
 * The default value is 10.
 */
@property (assign, nonatomic, readwrite) NSInteger minBatchSize;

/**
 * This parameter sets the maximum number of events which may be sent in a single batch.
 * The maximum value for this parameter is 100.
 *
 * The default value is 100.
 */
@property (assign, nonatomic, readwrite) NSInteger maxBatchSize;

/**
 * This parameter sets the time required before the SDK attempts to send the event queue.
 * Provide the timeout in seconds.
 * Adding any event to queue runs auto flush, in which case the SDK attempts to send the queue regardless if the minimum number of events is queued.
 * The minimum value for this parameter is 0.5f.
 *
 * The default value is 5 seconds.
 */
@property (assign, nonatomic, readwrite) NSTimeInterval autoFlushTimeout;

/**
 * This parameter sets an array of event 'action' values which trigger the flush mechanism.
 *
 * The default value is an array of event 'action' values. Default array contains only push event's actions.
 */
@property (strong, nonatomic, nonnull, readwrite) NSArray *eventsTriggeringFlush;

/**
 * This parameter specifies if sending location events is automatic.
 *
 * The default value is false.
 */
@property (assign, nonatomic, readwrite) BOOL locationAutomatic;

@end

NS_ASSUME_NONNULL_END
