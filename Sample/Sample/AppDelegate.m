//
//  AppDelegate.m
//  Sample
//
//  Created on 26/10/2017.
//  Copyright © 2017 Synerise. All rights reserved.
//

#import "AppDelegate.h"
#import <UserNotifications/UserNotifications.h>
#import <Firebase/Firebase.h>
#import <SyneriseSDK/SyneriseSDK.h>

@interface AppDelegate () <UNUserNotificationCenterDelegate, FIRMessagingDelegate, SNRSyneriseDelegate>

@end

@implementation AppDelegate

static NSString * const kBusinessProfileApiKey = @"YOUR_BUSINESS_API_KEY";
static NSString * const kClientApiKey = @"YOUR_API_KEY";

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [FIRApp configure];
    [FIRMessaging messaging].delegate = self;
    
    [SNRSynerise initializeWithBusinessProfileApiKey:kBusinessProfileApiKey andClientApiKey:kClientApiKey];
    [SNRSynerise setDelegate:self];
    
    [SNRTracker setLoggingEnabled:NO];
    [SNRTracker setAutoTrackMode:SNRTrackerAutoTrackModeFine];
    
    [SNRClient setLoggingEnabled:NO];
    [SNRProfile setLoggingEnabled:NO];
    
    if (@available(iOS 10, *)) {
        [UNUserNotificationCenter currentNotificationCenter].delegate = self;
        UNAuthorizationOptions authOptions = (UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge);
        [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:authOptions completionHandler:^(BOOL granted, NSError * _Nullable error) {

        }];
        
    } else {
        UIUserNotificationType allNotificationTypes = (UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge);
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:allNotificationTypes categories:nil];
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    }
    
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {

}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    BOOL isSyneriseNotification = [SNRSynerise isSyneriseNotification:userInfo];
    if (isSyneriseNotification) {
        [SNRSynerise handleNotification:userInfo];
        
    } else {

    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    BOOL isSyneriseNotification = [SNRSynerise isSyneriseNotification:userInfo];
    if (isSyneriseNotification) {
        [SNRSynerise handleNotification:userInfo];
        completionHandler(UIBackgroundFetchResultNoData);

    } else {

    }
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler {
    BOOL isSyneriseNotification = [SNRSynerise isSyneriseNotification:userInfo];
    if (isSyneriseNotification) {
        [SNRSynerise handleNotification:userInfo];
        completionHandler();
    } else {

    }
}

#pragma mark - UNUserNotificationCenterDelegate

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler NS_AVAILABLE_IOS(10) {
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    
    BOOL isSyneriseNotification = [SNRSynerise isSyneriseNotification:userInfo];
    if (isSyneriseNotification) {
        [SNRSynerise handleNotification:userInfo];
        completionHandler();
        
    } else {
        //
    }
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler NS_AVAILABLE_IOS(10) {
    NSDictionary *userInfo = notification.request.content.userInfo;
    
    BOOL isSyneriseNotification = [SNRSynerise isSyneriseNotification:userInfo];
    if (isSyneriseNotification) {
        [SNRSynerise handleNotification:userInfo];
        completionHandler(UNNotificationPresentationOptionNone);
        
    } else {
        //
    }
}

#pragma mark - FIRMessagingDelegate

- (void)messaging:(FIRMessaging *)messaging didReceiveRegistrationToken:(NSString *)fcmToken {
    [SNRProfile registerForPush:fcmToken success:^(BOOL isSuccess) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

#pragma mark - SNRSyneriseDelegate

- (void)syneriseUserInteractionWithURL:(NSURL*)url {
    
}

- (void)syneriseUserInteractionWithDeepLink:(NSString *)deepLink {
    
}

@end
