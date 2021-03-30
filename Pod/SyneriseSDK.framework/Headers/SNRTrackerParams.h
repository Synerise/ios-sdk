//
//  SNRTrackerParams.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2021 Synerise. All rights reserved.
//

@class SNRTrackerParamsBuilder;

/**
 * @class SNRTrackerParams
 *
 * Object with parameters that may be added to tracked events.
 */

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(TrackerParams)
@interface SNRTrackerParams : NSObject

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

+ (instancetype)makeWithBuilder:(void (^)(SNRTrackerParamsBuilder *builder))buildBlock;

@end

NS_ASSUME_NONNULL_END
