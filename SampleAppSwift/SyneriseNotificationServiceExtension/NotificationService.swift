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
    
    var notificationEncryptionHelper: NotificationEncryptionHelper = NotificationEncryptionHelper()

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        self.bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
        
        self.notificationEncryptionHelper.setDebugModeEnabled(true)
        
        Synerise.settings.sdk.keychainGroupIdentifier = "34N2Z22TKH.keychainGroup"
        
        if let bestAttemptContent = self.bestAttemptContent {
            let shouldDecryptNotification: Bool = notificationEncryptionHelper.isNotificationContentEncrypted(bestAttemptContent)
            if shouldDecryptNotification {
                let decryptionResult = notificationEncryptionHelper.decryptNotificationContent(bestAttemptContent)
                if decryptionResult != .decryptSuccess {
                    bestAttemptContent.title = "(Encrypted)"
                    bestAttemptContent.body = "(Encrypted)"
                }
            }
            
            contentHandler(bestAttemptContent)
        }
    }
    
    override func serviceExtensionTimeWillExpire() {
        // Called just before the extension will be terminated by the system.
        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
        
        if let contentHandler = self.contentHandler, let bestAttemptContent =  self.bestAttemptContent {
            let shouldDecryptNotification: Bool = notificationEncryptionHelper.isNotificationContentEncrypted(bestAttemptContent)
            if shouldDecryptNotification {
                bestAttemptContent.title = "(Encrypted)"
                bestAttemptContent.body = "(Encrypted)"
            }
            
            contentHandler(bestAttemptContent)
        }
    }
}
