//
//  SNRTracker.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright © 2018 Synerise. All rights reserved.
//

@class SNREvent;

/**
 * @struct SNRTrackerConfiguration
 */

typedef struct {
    //This parameter sets a minimum number of events in queue required to send them.
    //Note, that adding any event to queue runs auto flush, so even queue with less than minimum number of required events will attempt to be sent.
    //
    //Minimum batch size is 10 by default.
    NSInteger minBatchSize;
    
    //This parameter sets a maximum number of events, which may be sent in a single batch.
    //
    //Maximum batch size is 100 by default.
    NSInteger maxBatchSize;
    
    //This parameter sets the time required to elapse before event's queue will attempt to be sent.
    //Please provide your timeout in milliseconds and by default timeout equals 5 seconds.
    //Note, that adding any event to queue runs auto flush, so even queue with less than minimum number of required events will attempt to be sent.
    //
    //Auto Flush Timeout is 5 seconds by default.
    NSTimeInterval autoFlushTimeout;
    
} SNRTrackerConfiguration NS_SWIFT_NAME(TrackerConfiguration);

/**
 * @enum SNRTrackerAutoTrackMode
 */

typedef NS_ENUM(NSInteger, SNRTrackerAutoTrackMode) {
    
    /// Autotracking is set to on touch events only.
    SNRTrackerAutoTrackModeEager,
    
    /// Autotracking is set to on click events only.
    SNRTrackerAutoTrackModePlain,
    
    /// Autotracking is set to attached to nearly everything in your app (even to activities and viewDidAppear: method to record VisitedScreen events).
    SNRTrackerAutoTrackModeFine,
    
    /// Autotracking is disabled.
    SNRTrackerAutoTrackModeDisabled
    
} NS_SWIFT_NAME(AutoTrackMode);

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRTracker
 */

NS_SWIFT_NAME(Tracker)
@interface SNRTracker : NSObject

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

/**
 * Enables/disables console logs from SNRTracker.
 *
 * @param enabled Specifies that console logs are enabled/disabled.
 *
 * @note It is not recommended to use debug mode in release version of your application.
 */
+ (void)setLoggingEnabled:(BOOL)enabled;

/**
 * Sets configuration of tracker.
 *
 * @param configuration Configuration of tracker.
 */
+ (void)setConfiguration:(SNRTrackerConfiguration)configuration;

/**
 * Sets mode of AutoTrack.
 *
 * @note AutoTrack is disabled by default - mode is set up to SNRTrackerAutoTrackModeDisabled.
 *
 * @param mode Mode of AutoTrack functionality.
 */
+ (void)setAutoTrackMode:(SNRTrackerAutoTrackMode)mode;

/**
 * Your custom identifier will be sent within every event in event params.
 *
 * @param customIdentifier Client's custom identifier.
 */
+ (void)setCustomIdentifier:(NSString *)customIdentifier;

/**
 * Your custom email will be sent within every event in event params.
 *
 * @param customEmail Client's email.
 */
+ (void)setCustomEmail:(NSString *)customEmail;

/**
 * Adds new event to queue and sends available events to server if possible.
 *
 * @param event SNREvent object.
 */
+ (void)send:(SNREvent *)event;

/**
 * Forces sending unsent events to Synerise server.
 *
 * @param completion A block to be executed when @c SNRTracler has finished flushing events to Synerise servers, no matter the result.
 */
+ (void)flushEventsWithCompletionHandler:(nullable void (^)(void))completion NS_SWIFT_NAME(flushEvents(completionHandler:));

@end

NS_ASSUME_NONNULL_END
