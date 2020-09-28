//
//  SNRNotificationAnalyticsHelper.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2020 Synerise. All rights reserved.
//

#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRNotificationAnalyticsHelper
 */

API_AVAILABLE(ios(10.0))
NS_SWIFT_NAME(NotificationAnalyticsHelper)
@interface SNRNotificationAnalyticsHelper : NSObject

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithNotificationContent:(UNMutableNotificationContent *)notificationContent;

- (void)setDebugModeEnabled:(BOOL)enabled;
- (void)trackPushViewEvent;

@end

NS_ASSUME_NONNULL_END
