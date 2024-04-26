//
//  SNRTracker.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRTrackerSettings.h>

@class SNREvent;

NS_ASSUME_NONNULL_BEGIN

/**
 * @protocol SNRTrackerDelegate
 *
 * A delegate to handle events from the Tracker.
 */

NS_SWIFT_NAME(TrackerDelegate)
@protocol SNRTrackerDelegate

@optional

/**
 * This method is called when the Tracker requests a location update.
 */
- (void)SNR_locationUpdateRequired NS_SWIFT_NAME(snr_locationUpdateRequired());

@end


/**
 * @class SNRTracker
 */

NS_SWIFT_NAME(Tracker)
@interface SNRTracker : NSObject

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

/**
 * Sets an object for Tracker module delegate methods.
 *
 * @param delegate An object that implements the `SNRTrackerDelegate` protocol.
 */
+ (void)setDelegate:(id<SNRTrackerDelegate>)delegate;

/**
 * Sets custom identifier for the current client.
 * The custom identifier will be sent with every event in event params.
 *
 * @param customIdentifier Client's custom identifier.
 */
+ (void)setCustomIdentifier:(nullable NSString *)customIdentifier;

/**
 * Sets custom email for the current client.
 * The custom email will be sent with every event in event params.
 *
 * @param customEmail Client's custom email.
 */
+ (void)setCustomEmail:(nullable NSString *)customEmail;

/**
 * Adds new event to queue and sends available events to server if possible.
 *
 * @param event `SNREvent` object.
 *
 * @note The Tracker caches and enqueues all your events locally, so they all will be sent eventually.
 */
+ (void)send:(SNREvent *)event;

/**
 * Sends events from queue to server by force.
 *
 * @param completion A block to be executed when the tracker has finished flushing events to Synerise backend, no matter the result.
 */
+ (void)flushEventsWithCompletionHandler:(nullable void (^)(void))completion NS_SWIFT_NAME(flushEvents(completionHandler:));

@end

NS_ASSUME_NONNULL_END
