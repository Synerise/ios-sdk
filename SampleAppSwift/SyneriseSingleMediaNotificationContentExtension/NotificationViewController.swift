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

class NotificationViewController: SingleMediaContentExtensionViewController, UNNotificationContentExtension {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red
    }
    
    func didReceive(_ notification: UNNotification) {
        Synerise.settings.sdk.appGroupIdentifier = "APP_GROUP"
        Synerise.settings.sdk.keychainGroupIdentifier = "KEYCHAIN_GROUP"
        
        setSyneriseNotification(notification)
    }

    func didReceive(_ response: UNNotificationResponse, completionHandler completion: @escaping (UNNotificationContentExtensionResponseOption) -> Void) {
        setSyneriseNotificationResponse(response, completionHandler: completion)
    }
}
