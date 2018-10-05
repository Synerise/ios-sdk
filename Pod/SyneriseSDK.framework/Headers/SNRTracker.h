//
//  SNRTracker.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

@class SNREvent;

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

/**
 * SNTracker is responsible for tracking various SNREvents.
 */

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(Tracker)
@interface SNRTracker : NSObject

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

/**
 * Enables/disables console logs from SNRTracker.
 *
 * @note It is not recommended to use debug mode in release version of your application.
 *
 * @param enabled - specified is console logs are enabled.
 */
+ (void)setLoggingEnabled:(BOOL)enabled;

/**
 * Initializes tracker.
 *
 * @note This method needs to be called before any other method of SNRTracker class and only once during application lifecycle.
 *
 * @param apiKey - Synerise API Key.
 */
+ (void)initialize:(NSString *)apiKey;

/**
 * Sets configuration of tracker.
 *
 * @param configuration - configuration of tracker.
 */
+ (void)setConfiguration:(SNRTrackerConfiguration)configuration;

/**
 * Sets mode of AutoTrack.
 *
 * @note AutoTrack is disabled by default - mode is set up to SNRTrackerAutoTrackModeDisabled.
 *
 * @param mode - mode of AutoTrack functionality.
 */
+ (void)setAutoTrackMode:(SNRTrackerAutoTrackMode)mode;

/**
 * Your custom identifier will be sent within every event in event params.
 *
 * @param customIdentifier - client's custom identifier.
 */
+ (void)setCustomIdentifier:(NSString *)customIdentifier;

/**
 * Your custom email will be sent within every event in event params.
 *
 * @param customEmail - client's email.
 */
+ (void)setCustomEmail:(NSString *)customEmail;

/**
 * Adds new event to queue and sends available events to server if possible.
 *
 * @param event - @c SNREvent object.
 */
+ (void)send:(SNREvent *)event;

/**
 * Forces sending unsent events to Synerise server.
 *
 * @param completion - a block object to be executed when @c SNRTracler has finished flushing events to Synerise servers, no matter the result.
 */
+ (void)flushEventsWithCompletionHandler:(nullable void (^)(void))completion NS_SWIFT_NAME(flushEvents(completionHandler:));

/**
 * Forces sending unsent events to Synerise server.
 */
+ (void)flushEvents __deprecated_msg("Use [SNRTracker flushEventsWithCompletionHandler:] method instead.");

@end

NS_ASSUME_NONNULL_END
