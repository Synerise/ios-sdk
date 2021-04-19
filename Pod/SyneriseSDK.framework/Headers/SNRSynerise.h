//
//  SNRSynerise.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2021 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRHostApplicationType.h>

@class SNRSettings;

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString * const SNRSyneriseDomain;
FOUNDATION_EXPORT NSString * const SNRSyneriseBundleIdentifier;

/**
 * @enum SNRSyneriseActivity
 */

typedef NS_ENUM(NSInteger, SNRSyneriseActivity) {
    /// Simple Push campaign activity
    SNRSyneriseActivitySimplePush,
    
    /// Banner campaign activity
    SNRSyneriseActivityBanner,
    
    /// Walkthrough campaign activity
    SNRSyneriseActivityWalkthrough,
    
} NS_SWIFT_NAME(SyneriseActivity);


/**
 * @enum SNRSyneriseActivityAction
 */

typedef NS_ENUM(NSInteger, SNRSyneriseActivityAction) {
    /// Activity should be stay on screen.
    /// Note that Simple Push disappears always by default.
    SNRSyneriseActivityActionNone,
    
    /// Activity should disappear from screen.
    SNRSyneriseActivityActionHide
    
} NS_SWIFT_NAME(SyneriseActivityAction);

typedef void (^SNRSyneriseActivityActionCompletionBlock)(void) NS_SWIFT_NAME(SyneriseActivityActionCompletionBlock);
typedef void (^SNRSyneriseActivityCompletionHandler)(SNRSyneriseActivityAction, __nullable SNRSyneriseActivityActionCompletionBlock) NS_SWIFT_NAME(SyneriseActivityCompletionHandler);


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
 * @protocol SyneriseActivityNotAllowed
 *
 * A protocol to block Synerise Activities.
 * Implement this protocol in a View Controller that cannot be covered by Synerise Activity.
 */

NS_SWIFT_NAME(SyneriseActivityNotAllowed)
@protocol SNRSyneriseActivityNotAllowed

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
 * @param clientApiKey Synerise Client API Key.
 *
 * @note This method needs to be called before any other method of Synerise SDK and only once during application lifecycle.
 */
+ (void)initializeWithClientApiKey:(NSString *)clientApiKey NS_SWIFT_NAME(initialize(clientApiKey:));

/**
 * Initializes Synerise SDK with custom environment settings.
 *
 * @param clientApiKey Synerise Client API Key.
 * @param baseUrl Synerise API custom environment base URL.
 *
 * @note This method needs to be called before any other method of Synerise SDK and only once during application lifecycle.
 */
+ (void)initializeWithClientApiKey:(NSString *)clientApiKey andBaseUrl:(nullable NSString *)baseUrl NS_SWIFT_NAME(initialize(clientApiKey:baseUrl:));

/**
 * Changes Client API Key dynamically.
 *
 * @param clientApiKey Synerise Client API Key.
 */
+ (void)changeClientApiKey:(NSString *)clientApiKey;

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
 * @param type Specifies type of host application.
 *
 */
+ (void)setHostApplicationType:(SNRHostApplicationType)type;

/**
 * Sets object for Synerise delegate methods.
 *
 * @param delegate An object that implement SNRSyneriseDelegate protocol.
 */
+ (void)setDelegate:(id<SNRSyneriseDelegate>)delegate;

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
