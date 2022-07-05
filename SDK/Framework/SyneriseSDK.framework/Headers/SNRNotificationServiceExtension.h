//
//  SNRNotificationServiceExtension.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2021 Synerise. All rights reserved.
//

#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRNotificationServiceExtension
 */

API_AVAILABLE(ios(10.0))
NS_SWIFT_NAME(NotificationServiceExtension)
@interface SNRNotificationServiceExtension : NSObject

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

+ (void)setDebugModeEnabled:(BOOL)enabled;
+ (void)setDecryptionFallbackNotificationTitle:(nullable NSString *)title andBody:(nullable NSString *)body NS_SWIFT_NAME(setDecryptionFallbackNotificationTitleAndBody(title:body:));
+ (void)didReceiveNotificationExtensionRequest:(UNNotificationRequest *)request withMutableNotificationContent:(UNMutableNotificationContent *)notificationContent NS_SWIFT_NAME(didReceiveNotificationExtensionRequest(_:withMutableNotificationContent:));

@end

NS_ASSUME_NONNULL_END
