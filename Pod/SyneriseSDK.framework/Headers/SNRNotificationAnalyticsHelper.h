//
//  SNRNotificationAnalyticsHelper.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2021 Synerise. All rights reserved.
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

@property (assign, nonatomic, readwrite) BOOL isValid;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithNotificationContent:(UNMutableNotificationContent *)notificationContent;
- (instancetype)initWithoutNotificationContent;

- (void)setDebugModeEnabled:(BOOL)enabled;

- (void)trackPushViewEvent;
- (void)trackPushImageTimeoutEvent;
- (void)trackPushDecryptionFailedEventWithReason:(nullable NSString *)reason;

@end

NS_ASSUME_NONNULL_END
