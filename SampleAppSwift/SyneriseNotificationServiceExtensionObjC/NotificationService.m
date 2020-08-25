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

@property (nonatomic, strong) SNRNotificationEncryptionHelper *notificationEncryptionHelper;

@end

@implementation NotificationService

- (void)didReceiveNotificationRequest:(UNNotificationRequest *)request withContentHandler:(void (^)(UNNotificationContent * _Nonnull))contentHandler {
    self.contentHandler = contentHandler;
    self.bestAttemptContent = [request.content mutableCopy];
    
    self.notificationEncryptionHelper = [SNRNotificationEncryptionHelper new];
    [self.notificationEncryptionHelper setDebugModeEnabled:YES];
    
    SNRSynerise.settings.sdk.keychainGroupIdentifier = @"34N2Z22TKH.keychainGroup";
    
    BOOL shouldDecryptNotification = [self.notificationEncryptionHelper isNotificationContentEncrypted:self.bestAttemptContent];
    if (shouldDecryptNotification == YES) {
        SNRNotificationDecryptionResult decryptionResult = [self.notificationEncryptionHelper decryptNotificationContent:self.bestAttemptContent];
        if (decryptionResult != SNRNotificationDecryptionResultDecryptSuccess) {
            self.bestAttemptContent.title = @"(Encrypted)";
            self.bestAttemptContent.body = @"(Encrypted)";
        }
    }
    
    self.contentHandler(self.bestAttemptContent);
}

- (void)serviceExtensionTimeWillExpire {
    // Called just before the extension will be terminated by the system.
    // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
    
    BOOL shouldDecryptNotification = [self.notificationEncryptionHelper isNotificationContentEncrypted:self.bestAttemptContent];
    if (shouldDecryptNotification == YES) {
        self.bestAttemptContent.title = @"(Encrypted)";
        self.bestAttemptContent.body = @"(Encrypted)";
    }

    self.contentHandler(self.bestAttemptContent);
}

@end
