//
//  SNREvent.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2020 Synerise. All rights reserved.
//

#import "SNRTrackerParams.h"

NS_ASSUME_NONNULL_BEGIN

typedef NSDictionary<NSString *, NSObject *> SNRDictionary;

/**
 * @class SNREvent
 *
 * Represents event that can be tracked by @c SNRTracker.
 *
 * @note This is an abstract class and it is not meant to be instantiated directly. You should use concrete SNREvent subclasses instead.
 */

NS_SWIFT_NAME(Event)
@interface SNREvent : NSObject <NSCopying>

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

/**
 * Initializes SNREvent object with a provided label.
 *
 * @param label Event label.
 */
- (instancetype)initWithLabel:(NSString *)label NS_SWIFT_NAME(init(label:));

/**
 * Initializes SNREvent object with provided label and parameters.
 *
 * @param label Event label.
 * @param params SNTrackerParams object.
 */
- (instancetype)initWithLabel:(NSString *)label
                    andParams:(nullable SNRTrackerParams *)params NS_SWIFT_NAME(init(label:params:));;

@end

NS_ASSUME_NONNULL_END
