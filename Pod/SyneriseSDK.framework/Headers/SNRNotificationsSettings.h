//
//  SNRNotificationServiceSettings.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2020 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRNotificationsSettings
 */

NS_SWIFT_NAME(NotificationsSettings)
@interface SNRNotificationsSettings : NSObject

//This parameter specifies if handling notifications by the SDK is enabled.
//
//Property is true by default.
@property (assign, nonatomic, readwrite) BOOL enabled;

//This parameter determines whether the SDK displays an additional alert in the application after receiving notification.
//
//Property is true by default.
@property (assign, nonatomic, readwrite) BOOL disableInAppAlerts;

//This parameter identifies the group used by applications and extensions belongs to.
//Note, that it is required property to allow the SDK communicating with Host App and its extensions for proper handling Rich Media Notifications.
//
//Property is nil by default.
@property (copy, nonatomic, nullable, readwrite) NSString *appGroupIdentifier DEPRECATED_MSG_ATTRIBUTE("Use Synerise.settings.sdk.appGroupIdentifier instead.");

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
