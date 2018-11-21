// 
//  SNRCarouselContentExtensionViewController.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>

FOUNDATION_EXPORT NSString * const SNRCarouselContentExtensionViewControllerCategoryIdentifier;
FOUNDATION_EXPORT NSString * const SNRCarouselContentExtensionViewControllerPreviousItemIdentifier;
FOUNDATION_EXPORT NSString * const SNRCarouselContentExtensionViewControllerNextItemIdentifier;
FOUNDATION_EXPORT NSString * const SNRCarouselContentExtensionViewControllerChooseItemIdentifier;

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRCarouselContentExtensionViewController
 */

API_AVAILABLE(ios(10.0))
NS_SWIFT_NAME(CarouselContentExtensionViewController)
@interface SNRCarouselContentExtensionViewController : UIViewController

- (void)setSyneriseNotification:(UNNotification *)notification API_AVAILABLE(ios(10.0));
- (void)setSyneriseNotificationResponse:(UNNotificationResponse *)response completionHandler:(void (^)(UNNotificationContentExtensionResponseOption))completion API_AVAILABLE(ios(10.0));

@end

NS_ASSUME_NONNULL_END
