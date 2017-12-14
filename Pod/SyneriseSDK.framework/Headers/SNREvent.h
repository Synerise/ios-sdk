//
//  SNREvent.h
//  SyneriseSDK
//
//  Created on 10/11/2017.
//  Copyright © 2017 Synerise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNRTrackerParams.h"

typedef NSDictionary<NSString *, NSObject *> SNRDictionary;

/**
 Represents event that can be tracked by @c SNRTracker.
 */
@interface SNREvent : NSObject <NSCopying>

+ (nullable instancetype)__unavailable new;
- (nullable instancetype)__unavailable init;

/**
 Initializes SNREvent object with provided label;

 @param label event label.
 @return initialized @c SNREvent object.
 */
- (nonnull instancetype)initWithLabel:(NSString * _Nonnull)label;

/**
 Initializes SNREvent object with provided label and parameters.

 @param label event label.
 @param params @c SNTRackerParams object.
 @return initialized @c SNREvent object.
 */
- (nonnull instancetype)initWithLabel:(NSString * _Nonnull)label
                            andParams:(SNRTrackerParams * _Nullable)params;

@end
