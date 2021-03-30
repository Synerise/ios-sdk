//
//  SNRNotificationServiceSettings.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2021 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRNotificationsSettings
 */

NS_SWIFT_NAME(NotificationsSettings)
@interface SNRNotificationsSettings : NSObject

/**
 * This parameter specifies if handling notifications by the SDK is enabled.
 *
 * The default value is true.
 */
@property (assign, nonatomic, readwrite) BOOL enabled;

/**
 * This parameter specifies if notifications from Synerise should be encrypted.
 * iOS 10 or newer is required for this option.
 *
 * The default value is false.
 */
@property (assign, nonatomic, readwrite) BOOL encryption API_AVAILABLE(ios(10));

/**
 * This parameter determines if the SDK displays an additional alert in the application after receiving a notification.
 *
 * The default value is true.
 */
@property (assign, nonatomic, readwrite) BOOL disableInAppAlerts;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
