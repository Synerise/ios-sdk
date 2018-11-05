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

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var applicationController: ApplicationController = ApplicationController.resolve()
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FBSDKApplicationDelegate.sharedInstance()?.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        //comment lines below if you don't want to use Firebase and notifications
        Administrator.shared.setupFirebase()
        Administrator.shared.setupNotifications()
        
        applicationController.run()
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        let sourceApplication: String? = options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String
        let annotation: Any? = options[UIApplication.OpenURLOptionsKey.annotation]
        
        let handled: Bool = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: sourceApplication, annotation: annotation)

        return handled
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let notificationService: NotificationService = Administrator.shared.serviceProvider.getNotificationService()
        notificationService.applicationRegistrationStatus(NotificationService.RegistrationStatus.success(deviceToken: deviceToken))
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        let notificationService: NotificationService = Administrator.shared.serviceProvider.getNotificationService()
        notificationService.applicationRegistrationStatus(NotificationService.RegistrationStatus.fail(error: error))
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        let notificationService: NotificationService = Administrator.shared.serviceProvider.getNotificationService()
        notificationService.handleNotificationUserInfo(userInfo)
        
        completionHandler(.noData)
    }
}
