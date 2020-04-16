//
//  SNRTrackerDeclarativeTrackingSettings.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2020 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRTrackerDeclarativeTrackingSettings
 */

NS_SWIFT_NAME(TrackerDeclarativeTrackingSettings)
@interface SNRTrackerDeclarativeTrackingSettings : NSObject

//This parameter specifies if declarative tracking functionality is enabled.
//
//Property is true by default.
@property (assign, nonatomic, readwrite) BOOL enabled;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
