//
//  NotificationService.m
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2020 Synerise. All rights reserved.
//

#import "NotificationService.h"
#import <SyneriseSDK/SyneriseSDK.h>

@interface NotificationService () <SNRNotificationServiceExtensionDelegate>

@property (nonatomic, strong) void (^contentHandler)(UNNotificationContent *contentToDeliver);
@property (nonatomic, strong) UNNotificationRequest *receivedRequest;
@property (nonatomic, strong) UNMutableNotificationContent *bestAttemptContent;

@end

@implementation NotificationService

#pragma mark - Inherited

- (void)didReceiveNotificationRequest:(UNNotificationRequest *)request withContentHandler:(void (^)(UNNotificationContent * _Nonnull))contentHandler {
    self.contentHandler = contentHandler;
    self.receivedRequest = request;
    self.bestAttemptContent = [request.content mutableCopy];
    
    SNRSynerise.settings.sdk.appGroupIdentifier = @"group.com.synerise.sdk.sample-swift";
    SNRSynerise.settings.sdk.keychainGroupIdentifier = @"34N2Z22TKH.keychainGroup";
    
    [SNRNotificationServiceExtension setDelegate:self];
    
#ifdef DEBUG
    [SNRNotificationServiceExtension setDebugModeEnabled:YES];
#endif
    
    // DEBUG ONLY !!!
    // Uncomment the 1 line below to cause service extension expiration and check how `serviceExtensionTimeWillExpire` method works.
    // [NSThread sleepForTimeInterval:25.0f];
    
    [SNRNotificationServiceExtension setDecryptionFallbackNotificationTitle:@"(Encrypted)" andBody:@"(Encrypted)"];
    [SNRNotificationServiceExtension didReceiveNotificationExtensionRequest:request withMutableNotificationContent:self.bestAttemptContent];
    
    // DEBUG ONLY !!!
    // Uncomment the 1 line below and comment out the 2 lines above to ensure this extension is excuting.
    // Remember, this extension only runs when mutable-content is set true in Synerise campaign options.
    // self.bestAttemptContent.body = [@"[Modified] " stringByAppendingString:self.bestAttemptContent.body];
    
    self.contentHandler(self.bestAttemptContent);
}

- (void)serviceExtensionTimeWillExpire {
    // Called just before the extension will be terminated by the system.
    // Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
    
    [SNRNotificationServiceExtension serviceExtensionTimeWillExpireRequest:self.receivedRequest withMutableNotificationContent:self.bestAttemptContent];
    self.bestAttemptContent.title = @"Fallback title";
    self.bestAttemptContent.body = @"Fallback body";
    self.contentHandler(self.bestAttemptContent);
}

#pragma mark - SNRNotificationServiceExtensionDelegate

- (void)notificationServiceExtensionDidFailProcessingWithError:(NSError *)error {
#ifdef DEBUG
    self.bestAttemptContent.body = error.localizedDescription;
#endif
}

- (void)notificationServiceExtensionDidFailDecryptionWithError:(NSError *)error {
#ifdef DEBUG
    self.bestAttemptContent.body = error.localizedDescription;
#endif
}

@end
