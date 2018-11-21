//
//  SNRCustomEvent.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "SNREvent.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRCustomEvent
 *
 * Represents a custom event.
 */

NS_SWIFT_NAME(CustomEvent)
@interface SNRCustomEvent : SNREvent

- (instancetype)__unavailable initWithLabel:(NSString *)label andParams:(nullable SNRTrackerParams *)params;
- (instancetype)__unavailable initWithLabel:(NSString *)label;

/**
 * Initializes SNRCustomEvent object with provided label, action and parameters.
 *
 * @param label Event label.
 * @param action Event action.
 * @param params SNTRackerParams object.
 */
- (instancetype)initWithLabel:(NSString *)label
                       action:(NSString *)action
                    andParams:(nullable SNRTrackerParams *)params NS_SWIFT_NAME(init(label:action:params:));

/**
 * Initializes SNRCustomEvent object with provided label and action.
 *
 * @param label Event label.
 * @param action Event action.
 */
- (instancetype)initWithLabel:(NSString *)label
                               action:(NSString *)action NS_SWIFT_NAME(init(label:action:));

@end

NS_ASSUME_NONNULL_END
