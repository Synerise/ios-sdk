//
//  SNRTrackerDeclarativeTrackingSettings.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2023 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRTrackerDeclarativeTrackingSettings
 */

NS_SWIFT_NAME(TrackerDeclarativeTrackingSettings)
@interface SNRTrackerDeclarativeTrackingSettings : NSObject

/**
 * This parameter specifies if declarative tracking is enabled.
 *
 * The default value is true.
 */
@property (assign, nonatomic, readwrite) BOOL enabled;

@end

NS_ASSUME_NONNULL_END
