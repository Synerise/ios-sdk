//
//  NotificationViewController.swift
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright © 2018 Synerise. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI
import SyneriseSDK

class NotificationViewController: CarouselContentExtensionViewController, UNNotificationContentExtension {

    func didReceive(_ notification: UNNotification) {
        Synerise.settings.sdk.appGroupIdentifier = "YOUR_APP_GROUP_IDENTIFIER"
        setSyneriseNotification(notification)
    }
    
    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
        setSyneriseNotificationResponse(response, completionHandler: completion)
    }
}
