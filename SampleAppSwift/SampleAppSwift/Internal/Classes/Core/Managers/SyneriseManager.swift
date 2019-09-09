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

class SyneriseManager {
    
    var settingsService: SettingsService!
    
    private let clientApiKey: String

    // MARK: - Initializers

    init(clientApiKey: String) {
        self.clientApiKey = clientApiKey
    }

    // MARK: - Public

    func initialize() {
        DebugUtils.print("SyneriseSDK initializing | Client API Key: \(clientApiKey)")
        Synerise.initialize(clientApiKey: clientApiKey)
        Synerise.setDebugModeEnabled(true)
        
        Synerise.settings.sdk.enabled = settingsService.get(.sdkEnabledKey) ?? true
        
        Synerise.settings.notifications.enabled = settingsService.get(.notificationsEnabledKey) ?? true
        Synerise.settings.notifications.disableInAppAlerts = settingsService.get(.notificationsDisableInAppAlertsKey) ?? false
        Synerise.settings.notifications.appGroupIdentifier = "group.com.synerise.sdk.sample"
        
        Synerise.settings.tracker.autoTracking.enabled = settingsService.get(.autoTrackingEnabledKey) ?? true
        Synerise.settings.tracker.tracking.enabled = settingsService.get(.trackingEnabledKey) ?? true
        
        Tracker.setAutoTrackMode(.fine)
        
        Client.setLoggingEnabled(true)

        Injector.setAutomatic(true)
        
        Tracker.setAutoTrackMode(.fine)
        Tracker.setLocationAutomaticEnabled(true)
        
        Synerise.settings.tracker.minBatchSize = 10
        Synerise.settings.tracker.maxBatchSize = 100
        Synerise.settings.tracker.autoFlushTimeout = 5.0
        Synerise.settings.tracker.autoTracking.mode = .fine
        Synerise.settings.tracker.locationAutomatic = true
        
        Synerise.settings.injector.automatic = true
    }
    
    func setSyneriseDelegate(_ delegate: SyneriseDelegate) {
        Synerise.setDelegate(delegate)
    }
    
    func isSignedIn() -> Bool {
        return Client.isSignedIn()
    }
    
    func signOut() {
        Client.signOut()
    }
}

extension SyneriseManager: NotificationServiceDelegate {

    func notificationService(_ notificationService: NotificationService, didReceiveToken token: String, origin: NotificationService.TokenOrigin) {
        if origin == NotificationService.TokenOrigin.firebase {
            Client.registerForPush(registrationToken: token,
                                   mobilePushAgreement: true,
                                    success: { (_) in
                                        DebugUtils.print("Synerise push registration success")
            },
                                    failure: { (error) in
                                        DebugUtils.print("Synerise push registration failure: \(error.localizedDescription)")
            })
        }
    }

    func notificationService(_ notificationService: NotificationService, didReceiveNotification notification: NotificationService.Notification) {
        let userInfo = notification.userInfo
        let isSyneriseNotification: Bool = Synerise.isSyneriseNotification(userInfo)
        if isSyneriseNotification {
            Synerise.handleNotification(userInfo)
        } else {

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
            
            syneriseManager.settingsService = settingsService
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
