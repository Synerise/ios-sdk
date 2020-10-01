//
//  NotificationService.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2020 Synerise. All rights reserved.
//

import UserNotifications
import SyneriseSDK

class NotificationService: UNNotificationServiceExtension {

    var contentHandler: ((UNNotificationContent) -> Void)?
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        self.bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        
        if let bestAttemptContent = self.bestAttemptContent {
            Synerise.settings.sdk.appGroupIdentifier = "YOUR_APP_GROUP_IDENTIFIER"
            Synerise.settings.sdk.keychainGroupIdentifier = "YOUR_KEYCHAIN_GROUP_IDENTIFIER"
            
            #if DEBUG
            NotificationServiceExtension.setDebugModeEnabled(true)
            #endif
            
            NotificationServiceExtension.setDecryptionFallbackNotificationTitleAndBody(title: "(Encrypted)", body: "(Encrypted)")
            NotificationServiceExtension.didReceiveNotificationExtensionRequest(request, withMutableNotificationContent: bestAttemptContent)
            
            contentHandler(bestAttemptContent)
        }
    }
    
    override func serviceExtensionTimeWillExpire() {
        // Called just before the extension will be terminated by the system.
        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
        
        if let contentHandler = self.contentHandler, let bestAttemptContent =  self.bestAttemptContent {
            contentHandler(bestAttemptContent)
        }
    }
}
