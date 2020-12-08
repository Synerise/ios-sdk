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
    
    SNRSynerise.settings.sdk.appGroupIdentifier = @"APP_GROUP";
    SNRSynerise.settings.sdk.keychainGroupIdentifier = @"KEYCHAIN_GROUP";
    
#ifdef DEBUG
    [SNRNotificationServiceExtension setDebugModeEnabled:YES];
#endif
    
    [SNRNotificationServiceExtension setDecryptionFallbackNotificationTitle:@"(Encrypted)" andBody:@"(Encrypted)"];
    [SNRNotificationServiceExtension didReceiveNotificationExtensionRequest:request withMutableNotificationContent:self.bestAttemptContent];
    
    self.contentHandler(self.bestAttemptContent);
}

- (void)serviceExtensionTimeWillExpire {
    // Called just before the extension will be terminated by the system.
    // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
    
    self.contentHandler(self.bestAttemptContent);
}

@end
