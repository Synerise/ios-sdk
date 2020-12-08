//
//  SingleMediaNotificationViewController.m
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2020 Synerise. All rights reserved.
//

#import "SingleMediaNotificationViewController.h"

@implementation SingleMediaNotificationViewController

- (void)didReceiveNotification:(UNNotification *)notification{
    SNRSynerise.settings.sdk.appGroupIdentifier = @"APP_GROUP";
    SNRSynerise.settings.sdk.keychainGroupIdentifier = @"KEYCHAIN_GROUP";
    
    self.automaticallyAdjustContentViewSize = YES;
    self.contentViewIsScrollable = NO;
    self.imageContentMode = UIViewContentModeScaleAspectFit;
    
    [self setSyneriseNotification:notification];
}
- (void)didReceiveNotificationResponse:(UNNotificationResponse *)response completionHandler:(void (^)(UNNotificationContentExtensionResponseOption))completion{
    [self setSyneriseNotificationResponse:response completionHandler:completion];
}

@end
