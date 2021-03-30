//
//  SNRNotificationConfigurationHelper.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2021 Synerise. All rights reserved.
//

#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>
#import <MobileCoreServices/MobileCoreServices.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRNotificationConfigurationHelper
 */

API_AVAILABLE(ios(10.0))
NS_SWIFT_NAME(NotificationConfigurationHelper)
@interface SNRNotificationConfigurationHelper : NSObject

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithNotificationContent:(UNMutableNotificationContent *)notificationContent;

- (void)setDebugModeEnabled:(BOOL)enabled;
- (void)addCategories;
- (void)addAttachments;

@end

NS_ASSUME_NONNULL_END
