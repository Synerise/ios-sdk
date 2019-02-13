//
//  SNRSynerise.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright © 2018 Synerise. All rights reserved.
//

@class SNRNotificationServiceSettings;

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

NS_ASSUME_NONNULL_BEGIN

/**
 * @protocol SNRSyneriseDelegate
 *
 * A protocol to handle actions from Synerise SDK.
 *
 * @note Note that if optional methods are not implemented, Synerise has got default behaviour only for url action - it is redirected to a browser.
 */

NS_SWIFT_NAME(SyneriseDelegate)
@protocol SNRSyneriseDelegate

@optional
/**
 * This method will be called when registration for push notifications is needed.
 *
 * @note You should invoke '[SNRClient registerForPush:success:failure:]' method again.
 */
- (void)SNR_registerForPushNotificationsIsNeeded NS_SWIFT_NAME(snr_registerForPushNotificationsIsNeeded());

/**
 * This method will call when Synerise handles url action from campaign Activity.
 *
 * @param url URL address value from activity.
 *
 * @note This method will be invoke when method 'SNR_handledActionWithURL:activity:completionHandler:' is not implemented.
 */
- (void)SNR_handledActionWithURL:(NSURL *)url NS_SWIFT_NAME(snr_handledAction(url:));

/**
 * This method will call when Synerise handles deeplink action from campaign Activity.
 *
 * @param deepLink Literal text value from activity.
 *
 * @note This method will be invoke when method 'SNR_handledActionWithDeepLink:activity:completionHandler:' is not implemented.
 */
- (void)SNR_handledActionWithDeepLink:(NSString *)deepLink NS_SWIFT_NAME(snr_handledAction(deepLink:));

/**
 * This method will call when Synerise handles url action from campaign Activity.
 *
 * @param url URL address value from activity.
 * @param activity Identifies Synerise campaign activity (SNRSyneriseActivity).
 * @param completionHandler A block that should be invoked with parameters: SNRSyneriseActivityAction and completion block to execute.
 */
- (void)SNR_handledActionWithURL:(NSURL *)url activity:(SNRSyneriseActivity)activity completionHandler:(SNRSyneriseActivityCompletionHandler)completionHandler NS_SWIFT_NAME(snr_handledAction(url:activity:completionHandler:));

/**
 * This method will call when Synerise handles deeplink action from campaign Activity.
 *
 * @param deepLink Literal text value from activity.
 * @param activity Identifies Synerise campaign activity (SNRSyneriseActivity).
 * @param completionHandler A block that should be invoked with parameters: SNRSyneriseActivityAction and completion block to execute.
 */
- (void)SNR_handledActionWithDeepLink:(NSString *)deepLink activity:(SNRSyneriseActivity)activity completionHandler:(SNRSyneriseActivityCompletionHandler)completionHandler NS_SWIFT_NAME(snr_handledAction(deepLink:activity:completionHandler:));

@end

NS_ASSUME_NONNULL_END

NS_ASSUME_NONNULL_BEGIN

/**
 * @protocol SyneriseActivityNotAllowed
 *
 * A protocol to block Synerise Activities.
 * Implement this protocol in View Controller that cannot be covered by Synerise Activity.
 */

NS_SWIFT_NAME(SyneriseActivityNotAllowed)
@protocol SNRSyneriseActivityNotAllowed

@end

NS_ASSUME_NONNULL_END

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRSynerise
 *
 * SNRSynerise is responsible for initialization Synerise SDK and its main actions.
 */

NS_SWIFT_NAME(Synerise)
@interface SNRSynerise : NSObject

@property (class, nonatomic, nonnull, readonly) SNRNotificationServiceSettings *notificationServiceSettings;

+ (instancetype)new __unavailable;
- (instancetype)init __unavailable;

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
 * Enables/disables console logs from Synerise SDK.
 *
 * @param enabled Specifies that console logs are enabled/disabled.
 *
 * @note It is not recommended to use debug mode in release version of your application.
 */
+ (void)setDebugModeEnabled:(BOOL)enabled;

/**
 * Sets object for Synerise delegate methods.
 *
 * @param delegate An object that implement SNRSyneriseDelegate protocol.
 */
+ (void)setDelegate:(id<SNRSyneriseDelegate>)delegate;

/**
 * Checks that notification's sender is Synerise.
 *
 * @param userInfo Key-Value map of data. Key "issuer" must be set to "Synerise" value.
 */
+ (BOOL)isSyneriseNotification:(NSDictionary *)userInfo;

/**
 * Handles new push message and starts activity, which build proper views from provided data.
 *
 * @param userInfo Key-Value map of data. Key "issuer" must be set to "Synerise" value.
 */
+ (void)handleNotification:(NSDictionary *)userInfo;

/**
 * Handles push message action identifeir and execute its action if is set.
 *
 * @param userInfo Key-Value map of data. Key "issuer" must be set to "Synerise" value.
 * @param actionIdentifier Identifier of action received from notification response.
 */
+ (void)handleNotification:(NSDictionary *)userInfo actionIdentifier:(NSString *)actionIdentifier;

/**
 * Checks that notification's sender is Synerise and its kind is Simple Push.
 *
 * @param userInfo Key-Value map of data.
 */
+ (BOOL)isSyneriseSimplePush:(NSDictionary *)userInfo;

/**
 * Checks that notification's sender is Synerise and its kind is Silent Command.
 *
 * @param userInfo Key-Value map of data.
 */
+ (BOOL)isSyneriseSilentCommand:(NSDictionary *)userInfo;

/**
 * Checks that notification's sender is Synerise and its kind is Silent SDK Command.
 *
 * @param userInfo Key-Value map of data.
 */
+ (BOOL)isSyneriseSilentSDKCommand:(NSDictionary *)userInfo;

/**
 * Checks that notification's sender is Synerise and its kind is Banner.
 *
 * @param userInfo Key-Value map of data.
 */
+ (BOOL)isSyneriseBanner:(NSDictionary *)userInfo;

@end

NS_ASSUME_NONNULL_END
