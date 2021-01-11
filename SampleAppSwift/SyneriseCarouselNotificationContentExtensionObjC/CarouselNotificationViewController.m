//
//  CarouselNotificationViewController.m
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2020 Synerise. All rights reserved.
//

#import "CarouselNotificationViewController.h"

@implementation CarouselNotificationViewController

- (void)didReceiveNotification:(UNNotification *)notification {
    SNRSynerise.settings.sdk.appGroupIdentifier = @"APP_GROUP";
    SNRSynerise.settings.sdk.keychainGroupIdentifier = @"KECHAIN_GROUP";
    
    [self setSyneriseNotification:notification];
}
- (void)didReceiveNotificationResponse:(UNNotificationResponse *)response completionHandler:(void (^)(UNNotificationContentExtensionResponseOption))completion {
    [self setSyneriseNotificationResponse:response completionHandler:completion];
}

@end
