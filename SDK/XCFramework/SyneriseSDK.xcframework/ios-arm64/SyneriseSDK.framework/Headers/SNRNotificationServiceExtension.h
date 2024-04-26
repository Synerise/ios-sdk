//
//  SNRNotificationServiceExtension.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @protocol SNRNotificationServiceExtensionDelegate
 */

NS_SWIFT_NAME(NotificationServiceExtensionDelegate)
@protocol SNRNotificationServiceExtensionDelegate

- (void)notificationServiceExtensionDidFailProcessingWithError:(NSError *)error;
- (void)notificationServiceExtensionDidFailDecryptionWithError:(NSError *)error;

@end

/**
 * @class SNRNotificationServiceExtension
 */

API_AVAILABLE(ios(10.0))
NS_SWIFT_NAME(NotificationServiceExtension)
@interface SNRNotificationServiceExtension : NSObject

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

+ (void)setDelegate:(nullable id<SNRNotificationServiceExtensionDelegate>)delegate;
+ (void)setNotificationDelegate:(id<SNRNotificationDelegate>)delegate;
+ (void)setDebugModeEnabled:(BOOL)enabled;

+ (void)setDecryptionFallbackNotificationTitle:(nullable NSString *)title andBody:(nullable NSString *)body NS_SWIFT_NAME(setDecryptionFallbackNotificationTitleAndBody(title:body:));

+ (void)didReceiveNotificationExtensionRequest:(UNNotificationRequest *)request withMutableNotificationContent:(UNMutableNotificationContent *)notificationContent NS_SWIFT_NAME(didReceiveNotificationExtensionRequest(_:withMutableNotificationContent:));
+ (void)serviceExtensionTimeWillExpireRequest:(UNNotificationRequest *)request withMutableNotificationContent:(UNMutableNotificationContent *)notificationContent NS_SWIFT_NAME(serviceExtensionTimeWillExpireRequest(_:withMutableNotificationContent:));

@end

NS_ASSUME_NONNULL_END
