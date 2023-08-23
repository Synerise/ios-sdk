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

        Synerise.settings.sdk.enabled = settingsService.get(.sdkEnabledKey) ?? true
        Synerise.settings.sdk.appGroupIdentifier = ""
        Synerise.settings.sdk.keychainGroupIdentifier = ""
        Synerise.settings.sdk.shouldDestroySessionOnApiKeyChange = false

        Synerise.settings.notifications.enabled = settingsService.get(.notificationsEnabledKey) ?? true
        Synerise.settings.notifications.disableInAppAlerts = settingsService.get(.notificationsDisableInAppAlertsKey) ?? false
        Synerise.settings.notifications.encryption = settingsService.get(.notificationsEncryptionKey) ?? true

        Synerise.settings.tracker.autoTracking.enabled = settingsService.get(.autoTrackingEnabledKey) ?? true
        Synerise.settings.tracker.tracking.enabled = settingsService.get(.trackingEnabledKey) ?? true

        Synerise.settings.tracker.minBatchSize = 10
        Synerise.settings.tracker.maxBatchSize = 100
        Synerise.settings.tracker.autoFlushTimeout = 5.0
        Synerise.settings.tracker.autoTracking.mode = .fine
        Synerise.settings.tracker.isBackendTimeSyncRequired = false
        Synerise.settings.tracker.locationAutomatic = true

        Synerise.settings.injector.automatic = true

        DebugUtils.print("SyneriseSDK initializing | Profile API Key: \(clientApiKey)")
        Synerise.initialize(clientApiKey: clientApiKey)
        Synerise.setRequestValidationSalt("")
        Synerise.setDebugModeEnabled(true)
        Synerise.setCrashHandlingEnabled(true)
        
        Synerise.setDelegate(self)
        Synerise.setNotificationDelegate(self)
        Client.setClientStateDelegate(self)
        Injector.setWalkthroughDelegate(self)
        Injector.setInAppMessageDelegate(self)

        let syneriseFirstInitialization: Bool? = settingsService?.get(SettingsServiceKey.syneriseFirstInitializationLaunchKey)
        if syneriseFirstInitialization == nil {
            executePushRegistration()
            settingsService?.set(true, forKey: SettingsServiceKey.syneriseFirstInitializationLaunchKey)
        }

        settingsService?.set(clientApiKey, forKey: SettingsServiceKey.syneriseClientAPIKey)
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
        UIApplication.shared.open(URL(string: deepLink)!, options: [:], completionHandler: nil)
    }
    
    func snr_handledAction(url: URL, activity: SyneriseActivity, completionHandler: @escaping SyneriseActivityCompletionHandler) {
        if UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
        
        if activity == .inAppMessage {
            completionHandler(.none, nil)
        } else {
            completionHandler(.hide, nil)
        }
    }
}

extension SyneriseManager: NotificationDelegate {
    func snr_notificationDidReceive(notificationInfo: NotificationInfo) {
        print("NOTIFICATION DID RECEIVE")
    }
    
    func snr_notificationDidDissmis(notificationInfo: NotificationInfo) {
        print("NOTIFICATION DID DISSMIS")
    }
    
    func snr_notificationDidDismiss(notificationInfo: NotificationInfo) {
        print("NOTIFICATION DID DISMISS")
    }
    
    func snr_notificationClicked(notificationInfo: NotificationInfo) {
        print("NOTIFICATION CLICKED")
    }
    
    func snr_notificationClicked(notificationInfo: NotificationInfo, actionButton: String) {
        print("NOTIFICATION CLICKED ACTION BUTTON")
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

extension SyneriseManager: InjectorWalkthroughDelegate {
    func snr_walkthroughDidLoad() {
        print("WALKTHROUGH DID LOAD")
    }
    
    func snr_walkthroughDidLoad(walkthroughDictionary: [AnyHashable: Any]) {
        print("WALKTHROUGH DID LOAD WITH DICTIONARY")
    }
}

extension SyneriseManager: InjectorInAppMessageDelegate {
    func snr_shouldInAppMessageAppear(data: InAppMessageData) -> Bool {
        return true
    }
    
    func snr_inAppMessageDidAppear(data: InAppMessageData) {
        
    }
    
    func snr_inAppMessageDidDisappear(data: InAppMessageData) {
        
    }
    
    func snr_inAppMessageDidChangeSize(rect: CGRect) {
        
    }
    
    func snr_inAppMessageContextIsNeeded(data: InAppMessageData) -> [AnyHashable: Any]? {
        return ["test": "TEST"]
    }
    
    func snr_inAppMessageHandledAction(data: InAppMessageData, url: URL) {
        
    }
    
    func snr_inAppMessageHandledAction(data: InAppMessageData, deeplink: String) {
        
    }
    
    func snr_inAppMessageHandledCustomAction(data: InAppMessageData, name: String, parameters: [AnyHashable: Any]) {
        
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
