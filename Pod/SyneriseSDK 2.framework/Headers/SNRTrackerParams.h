//
//  SNRTrackerParams.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2020 Synerise. All rights reserved.
//

@class SNRTrackerParamsBuilder;

/**
 * @class SNRTrackerParams
 *
 * Represents custom parameters that may be added to tracked events.
 */

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(TrackerParams)
@interface SNRTrackerParams : NSObject

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

/**
 * Initializes SNRTrackerParams object with SNRTrackerParamsBuilder.
 *
 * @param buildBlock A block object with one SNRTrackerParamsBuilder param that acts as builder.
 */
+ (instancetype)makeWithBuilder:(void (^)(SNRTrackerParamsBuilder *builder))buildBlock;

@end

NS_ASSUME_NONNULL_END
