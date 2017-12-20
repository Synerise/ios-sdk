//
//  AppDelegate.m
//  Sample
//
//  Created on 26/10/2017.
//  Copyright © 2017 Synerise. All rights reserved.
//

#import "AppDelegate.h"
#import <SyneriseSDK/SyneriseSDK.h>

@import UserNotifications;

@interface AppDelegate ()<UNUserNotificationCenterDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // initialize Tracker module
    [SNRTracker initialize:<#Your Business Profile API Key#>];

    // initialize Profile module
    [SNRProfile initialize:<#Your Business Profile API Key#>];

    // initialize Injector module
    [SNRInjector initialize:<#Your Business Profile API Key#>];

    // initialize Client module
    [SNRClient initialize:<#Your Synerise Client API Key#>];

    // For iOS 10 display notification (sent via APNS)
    if (@available(iOS 10.0, *)) {
        [UNUserNotificationCenter currentNotificationCenter].delegate = self;
        UNAuthorizationOptions authOptions =
        UNAuthorizationOptionAlert
        | UNAuthorizationOptionSound
        | UNAuthorizationOptionBadge;
        [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:authOptions completionHandler:^(BOOL granted, NSError * _Nullable error) {
        }];
    } else {
        UIUserNotificationType allNotificationTypes =
        (UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge);
        UIUserNotificationSettings *settings =
        [UIUserNotificationSettings settingsForTypes:allNotificationTypes categories:nil];
        [application registerUserNotificationSettings:settings];
    }

    [application registerForRemoteNotifications];

    return YES;
}

#pragma mark - Incoming push notifications handling
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // retrieve token string
    NSString *deviceTokenString = [deviceToken description];

    // register this token in Synerise
    [SNRProfile registerForPush:deviceTokenString success:^(BOOL isSuccess) {
        NSLog(@"Synerise push registration finished with success");
    } failure:^(NSError *error) {
        NSLog(@"Synerise push registration failed: %@", error);
    }];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [SNRInjector handlePushNotification:userInfo];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    [SNRInjector handlePushNotification:userInfo];

    // your own push handling code

    completionHandler(UIBackgroundFetchResultNoData);
}

#pragma mark - UNUserNotificationCenterDelegate methods
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler NS_AVAILABLE_IOS(10) {
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    [SNRInjector handlePushNotification:userInfo];

    // your own push handling code

    completionHandler();
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler NS_AVAILABLE_IOS(10) {
    NSDictionary *userInfo = notification.request.content.userInfo;
    [SNRInjector handlePushNotification:userInfo];

    // your own push handling code

    completionHandler(UNNotificationPresentationOptionNone);
}

@end
