//
//  LocalNotificationSender.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import UserNotifications
import UserNotificationsUI
import SyneriseSDK

class LocalNotificationSender {
    
    func sendSimplePush1() {
        let content = UNMutableNotificationContent()
        content.title = "Simple Push"
        content.body = "OPEN_APP"
        content.userInfo = LocalNotificationsUserInfoData.getSimplePush1UserInfo()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let requestIdentifier = "kSimplePush1Identifier"
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { (_) in
            
        })
    }
    
    func sendSimplePush2() {
        let content = UNMutableNotificationContent()
        content.title = "Simple Push"
        content.body = "OPEN_URL"
        content.userInfo = LocalNotificationsUserInfoData.getSimplePush2UserInfo()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let requestIdentifier = "kSimplePush2Identifier"
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { (_) in
            
        })
    }
    
    func sendSimplePush3() {
        let content = UNMutableNotificationContent()
        content.title = "Simple Push"
        content.body = "OPEN_DEEPLINK"
        content.userInfo = LocalNotificationsUserInfoData.getSimplePush3UserInfo()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let requestIdentifier = "kSimplePush3Identifier"
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { (_) in
            
        })
    }
    
    func sendSimplePush4() {
        let content = UNMutableNotificationContent()
        content.title = "Simple Push"
        content.body = "BUTTONS"
        content.userInfo = LocalNotificationsUserInfoData.getSimplePush4UserInfo()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let requestIdentifier = "kSimplePush4Identifier"
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { (_) in
            
        })
    }
    
    func sendRichMedia1() {
        let content = UNMutableNotificationContent()
        content.title = "Rich Media"
        content.body = "Single Image"
        content.categoryIdentifier = SNRSingleMediaContentExtensionViewControllerCategoryIdentifier
        content.userInfo = LocalNotificationsUserInfoData.getRichMedia1UserInfo()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let requestIdentifier = "kRichMediaPush1Identifier"
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { (_) in
            
        })
    }
    
    func sendRichMedia2() {
        let content = UNMutableNotificationContent()
        content.title = "Rich Media"
        content.body = "Carousel PORTRAIT"
        content.categoryIdentifier = SNRCarouselContentExtensionViewControllerCategoryIdentifier
        content.userInfo = LocalNotificationsUserInfoData.getRichMedia2UserInfo()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        let requestIdentifier = "kRichMediaPush2Identifier"
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { (_) in
            
        })
    }
    
    func sendRichMedia3() {
        let content = UNMutableNotificationContent()
        content.title = "Rich Media"
        content.body = "Carousel LANDSCAPE"
        content.categoryIdentifier = SNRCarouselContentExtensionViewControllerCategoryIdentifier
        content.userInfo = LocalNotificationsUserInfoData.getRichMedia3UserInfo()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        let requestIdentifier = "kRichMediaPush2Identifier"
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { (_) in
            
        })
    }
    
    func sendBannerColorAsBackground() {
        let content = UNMutableNotificationContent()
        content.title = "Banner"
        content.body = "ColorAsBackground"
        content.userInfo = LocalNotificationsUserInfoData.getBannerTemplate1UserInfo()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        let requestIdentifier = "kBannerColorAsBackgroundIdentifier"
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { (error) in
            
        })
    }
    
    func sendBannerImageAsBackground() {
        let content = UNMutableNotificationContent()
        content.title = "Banner"
        content.body = "ImageAsBackground"
        content.userInfo = LocalNotificationsUserInfoData.getBannerTemplate2UserInfo()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        let requestIdentifier = "kBannerImageAsBackgroundIdentifier"
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { (error) in
            
        })
    }
    
    func sendBannerImageWithTextAtop() {
        let content = UNMutableNotificationContent()
        content.title = "Banner"
        content.body = "ImageWithTextAtop"
        content.userInfo = LocalNotificationsUserInfoData.getBannerTemplate3UserInfo()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        let requestIdentifier = "kBannerImageWithTextAtopIdentifier"
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { (error) in
            
        })
    }
    
    func sendBannerImageWithTextBelow() {
        let content = UNMutableNotificationContent()
        content.title = "Banner"
        content.body = "ImageWithTextBelow"
        content.userInfo = LocalNotificationsUserInfoData.getBannerTemplate4UserInfo()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        let requestIdentifier = "kBannerImageWithTextBelowIdentifier"
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { (error) in
            
        })
    }
    
    func sendGetLocationSDKCommand() {
        let content = UNMutableNotificationContent()
        content.title = "SDK Command"
        content.body = "GET LOCATION"
        content.userInfo = LocalNotificationsUserInfoData.getGetLocationSDKCommandUserInfo()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        let requestIdentifier = "kGetLocationSDKCommandIdentifier"
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { (error) in
            
        })
    }
    
    func sendSignOutSDKCommand() {
        let content = UNMutableNotificationContent()
        content.title = "SDK Command"
        content.body = "SIGN OUT"
        content.userInfo = LocalNotificationsUserInfoData.getSignOutSDKCommandUserInfo()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        let requestIdentifier = "kSignOutSDKCommandIdentifier"
        let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { (error) in
            
        })
    }
}
