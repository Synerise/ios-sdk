// 
//  SNRCarouselContentExtensionViewController.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString * const SNRCarouselContentExtensionViewControllerCategoryIdentifier;
FOUNDATION_EXPORT NSString * const SNRCarouselContentExtensionViewControllerPreviousItemIdentifier;
FOUNDATION_EXPORT NSString * const SNRCarouselContentExtensionViewControllerNextItemIdentifier;
FOUNDATION_EXPORT NSString * const SNRCarouselContentExtensionViewControllerChooseItemIdentifier;

/**
 * @class SNRCarouselContentExtensionViewController
 */

API_AVAILABLE(ios(10.0))
NS_SWIFT_NAME(CarouselContentExtensionViewController)
@interface SNRCarouselContentExtensionViewController : UIViewController

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
