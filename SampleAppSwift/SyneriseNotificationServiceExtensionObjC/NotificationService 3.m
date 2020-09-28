//
//  NotificationService.m
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2020 Synerise. All rights reserved.
//

#import "NotificationService.h"
#import <SyneriseSDK/SyneriseSDK.h>

@interface NotificationService ()

@property (nonatomic, strong) void (^contentHandler)(UNNotificationContent *contentToDeliver);
@property (nonatomic, strong) UNMutableNotificationContent *bestAttemptContent;

@end

@implementation NotificationService

#pragma mark - Inherited

- (void)didReceiveNotificationRequest:(UNNotificationRequest *)request withContentHandler:(void (^)(UNNotificationContent * _Nonnull))contentHandler {
    self.contentHandler = contentHandler;
    self.bestAttemptContent = [request.content mutableCopy];
    
    SNRSynerise.settings.sdk.appGroupIdentifier = @"group.com.synerise.sdk.sample-swift";
    SNRSynerise.settings.sdk.keychainGroupIdentifier = @"34N2Z22TKH.keychainGroup";
    
#ifdef DEBUG
    [SNRNotificationServiceExtension setDebugModeEnabled:YES];
#endif
    
    [SNRNotificationServiceExtension setDecryptionFallbackNotificationTitle:@"(...)" andBody:@"(...)"];
    [SNRNotificationServiceExtension didReceiveNotificationExtensionRequest:request withMutableNotificationContent:self.bestAttemptContent];
    
    self.contentHandler(self.bestAttemptContent);
}

- (void)serviceExtensionTimeWillExpire {
    // Called just before the extension will be terminated by the system.
    // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.

    self.contentHandler(self.bestAttemptContent);
}

@end
