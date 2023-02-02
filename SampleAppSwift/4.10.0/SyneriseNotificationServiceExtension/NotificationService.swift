//
//  NotificationService.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2020 Synerise. All rights reserved.
//

import UserNotifications
import SyneriseSDK

class NotificationService: UNNotificationServiceExtension, NotificationServiceExtensionDelegate {
    
    var contentHandler: ((UNNotificationContent) -> Void)?
    var receivedRequest: UNNotificationRequest?
    var bestAttemptContent: UNMutableNotificationContent?

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.receivedRequest = request
        self.contentHandler = contentHandler
        self.bestAttemptContent = (request.content.mutableCopy() as? UNMutableNotificationContent)
                
        if let bestAttemptContent = self.bestAttemptContent {
            Synerise.settings.sdk.appGroupIdentifier = "group.com.synerise.sdk.sample-swift"
            Synerise.settings.sdk.keychainGroupIdentifier = "34N2Z22TKH.keychainGroup"
            
            NotificationServiceExtension.setDelegate(self)
            
            #if DEBUG
            NotificationServiceExtension.setDebugModeEnabled(true)
            #endif
            
            // DEBUG ONLY !!!
            // Uncomment the 1 line below to cause service extension expiration and check how `serviceExtensionTimeWillExpire` method works.
            // Thread.sleep(forTimeInterval: 25)
            
            NotificationServiceExtension.setDecryptionFallbackNotificationTitleAndBody(title: "(Encrypted)", body: "(Encrypted)")
            NotificationServiceExtension.didReceiveNotificationExtensionRequest(request, withMutableNotificationContent: bestAttemptContent)
            
            // DEBUG ONLY !!!
            // Uncomment the 1 line below and comment out the one above to ensure this extension is executing.
            // Remember, this extension only runs when mutable-content is set true in Synerise campaign options.
            // bestAttemptContent.body = "[Modified]".appending(bestAttemptContent.body);
            contentHandler(bestAttemptContent)
        }
    }
    
    override func serviceExtensionTimeWillExpire() {
        // Called just before the extension will be terminated by the system.
        // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
        if let contentHandler = self.contentHandler, let receivedRequest = self.receivedRequest, let bestAttemptContent =  self.bestAttemptContent {
            NotificationServiceExtension.serviceExtensionTimeWillExpireRequest(receivedRequest, withMutableNotificationContent: bestAttemptContent)
            bestAttemptContent.title = "Fallback title"
            bestAttemptContent.body = "Fallback body"
            contentHandler(bestAttemptContent)
        }
    }
    
    func notificationServiceExtensionDidFailProcessingWithError(_ error: Error) {
#if DEBUG
        self.bestAttemptContent?.title = error.localizedDescription
#endif
    }
    
    func notificationServiceExtensionDidFailDecryptionWithError(_ error: Error) {
#if DEBUG
        self.bestAttemptContent?.title = error.localizedDescription
#endif
    }
}
