//
//  SNRCustomEvent.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2021 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNREvent.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRCustomEvent
 *
 * Represents a custom event.
 */

NS_SWIFT_NAME(CustomEvent)
@interface SNRCustomEvent : SNREvent

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)initWithLabel:(NSString *)label andParams:(nullable SNRTrackerParams *)params NS_UNAVAILABLE;
- (instancetype)initWithLabel:(NSString *)label NS_UNAVAILABLE;

- (instancetype)initWithLabel:(NSString *)label
                       action:(NSString *)action NS_SWIFT_NAME(init(label:action:));

- (instancetype)initWithLabel:(NSString *)label
                       action:(NSString *)action
                    andParams:(nullable SNRTrackerParams *)params NS_SWIFT_NAME(init(label:action:params:));

- (instancetype)initWithType:(NSString *)type
                       label:(NSString *)label
                       action:(NSString *)action
                    andParams:(nullable SNRTrackerParams *)params NS_SWIFT_NAME(init(type:label:action:params:));

@end

NS_ASSUME_NONNULL_END
