//
//  AppDelegate.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import Swinject
import UserNotifications
import FBSDKCoreKit
import FBSDKLoginKit
import SyneriseSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var applicationController: ApplicationController = ApplicationController.resolve()
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        //uncomment lines below if you want to use Firebase and notifications
        Administrator.shared.setupFirebase()
        Administrator.shared.setupNotifications()
        
        applicationController.run()
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        let sourceApplication: String? = options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String
        let annotation: Any? = options[UIApplication.OpenURLOptionsKey.annotation]
        
        let handled: Bool = ApplicationDelegate.shared.application(app, open: url, sourceApplication: sourceApplication, annotation: annotation)
        if handled == true {
            return true
        }
        
        if url.scheme == "sample-swift" {
            applicationController.getMainCoordinator()?.didReceiveDeeplink(host: url.host!, pathComponents: url.pathComponents)
            return true
        }
        
        return false
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let notificationService = Administrator.shared.serviceProvider.getNotificationService()
        notificationService.applicationRegistrationStatus(NotificationService.RegistrationStatus.success(deviceToken: deviceToken))
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        let notificationService = Administrator.shared.serviceProvider.getNotificationService()
        notificationService.applicationRegistrationStatus(NotificationService.RegistrationStatus.fail(error: error))
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        let notificationService = Administrator.shared.serviceProvider.getNotificationService()
        notificationService.handleNotificationUserInfo(userInfo)
        
        completionHandler(.newData)
    }
}
