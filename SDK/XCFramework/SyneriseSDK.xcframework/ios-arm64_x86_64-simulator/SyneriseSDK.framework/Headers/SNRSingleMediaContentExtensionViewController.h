// 
//  SNRSingleMediaContentExtensionViewController.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString * const SNRSingleMediaContentExtensionViewControllerCategoryIdentifier;

/**
 * @class SNRSingleMediaContentExtensionViewController
 */

API_AVAILABLE(ios(10.0))
NS_SWIFT_NAME(SingleMediaContentExtensionViewController)
@interface SNRSingleMediaContentExtensionViewController : UIViewController

/**
 * This parameter specifies if content should be adjusted to screen height.
 * If not, vertical scroll is enabled.
 *
 * The default value is true (scroll is enabled).
 */
@property (assign, nonatomic, readwrite) BOOL contentViewIsScrollable;

/**
 * This parameter sets the rendering mode of images.
 *
 * The default value is `UIViewContentModeScaleAspectFill`.
 */
@property (assign, nonatomic, readwrite) UIViewContentMode imageContentMode;

- (void)setDebugModeEnabled:(BOOL)enabled;

- (void)setSyneriseNotification:(UNNotification *)notification API_AVAILABLE(ios(10.0));
- (void)setSyneriseNotificationResponse:(UNNotificationResponse *)response completionHandler:(void (^)(UNNotificationContentExtensionResponseOption))completion API_AVAILABLE(ios(10.0));

@end

NS_ASSUME_NONNULL_END
