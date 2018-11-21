// 
//  SNRSingleMediaContentExtensionViewController.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>

FOUNDATION_EXPORT NSString * const SNRSingleMediaContentExtensionViewControllerCategoryIdentifier;

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRSingleMediaContentExtensionViewController
 */

API_AVAILABLE(ios(10.0))
NS_SWIFT_NAME(SingleMediaContentExtensionViewController)
@interface SNRSingleMediaContentExtensionViewController : UIViewController

- (void)setSyneriseNotification:(UNNotification *)notification API_AVAILABLE(ios(10.0));
- (void)setSyneriseNotificationResponse:(UNNotificationResponse *)response completionHandler:(void (^)(UNNotificationContentExtensionResponseOption))completion API_AVAILABLE(ios(10.0));

@end

NS_ASSUME_NONNULL_END
