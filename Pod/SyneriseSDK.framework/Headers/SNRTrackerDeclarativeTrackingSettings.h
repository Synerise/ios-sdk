//
//  SNRTrackerDeclarativeTrackingSettings.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2019 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRTrackerDeclarativeTrackingSettings
 */

NS_SWIFT_NAME(TrackerDeclarativeTrackingSettings)
@interface SNRTrackerDeclarativeTrackingSettings : NSObject

@property (assign, nonatomic, readwrite) BOOL enabled;

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

@end

NS_ASSUME_NONNULL_END
