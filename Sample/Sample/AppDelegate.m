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
    
    [SNRTracker setLoggingEnabled:YES];
    [SNRTracker setAutoTrackMode:SNRTrackerAutoTrackModeFine];
    
    [SNRClient setLoggingEnabled:YES];
    [SNRProfile setLoggingEnabled:YES];
    
    [SNRInjector setLoggingEnabled:YES];
    [SNRInjector setAutomatic:YES];
    [SNRInjector setBannerDelegate:self];
    [SNRInjector setWalkthroughDelegate:self];
    
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
    //...
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    //...
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    //...
}

// iOS 9

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    BOOL isSyneriseNotification = [SNRSynerise isSyneriseNotification:userInfo];
    if (isSyneriseNotification) {
        [SNRSynerise handleNotification:userInfo];
    } else {
        //...
    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    BOOL isSyneriseNotification = [SNRSynerise isSyneriseNotification:userInfo];
    if (isSyneriseNotification) {
        [SNRSynerise handleNotification:userInfo];
        completionHandler(UIBackgroundFetchResultNoData);
    } else {
        //...
    }
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler {
    BOOL isSyneriseNotification = [SNRSynerise isSyneriseNotification:userInfo];
    if (isSyneriseNotification) {
        [SNRSynerise handleNotification:userInfo];
        completionHandler();
    } else {
        //...
    }
}


// iOS 10 and above
// pragma mark - UNUserNotificationCenterDelegate

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler NS_AVAILABLE_IOS(10) {
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    
    BOOL isSyneriseNotification = [SNRSynerise isSyneriseNotification:userInfo];
    if (isSyneriseNotification) {
        [SNRSynerise handleNotification:userInfo];
        completionHandler();
    } else {
        //...
    }
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler NS_AVAILABLE_IOS(10) {
    NSDictionary *userInfo = notification.request.content.userInfo;
    
    BOOL isSyneriseNotification = [SNRSynerise isSyneriseNotification:userInfo];
    if (isSyneriseNotification) {
        [SNRSynerise handleNotification:userInfo];
        completionHandler(UNNotificationPresentationOptionNone);
    } else {
        //...
    }
}

#pragma mark - FIRMessagingDelegate

- (void)messaging:(FIRMessaging *)messaging didReceiveRegistrationToken:(NSString *)fcmToken {
    [SNRProfile registerForPush:fcmToken success:^(BOOL isSuccess) {
        //...
    } failure:^(NSError * _Nonnull error) {
        //...
    }];
}

#pragma mark - SNRSyneriseDelegate

//optional method - SyneriseSDK needs registration for push notifications again
//it is optional but if you use push notifications, it is required
//propable implementation
- (void)SNR_registerForPushNotificationsIsNeeded {
    NSString *fcmToken = [FIRMessaging messaging].FCMToken;
    if (fcmToken) {
        [SNRProfile registerForPush:fcmToken success:^(BOOL isSuccess) {
            //...
        } failure:^(NSError * _Nonnull error) {
            //...
        }];
    }
}

// optional method - basic implementation for handling url
// sample implementation
- (void)SNR_handledActionWithURL:(NSURL*)url {
    if ([[UIApplication sharedApplication] canOpenURL:url ]) {
        if (@available(iOS 10, *)) {
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
        } else {
            [[UIApplication sharedApplication] openURL:url];
        }
    }
}

// optional method - basic implementation for handling deeplink
// implementation has to be customed
- (void)SNR_handledActionWithDeepLink:(NSString*)deepLink {
    //...
}

// optional method - advanced implementation for handling url
// when this method is implemented, it will be called instead of snr_handledAction(url:)
// sample implementation
- (void)SNR_handledActionWithURL:(NSURL*)url activity:(SNRSyneriseActivity)activity completionHandler:(SNRSyneriseActivityCompletionHandler)completionHandler {
    if (activity == SNRSyneriseActivityWalkthrough) {
        completionHandler(SNRSyneriseActivityActionNone, ^{
            if ([[UIApplication sharedApplication] canOpenURL:url ]) {
                if (@available(iOS 10, *)) {
                    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
                } else {
                    [[UIApplication sharedApplication] openURL:url];
                }
            }
        });
        
        return;
    }
    
    if (activity == SNRSyneriseActivitySimplePush || activity == SNRSyneriseActivityBanner) {
        completionHandler(SNRSyneriseActivityActionHide, ^{
            //...
        });
        
        return;
    }
}

// optional method - advanced implementation for handling deeplink
// when this method is implemented, it will be called instead of snr_handledAction(deepLink:)
// implementation has to be customed
- (void)SNR_handledActionWithDeepLink:(NSString *)deepLink activity:(SNRSyneriseActivity)activity completionHandler:(SNRSyneriseActivityCompletionHandler)completionHandler {
    //...
}

#pragma mark - SNRInjectorWalkthroughDelegate

// this method will be called when Walkthrough is loaded
- (void)SNR_walkthroughDidLoad {
    if ([SNRInjector isWalkthroughLoaded]) {
        if ([SNRInjector isLoadedWalkthroughUnique]) {
            [SNRInjector showWalkthrough];
        }
    }
}

// this method will be called when an error occurs while loading Walkthrough
- (void)SNR_walkthroughLoadingError:(NSError*)error {
    //...
}

// this method will be called when Walkthrough appeared
- (void)SNR_walkthroughDidAppear {
    //...
}

// this method will be called when Walkthrough disappeared
- (void)SNR_walkthroughDidDisappear {
    //...
}

#pragma mark - SNRInjectorBannerDelegate

// this method will be called when SyneriseSDK asks if it can display a banner at the moment
- (BOOL)SNR_shouldBannerAppear:(NSDictionary*)bannerDictionary {
    return YES;
}

// this method will be called when Banner appeared
- (void)SNR_bannerDidAppear {
    //...
}

// this method will be called when Banner disappeared
- (void)SNR_bannerDidDisappear {
    //...
}

@end
