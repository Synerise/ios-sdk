//
//  NotificationService.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import UserNotifications
import Firebase
import SyneriseSDK
import Swinject

protocol NotificationServiceDelegate: class {
    func notificationService(_ notificationService: NotificationService, didReceiveToken token: String, origin: NotificationService.TokenOrigin)
    
    func notificationService(_ notificationService: NotificationService, didReceiveNotification notification: NotificationService.Notification)
    
    func notificationService(_ notificationService: NotificationService, didReceiveNotificationResponse response: UNNotificationResponse, notification: NotificationService.Notification)
}

class NotificationService: BaseService {
    
    enum RegistrationStatus {
        //swiftlint:disable:next identifier_name
        case success(deviceToken: Data)
        
        //swiftlint:disable:next identifier_name
        case fail(error: Error)
    }

    enum TokenOrigin: String {
        case apn
        case firebase
    }

    struct Notification {
        var userInfo: [AnyHashable: Any]
    }

    var delegates: [NotificationServiceDelegate] = [NotificationServiceDelegate]()

    private var tokens: [String: String] = [String: String]()

    // MARK: - public

    func applicationRegistrationStatus(_ status: RegistrationStatus) {
        switch status {
        case let .success(deviceToken):
                applicationRegistrationStatusSuccess(deviceToken: deviceToken)
            
        case let .fail(error):
                applicationRegistrationStatusFail(error: error)
        }
    }
    
    func handleNotificationUserInfo(_ userInfo: [AnyHashable: Any]) {
        let notification = Notification(userInfo: userInfo)
        notificationReceived(notification)
    }

    func addDelegate(_ delegate: NotificationServiceDelegate) {
        guard delegates.first(where: { $0 === delegate }) == nil
            else { return }

        delegates.append(delegate)
    }

    func getToken(origin: TokenOrigin) -> String? {
        return tokens[origin.rawValue]
    }

    func setToken(_ token: String, origin: TokenOrigin) {
        tokenReceived(token, origin: origin)
    }

    func setup() {
        registerForRemoteNotifications()
        addFirebaseMessaging()
        setCategories()
    }

    // MARK: - private
    
    private func setCategories() {
        let singleMediaCategory = UNNotificationCategory(identifier: SNRSingleMediaContentExtensionViewControllerCategoryIdentifier, actions: [], intentIdentifiers: [], options: [])
        
        let carouselPrevious = UNNotificationAction(identifier: SNRCarouselContentExtensionViewControllerPreviousItemIdentifier, title: "Previous", options: [])
        let carouselAction = UNNotificationAction(identifier: SNRCarouselContentExtensionViewControllerChooseItemIdentifier, title: "Go!", options: UNNotificationActionOptions.foreground)
        
        let carouselNext = UNNotificationAction(identifier: SNRCarouselContentExtensionViewControllerNextItemIdentifier, title: "Next", options: [])
        
        let carouselCategory = UNNotificationCategory(identifier: SNRCarouselContentExtensionViewControllerCategoryIdentifier, actions: [carouselPrevious, carouselAction, carouselNext], intentIdentifiers: [], options: [])
        
        UNUserNotificationCenter.current().setNotificationCategories([singleMediaCategory, carouselCategory])
    }

    private func registerForRemoteNotifications() {
        let notificationCenter = UNUserNotificationCenter.current()

        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (_, _) in

        }
        notificationCenter.delegate = self

        UIApplication.shared.registerForRemoteNotifications()
    }

    private func applicationRegistrationStatusSuccess(deviceToken: Data) {
        let tokenParts = deviceToken.map { data -> String in
            return String(format: "%02.2hhx", data)
        }

        let token = tokenParts.joined()
        tokenReceived(token, origin: .apn)
    }

    private func applicationRegistrationStatusFail(error: Error) {
        
    }

    private func notificationReceived(_ notification: Notification) {
        guard delegates.isEmpty == false
            else { return }

        delegates.forEach { (delegate) in
            delegate.notificationService(self, didReceiveNotification: notification)
        }
    }
    
    private func notificationResponseReceived(_ response: UNNotificationResponse, notification: Notification) {
        guard delegates.isEmpty == false
            else { return }
        
        delegates.forEach { (delegate) in
            delegate.notificationService(self, didReceiveNotificationResponse: response, notification: notification)
        }
    }

    private func tokenReceived(_ token: String, origin: TokenOrigin) {
        DebugUtils.print("\(origin.rawValue) token: \(token)")
        
        tokens[origin.rawValue] = token

        guard delegates.isEmpty == false
            else { return }

        delegates.forEach { (delegate) in
            delegate.notificationService(self, didReceiveToken: token, origin: origin)
        }
    }

    private func makeNotification(fromNotification notification: UNNotification) -> Notification {
        let userInfo = notification.request.content.userInfo
        let notification = Notification(userInfo: userInfo)

        return notification
    }

    private func makeNotification(fromNotificationResponse response: UNNotificationResponse) -> Notification {
        let userInfo = response.notification.request.content.userInfo
        let notification = Notification(userInfo: userInfo)

        return notification
    }
}

extension NotificationService: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let notification = makeNotification(fromNotificationResponse: response)
        notificationResponseReceived(response, notification: notification)
        completionHandler()
    }
// swiftlint:disable:next line_length
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let notification = makeNotification(fromNotification: notification)
        notificationReceived(notification)
        completionHandler(.alert)
    }
}

extension NotificationService: MessagingDelegate {
    func addFirebaseMessaging() {
        Messaging.messaging().delegate = self
    }

    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        if let fcmToken = fcmToken {
            tokenReceived(fcmToken, origin: .firebase)
        }
    }
}

extension NotificationService: Registerable {
    static func register(inContainer container: Container) {
        container.register(NotificationService.self) {_ in
            return NotificationService()
        }
        .inObjectScope(.container)
    }
}

extension NotificationService: Resolvable {
    typealias ObjectType = NotificationService

    static func resolve() -> ObjectType {
        return Administrator.assembly.resolve(NotificationService.self)!
    }
}
