//
//  SNRSynerise.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2023 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRSyneriseActivity.h>
#import <SyneriseSDK/SNRHostApplicationType.h>
#import <SyneriseSDK/SNRNotificationInfo.h>

@class SNRSettings;

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString * const SNRSyneriseDomain;
FOUNDATION_EXPORT NSString * const SNRSyneriseBundleIdentifier;
FOUNDATION_EXPORT NSString * const SNRSyneriseVersion;

/**
 * @protocol SNRSyneriseDelegate
 *
 * A delegate to handle actions from the Synerise SDK.
 *
 * @note Note that if optional methods are not implemented, Synerise has a default behavior only for the URL action - it's redirected to a browser.
 */

NS_SWIFT_NAME(SyneriseDelegate)
@protocol SNRSyneriseDelegate

@optional

/**
 * This method is called when the Synerise SDK is initialized.
 */
- (void)SNR_initialized NS_SWIFT_NAME(snr_initialized());

/**
 * This method is called when an error occurs while initializing the Synerise SDK.
 *
 * @param error The error that occurred.
 */
- (void)SNR_initializationError:(NSError *)error NS_SWIFT_NAME(snr_initializationError(error:));

/**
 * This method is called when Synerise needs registration for Push Notifications.
 *
 * @note You should invoke the `[SNRClient registerForPush:success:failure:]` method again.
 */
- (void)SNR_registerForPushNotificationsIsNeeded NS_SWIFT_NAME(snr_registerForPushNotificationsIsNeeded());

/**
 * This method is called when Synerise handles URL action from campaign activities.
 *
 * @param url URL address value from the activity.
 *
 * @note This method is invoked when the `SNR_handledActionWithURL:activity:completionHandler:` method is not implemented.
 */
- (void)SNR_handledActionWithURL:(NSURL *)url NS_SWIFT_NAME(snr_handledAction(url:));

/**
 * This method is called when Synerise handles deeplink action from campaign activities.
 *
 * @param deepLink Literal text value from the activity.
 *
 * @note This method will be invoked when the `SNR_handledActionWithDeepLink:activity:completionHandler:` method is not implemented.
 */
- (void)SNR_handledActionWithDeepLink:(NSString *)deepLink NS_SWIFT_NAME(snr_handledAction(deepLink:));

/**
 * This method is called when Synerise handles URL action from campaign activities.
 *
 * @param url URL address value from the activity.
 * @param activity Identifies Synerise campaign activity (`SNRSyneriseActivity`).
 * @param completionHandler A block that should be invoked with `SNRSyneriseActivityAction` parameters and a completion block to execute.
 */
- (void)SNR_handledActionWithURL:(NSURL *)url activity:(SNRSyneriseActivity)activity completionHandler:(SNRSyneriseActivityCompletionHandler)completionHandler NS_SWIFT_NAME(snr_handledAction(url:activity:completionHandler:));

/**
 * This method is called when Synerise handles deeplink action from campaign activities.
 *
 * @param deepLink Literal text value from activity.
 * @param activity Identifies Synerise campaign activity (`SNRSyneriseActivity`).
 * @param completionHandler A block that should be invoked with parameters: `SNRSyneriseActivityAction` and completion block to execute.
 */
- (void)SNR_handledActionWithDeepLink:(NSString *)deepLink activity:(SNRSyneriseActivity)activity completionHandler:(SNRSyneriseActivityCompletionHandler)completionHandler NS_SWIFT_NAME(snr_handledAction(deepLink:activity:completionHandler:));

@end

/**
 * @protocol SNRNotificationDelegate
 *
 * A delegate to handle events from Synerise notifications.
 *
 * @note Note that all methods are optional.
 */

NS_SWIFT_NAME(NotificationDelegate)
@protocol SNRNotificationDelegate

@optional

/**
 * This method is called when a Synerise notification is received.
 */
- (void)SNR_notificationDidReceive:(SNRNotificationInfo *)notificationInfo NS_SWIFT_NAME(snr_notificationDidReceive(notificationInfo:));

/**
 * This method is called when a Synerise notification is dismissed.
 *
 * @note This method is deprecated for backward compatibility and will be removed from the 5.0.0 version of the SDK.
 */
- (void)SNR_notificationDidDissmis:(SNRNotificationInfo *)notificationInfo NS_SWIFT_NAME(snr_notificationDidDissmis(notificationInfo:)) DEPRECATED_MSG_ATTRIBUTE("This method contains the spelling mistake in the name and it is deprecated. Use `snr_notificationDidDismiss(notificationInfo:)` instead.");

/**
 * This method is called when a Synerise notification is dismissed.
 */
- (void)SNR_notificationDidDismiss:(SNRNotificationInfo *)notificationInfo NS_SWIFT_NAME(snr_notificationDidDismiss(notificationInfo:));

/**
 * This method is called when a Synerise notification is clicked.
 */
- (void)SNR_notificationClicked:(SNRNotificationInfo *)notificationInfo NS_SWIFT_NAME(snr_notificationClicked(notificationInfo:));

/**
 * This method is called when an action button is clicked in a Synerise notification.
 */
- (void)SNR_notificationActionButtonClicked:(SNRNotificationInfo *)notificationInfo actionButton:(NSString *)actionButton NS_SWIFT_NAME(snr_notificationClicked(notificationInfo:actionButton:));

@end

/**
 * @class SNRSynerise
 *
 * SNRSynerise is responsible for initialization the Synerise SDK and its main actions.
 */

NS_SWIFT_NAME(Synerise)
@interface SNRSynerise : NSObject

@property (class, nonatomic, nonnull, readonly) SNRSettings *settings;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

/**
 * Initializes Synerise SDK.
 *
 * @param clientApiKey Synerise Profile API Key.
 *
 * @note This method needs to be called before any other method of Synerise SDK and only once during application lifecycle.
 */
+ (void)initializeWithClientApiKey:(NSString *)clientApiKey NS_SWIFT_NAME(initialize(clientApiKey:));

/**
 * Initializes Synerise SDK with custom environment settings.
 *
 * @param clientApiKey Synerise Profile API Key.
 * @param baseUrl Synerise API custom environment base URL.
 *
 * @note This method needs to be called before any other method of Synerise SDK and only once during application lifecycle.
 */
+ (void)initializeWithClientApiKey:(NSString *)clientApiKey andBaseUrl:(nullable NSString *)baseUrl NS_SWIFT_NAME(initialize(clientApiKey:baseUrl:));

/**
 * Changes Profile API Key dynamically.
 *
 * @param clientApiKey Synerise Profile API Key.
 */
+ (void)changeClientApiKey:(NSString *)clientApiKey;

/**
 * Sets salt string for request validation.
 *
 * @param string Synerise Profile salt string for request validation.
 */
+ (void)setRequestValidationSalt:(NSString *)string;

/**
 * Enables/Disables console logs from Synerise SDK.
 *
 * @param enabled Specifies that console logs are enabled/disabled.
 *
 * @note It is not recommended to use debug mode in release version of your application.
 */
+ (void)setDebugModeEnabled:(BOOL)enabled;

/**
 * Enables/Disables crash handling from Synerise SDK.
 *
 * @param enabled Specifies that crash handling is enabled/disabled.
 *
 */
+ (void)setCrashHandlingEnabled:(BOOL)enabled;

/**
 * Sets Synerise SDK host application type.
 *
 * @param type Specifies the type of the host application.
 *
 */
+ (void)setHostApplicationType:(SNRHostApplicationType)type;

/**
 * Sets Synerise SDK plugin version of the host application.
 *
 * @param version Specifies the version of the Synerise SDK plugin in the host application.
 *
 */
+ (void)setHostApplicationSDKPluginVersion:(NSString *)version;

/**
 * Sets object for Synerise delegate methods.
 *
 * @param delegate An object that implement SNRSyneriseDelegate protocol.
 */
+ (void)setDelegate:(id<SNRSyneriseDelegate>)delegate;

/**
 * Sets object for notification delegate methods.
 *
 * @param delegate An object that implement SNRNotificationDelegate protocol.
 */
+ (void)setNotificationDelegate:(id<SNRNotificationDelegate>)delegate;

/**
 * Checks if notification's sender is Synerise.
 *
 * @param userInfo Key-Value map of data.
 */
+ (BOOL)isSyneriseNotification:(NSDictionary *)userInfo;

/**
 * Checks if notification's sender is Synerise and its kind is Simple Push.
 *
 * @param userInfo Key-Value map of data.
 */
+ (BOOL)isSyneriseSimplePush:(NSDictionary *)userInfo;

/**
 * Checks if notification's sender is Synerise and its kind is Banner.
 *
 * @param userInfo Key-Value map of data.
 */
+ (BOOL)isSyneriseBanner:(NSDictionary *)userInfo;

/**
 * Checks if notification's sender is Synerise and its kind is Silent Command.
 *
 * @param userInfo Key-Value map of data.
 */
+ (BOOL)isSyneriseSilentCommand:(NSDictionary *)userInfo;

/**
 * Checks if notification's sender is Synerise and its kind is Silent SDK Command.
 *
 * @param userInfo Key-Value map of data.
 */
+ (BOOL)isSyneriseSilentSDKCommand:(NSDictionary *)userInfo;

/**
 * Checks if notification payload is encrypted by Synerise.
 *
 * @param userInfo Key-Value map of data.
 */
+ (BOOL)isNotificationEncrypted:(NSDictionary *)userInfo;

/**
 * Decrypts notification payload.
 *
 * @param userInfo Key-Value map of data.
 *
 * @note If notification is not encrypted the method returns raw payload.
 * @note If notification is not decrypted successfully, the method returns nil.
 */
+ (nullable NSDictionary *)decryptNotification:(NSDictionary *)userInfo;

/**
 * Handles notification payload and starts activity.
 *
 * @param userInfo Key-Value map of data. Key "issuer" must be set to "Synerise" value.
 */
+ (void)handleNotification:(NSDictionary *)userInfo;

/**
 * Handles notification payload with action and starts activity.
 *
 * @param userInfo Key-Value map of data. Key "issuer" must be set to "Synerise" value.
 * @param actionIdentifier Identifier of action received from notification response.
 */
+ (void)handleNotification:(NSDictionary *)userInfo actionIdentifier:(nullable NSString *)actionIdentifier;

@end

NS_ASSUME_NONNULL_END
