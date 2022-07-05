//
//  SNRNotificationEncryptionHelper.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2021 Synerise. All rights reserved.
//

#import <UserNotifications/UserNotifications.h>
#import <UserNotificationsUI/UserNotificationsUI.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @enum SNRNotificationDecryptionResult
 */

typedef NS_ENUM(NSInteger, SNRNotificationDecryptionResult) {
    SNRNotificationDecryptionResultDecryptSuccess,
    SNRNotificationDecryptionResultDecryptError,
    SNRNotificationDecryptionResultUnsuitableContentError,
    SNRNotificationDecryptionResultEncryptionConfigurationError,
    SNRNotificationDecryptionResultKeychainConfigurationError,
    SNRNotificationDecryptionResultUnknownError
} NS_SWIFT_NAME(NotificationDecryptionResult);

/**
 * @class SNRNotificationEncryptionHelper
 */

NS_SWIFT_NAME(NotificationEncryptionHelper)
@interface SNRNotificationEncryptionHelper : NSObject

@property (assign, nonatomic, readonly) SNRNotificationDecryptionResult decryptionResult;
@property (copy, nonatomic, nullable, readonly) NSString * decryptionFailureReason;

- (void)setDebugModeEnabled:(BOOL)enabled;

- (BOOL)isNotificationContentEncrypted:(UNMutableNotificationContent *)notificationContent NS_SWIFT_NAME(isNotificationContentEncrypted(_:)) API_AVAILABLE(ios(10.0));
- (BOOL)isNotificationUserInfoEncrypted:(NSDictionary *)notificationUserInfo NS_SWIFT_NAME(isNotificationUserInfoEncrypted(_:));

- (SNRNotificationDecryptionResult)decryptNotificationContent:(UNMutableNotificationContent *)notificationContent NS_SWIFT_NAME(decryptNotificationContent(_:)) API_AVAILABLE(ios(10.0));
- (SNRNotificationDecryptionResult)decryptNotificationUserInfo:(NSMutableDictionary *)notificationUserInfo NS_SWIFT_NAME(decryptNotificationUserInfo(_:));

- (NSString *)getLogForDecryptionStatus:(SNRNotificationDecryptionResult)result;

@end

NS_ASSUME_NONNULL_END
