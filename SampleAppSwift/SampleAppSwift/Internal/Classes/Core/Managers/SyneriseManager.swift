//
//  SyneriseManager.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import SyneriseSDK
import Swinject
import CoreLocation

class SyneriseManager {
    
    var settingsService: SettingsService!
    var notificationService: NotificationService!
    
    private let clientApiKey: String

    // MARK: - Initializers

    init(clientApiKey: String) {
        self.clientApiKey = clientApiKey
    }

    // MARK: - Public

    func initialize() {
        let clientApiKey = self.clientApiKey
        //let clientApiKey = Configuration.SyneriseSDK.clientAPIKey1_test
        
        Synerise.settings.sdk.appGroupIdentifier = "group.com.synerise.sdk.sample-swift"
        Synerise.settings.sdk.keychainGroupIdentifier = "34N2Z22TKH.keychainGroup"
        Synerise.settings.sdk.shouldDestroySessionOnApiKeyChange = false
        
        Synerise.settings.notifications.encryption = settingsService.get(.notificationsEncryptionKey) ?? true
        
        DebugUtils.print("SyneriseSDK initializing | Client API Key: \(clientApiKey)")
        Synerise.initialize(clientApiKey: clientApiKey, baseUrl: "https://api.snrapi.com")
        Synerise.setDebugModeEnabled(true)
        Synerise.setCrashHandlingEnabled(true)
        
        Client.setClientStateDelegate(self)
        
        Synerise.settings.sdk.enabled = settingsService.get(.sdkEnabledKey) ?? true
        
        Synerise.settings.notifications.enabled = settingsService.get(.notificationsEnabledKey) ?? true
        Synerise.settings.notifications.disableInAppAlerts = settingsService.get(.notificationsDisableInAppAlertsKey) ?? false

        Synerise.settings.tracker.autoTracking.enabled = settingsService.get(.autoTrackingEnabledKey) ?? true
        Synerise.settings.tracker.tracking.enabled = settingsService.get(.trackingEnabledKey) ?? true
        
        Synerise.settings.tracker.minBatchSize = 10
        Synerise.settings.tracker.maxBatchSize = 100
        Synerise.settings.tracker.autoFlushTimeout = 5.0
        Synerise.settings.tracker.autoTracking.mode = .fine
        Synerise.settings.tracker.locationAutomatic = true
        
        Synerise.settings.injector.automatic = true
        
        settingsService?.set(clientApiKey, forKey: SettingsServiceKey.syneriseClientAPIKey)
        
        Synerise.setDelegate(self)
    }
    
    func executePushRegistration() {
        guard let token = notificationService.getToken(origin: .firebase) else {
            return
        }
        
        registerForPush(token: token, agreement: true)
    }
    
    func isSignedIn() -> Bool {
        return Client.isSignedIn()
    }
    
    func signOut() {
        Client.signOut()
    }
    
    private func registerForPush(token: String, agreement: Bool) {
        Client.registerForPush(registrationToken: token, mobilePushAgreement: agreement, success: { (_) in
            DebugUtils.print("Synerise push registration success")
        }, failure: { (error) in
            DebugUtils.print("Synerise push registration failure: \(error.localizedDescription)")
        })
    }
}

extension SyneriseManager: SyneriseDelegate {
    func snr_initialized() {
        
    }
    
    func snr_registerForPushNotificationsIsNeeded() {
        executePushRegistration()
    }
    
    func snr_handledAction(url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    func snr_handledAction(deepLink: String) {
//        if let url = URL(string: deepLink) {
//            url.params?.forEach({ (key, value) in
//                if key == "sku" {
//                    self.getMainCoordinator()?.didReceiveDeeplinkWithSku(value)
//                }
//            })
//        }
    }
}

extension SyneriseManager: ClientStateDelegate {
    func snr_clientIsSignedIn() {
        print("DID SIGN IN")
    }
    
    func snr_clientIsSignedOut(reason: ClientSessionEndReason) {
        print("DID SIGN OUT \(reason)")
    }
}

extension SyneriseManager: NotificationServiceDelegate {

    func notificationService(_ notificationService: NotificationService, didReceiveToken token: String, origin: NotificationService.TokenOrigin) {
        if origin == NotificationService.TokenOrigin.firebase {
            registerForPush(token: token, agreement: true)
        }
    }

    func notificationService(_ notificationService: NotificationService, didReceiveNotification notification: NotificationService.Notification) {
        let userInfo = notification.userInfo
        let isSyneriseNotification: Bool = Synerise.isSyneriseNotification(userInfo)
        if isSyneriseNotification {
            Synerise.handleNotification(userInfo)
        } else {
            let isEncrypted = Synerise.isNotificationEncrypted(userInfo)
            if isEncrypted {
                let userInfoEncrypted = Synerise.decryptNotification(userInfo)
                print(userInfoEncrypted as AnyObject)
            }
        }
    }
    
    func notificationService(_ notificationService: NotificationService, didReceiveNotificationResponse response: UNNotificationResponse, notification: NotificationService.Notification) {
        let userInfo = notification.userInfo
        let isSyneriseNotification: Bool = Synerise.isSyneriseNotification(userInfo)
        if isSyneriseNotification {
            Synerise.handleNotification(userInfo, actionIdentifier: response.actionIdentifier)
        }
    }
}

extension SyneriseManager: Registerable {
    static func register(inContainer container: Container) {
        container.register(SyneriseManager.self) { _ in
            let serviceProvider = container.resolve(ServiceProvider.self)
            let settingsService = serviceProvider!.getSettingsService()
            
            guard let clientApiKey: String = settingsService.get(SettingsServiceKey.syneriseClientAPIKey) else {
                fatalError()
            }
            
            return SyneriseManager(
                clientApiKey: clientApiKey
            )
        }
        .initCompleted({ (resolver, syneriseManager) in
            let serviceProvider = container.resolve(ServiceProvider.self)
            let settingsService = serviceProvider!.getSettingsService()
            let notificationService = serviceProvider!.getNotificationService()
            
            syneriseManager.settingsService = settingsService
            syneriseManager.notificationService = notificationService
        })
        .inObjectScope(.container)
    }
}

extension SyneriseManager: Resolvable {
    typealias ObjectType = SyneriseManager

    static func resolve() -> ObjectType {
        return Administrator.assembly.resolve(SyneriseManager.self)!
    }
}
