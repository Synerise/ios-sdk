//
//  SNRCustomEvent.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "SNREvent.h"

/**
 Represents a custom event.
 */

NS_SWIFT_NAME(CustomEvent)
@interface SNRCustomEvent : SNREvent

- (nonnull instancetype)__unavailable initWithLabel:(nonnull NSString *)label
andParams:(nullable SNRTrackerParams *)params NS_SWIFT_NAME(init(label:params:));
- (nonnull instancetype)__unavailable initWithLabel:(nonnull NSString *)label NS_SWIFT_NAME(init(label:));

/**
 Initializes SNRCustomEvent object with provided label, action and parameters.

 @param label event label.
 @param action event action to be tracked.
 @param params @c SNTRackerParams object.

 @return initialized @c SNREvent object.
 */
- (nonnull instancetype)initWithLabel:(nonnull NSString *)label
                               action:(nonnull NSString *)action
                            andParams:(nullable SNRTrackerParams *)params NS_SWIFT_NAME(init(label:action:params:));

/**
 Initializes SNRCustomEvent object with provided label and action.

 @param label event label.
 @param action event action to be tracked.

 @return initialized @c SNREvent object.
 */
- (nonnull instancetype)initWithLabel:(nonnull NSString *)label
                               action:(nonnull NSString *)action NS_SWIFT_NAME(init(label:action:));

@end
