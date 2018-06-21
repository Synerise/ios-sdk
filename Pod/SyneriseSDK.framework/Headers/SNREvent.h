//
//  SNREvent.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "SNRTrackerParams.h"

typedef NSDictionary<NSString *, NSObject *> SNRDictionary;

/**
 Represents event that can be tracked by @c SNRTracker.

 @note this is an abstract class and it is not meant to be instantiated directly. You should use concrete SNREvent subclasses instead.
 */

NS_SWIFT_NAME(Event)
@interface SNREvent : NSObject <NSCopying>

+ (nullable instancetype)__unavailable new;
- (nullable instancetype)__unavailable init;

/**
 Initializes SNREvent object with provided label;

 @param label event label.
 @return initialized @c SNREvent object.
 */
- (nonnull instancetype)initWithLabel:(nonnull NSString *)label NS_SWIFT_NAME(init(label:));

/**
 Initializes SNREvent object with provided label and parameters.

 @param label event label.
 @param params @c SNTRackerParams object.
 @return initialized @c SNREvent object.
 */
- (nonnull instancetype)initWithLabel:(nonnull NSString *)label
                            andParams:(nullable SNRTrackerParams *)params NS_SWIFT_NAME(init(label:params:));;

@end
