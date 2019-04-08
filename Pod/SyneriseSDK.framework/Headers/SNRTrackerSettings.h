//
//  SNRTrackerSettings.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2019 Synerise. All rights reserved.
//

#import "SNRTrackerAutoTrackingSettings.h"
#import "SNRTrackerDeclarativeTrackingSettings.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRTrackerSettings
 */

NS_SWIFT_NAME(TrackerSettings)
@interface SNRTrackerSettings : NSObject

@property (strong, nonatomic, nonnull, readonly) SNRTrackerAutoTrackingSettings *autoTracking;

@property (strong, nonatomic, nonnull, readonly) SNRTrackerDeclarativeTrackingSettings *tracking;

//This parameter sets a minimum number of events in queue required to send them.
//Note, that adding any event to queue runs auto flush, so even queue with less than minimum number of required events will attempt to be sent.
//
//Minimum batch size is 10 by default.
@property (assign, nonatomic, readwrite) NSInteger minBatchSize;

//This parameter sets a maximum number of events, which may be sent in a single batch.
//
//Maximum batch size is 100 by default.
@property (assign, nonatomic, readwrite) NSInteger maxBatchSize;

//This parameter sets the time required to elapse before event's queue will attempt to be sent.
//Please provide your timeout in milliseconds and by default timeout equals 5 seconds.
//Note, that adding any event to queue runs auto flush, so even queue with less than minimum number of required events will attempt to be sent.
//
//Auto Flush Timeout is 5 seconds by default.
@property (assign, nonatomic, readwrite) NSTimeInterval autoFlushTimeout;

//This parameter specifies that sending location event is automatic.
//
//Location automatic is false by default.
@property (assign, nonatomic, readwrite) BOOL locationAutomatic;

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

@end

NS_ASSUME_NONNULL_END
