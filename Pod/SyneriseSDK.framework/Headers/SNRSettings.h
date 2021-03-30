//
//  SNRSettings.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2021 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRNotificationsSettings.h>
#import <SyneriseSDK/SNRGeneralSettings.h>
#import <SyneriseSDK/SNRNotificationsSettings.h>
#import <SyneriseSDK/SNRTrackerSettings.h>
#import <SyneriseSDK/SNRInjectorSettings.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRSettings
 */

NS_SWIFT_NAME(Settings)
@interface SNRSettings : NSObject

/**
 * General settings of the SDK
 */
@property (strong, nonatomic, nonnull, readonly) SNRGeneralSettings *sdk;

/**
 * Notification settings of the SDK
 */
@property (strong, nonatomic, nonnull, readonly) SNRNotificationsSettings *notifications;

/**
 * Settings for the Tracker module
 */
@property (strong, nonatomic, nonnull, readonly) SNRTrackerSettings *tracker;

/**
 * Settings for the Injector module
 */
@property (strong, nonatomic, nonnull, readonly) SNRInjectorSettings *injector;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
