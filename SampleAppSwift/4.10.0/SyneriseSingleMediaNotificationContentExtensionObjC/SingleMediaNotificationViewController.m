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
    SNRSynerise.settings.sdk.appGroupIdentifier = @"group.com.synerise.sdk.sample-swift";
    SNRSynerise.settings.sdk.keychainGroupIdentifier = @"34N2Z22TKH.keychainGroup";
    
    self.contentViewIsScrollable = NO;
    self.imageContentMode = UIViewContentModeScaleAspectFit;
    
    [self setSyneriseNotification:notification];
}
- (void)didReceiveNotificationResponse:(UNNotificationResponse *)response completionHandler:(void (^)(UNNotificationContentExtensionResponseOption))completion{
    [self setSyneriseNotificationResponse:response completionHandler:completion];
}

@end
