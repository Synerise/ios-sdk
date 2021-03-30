//
//  SNRTrackerAutoTracking.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2021 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @enum SNRTrackerAutoTrackMode
 */

typedef NS_ENUM(NSInteger, SNRTrackerAutoTrackMode) {
    
    /// Autotracking is set to on touch events only.
    SNRTrackerAutoTrackModeEager,
    
    /// Autotracking is set to on-click events only.
    SNRTrackerAutoTrackModePlain,
    
    /// Autotracking is set to attached to nearly everything in your app (even to activities and the `viewDidAppear:` method which records Visited Screen events).
    SNRTrackerAutoTrackModeFine,
    
    /// Autotracking is disabled.
    SNRTrackerAutoTrackModeDisabled
    
} NS_SWIFT_NAME(AutoTrackMode);

/**
 * @class SNRTrackerAutoTrackingSettings
 */

NS_SWIFT_NAME(TrackerAutoTrackingSettings)
@interface SNRTrackerAutoTrackingSettings : NSObject

/**
 * This parameter specifies if AutoTracking is enabled.
 *
 * The default value is true.
 */
@property (assign, nonatomic, readwrite) BOOL enabled;

/**
 * This parameter sets the mode of AutoTracking.
 *
 * The default value is `SNRTrackerAutoTrackModeDisabled`.
 */
@property (assign, nonatomic, readwrite) SNRTrackerAutoTrackMode mode;

/**
 * This parameter sets classes excluded from AutoTracking.
 */
@property (copy, nonatomic, nonnull, readwrite) NSArray<Class> *excludedClasses;

/**
 * This parameter sets view tags excluded from AutoTracking.
 */
@property (copy, nonatomic, nonnull, readwrite) NSArray<NSNumber *> *excludedViewTags;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
