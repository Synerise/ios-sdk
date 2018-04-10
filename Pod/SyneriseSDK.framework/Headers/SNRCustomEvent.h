//
//  SNRCustomEvent.h
//  SyneriseSDK
//
//  Created on 10/11/2017.
//  Copyright © 2017 Synerise. All rights reserved.
//

#import "SNREvent.h"

/**
 Represents a custom event.
 */
@interface SNRCustomEvent : SNREvent

- (nonnull instancetype)__unavailable initWithLabel:(NSString * _Nonnull)label
andParams:(SNRTrackerParams * _Nullable)params;
- (nonnull instancetype)__unavailable initWithLabel:(NSString * _Nonnull)label;

/**
 Initializes SNRCustomEvent object with provided label, action and parameters.

 @param label event label.
 @param action event action to be tracked.
 @param params @c SNTRackerParams object.

 @return initialized @c SNREvent object.
 */
- (nonnull instancetype)initWithLabel:(NSString * _Nonnull)label
                               action:(NSString * _Nonnull)action
                            andParams:(SNRTrackerParams * _Nullable)params;

/**
 Initializes SNRCustomEvent object with provided label and action.

 @param label event label.
 @param action event action to be tracked.

 @return initialized @c SNREvent object.
 */
- (nonnull instancetype)initWithLabel:(NSString * _Nonnull)label
                               action:(NSString * _Nonnull)action;

@end
