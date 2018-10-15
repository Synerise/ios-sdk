//
//  SNRSynerise.h
//  SyneriseSDK
//
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
    /// Activity should be stay on screen
    /// note that Simple Push disappears always by default
    SNRSyneriseActivityActionNone,
    
    /// Activity should disappear from screen
    SNRSyneriseActivityActionHide
    
} NS_SWIFT_NAME(SyneriseActivityAction);

typedef void (^SNRSyneriseActivityActionCompletionBlock)(void) NS_SWIFT_NAME(SyneriseActivityActionCompletionBlock);
typedef void (^SNRSyneriseActivityCompletionHandler)(SNRSyneriseActivityAction, __nullable SNRSyneriseActivityActionCompletionBlock) NS_SWIFT_NAME(SyneriseActivityCompletionHandler);


/**
 * A protocol to handle actions from SyneriseSDK.
 *
 * @note Note that if optional methods are not implemented, Synerise has got default behaviour only for url action - it is redirected to a browser.
 */

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(SyneriseDelegate)
@protocol SNRSyneriseDelegate

@optional
/**
 * This method will be called when registration for push notifications is needed.
 *
 * @note You should invoke '[SNRProfile registerForPush:success:failure:]' method again.
 */
- (void)SNR_registerForPushNotificationsIsNeeded NS_SWIFT_NAME(snr_registerForPushNotificationsIsNeeded());

/**
 * This method will call when Synerise handles url action from campaign Activity.
 *
 * @param url is network address value from activity.
 * @note This method will be invoke when method 'SNR_handledActionWithURL:activity:completionHandler:' is not implemented.
 */
- (void)SNR_handledActionWithURL:(NSURL *)url NS_SWIFT_NAME(snr_handledAction(url:));

/**
 * This method will call when Synerise handles deeplink action from campaign Activity.
 *
 * @param deepLink is literal text value from activity.
 * @note This method will be invoke when method 'SNR_handledActionWithDeepLink:activity:completionHandler:' is not implemented.
 */
- (void)SNR_handledActionWithDeepLink:(NSString *)deepLink NS_SWIFT_NAME(snr_handledAction(deepLink:));

/**
 * This method will call when Synerise handles url action from campaign Activity.
 *
 * @param url is network address value from activity.
 * @param activity identifies Synerise campaign activity (SNRSyneriseActivity).
 * @param completionHandler should be invoke with parameters: SNRSyneriseActivityAction and completion block to execute.
 */
- (void)SNR_handledActionWithURL:(NSURL *)url activity:(SNRSyneriseActivity)activity completionHandler:(SNRSyneriseActivityCompletionHandler)completionHandler NS_SWIFT_NAME(snr_handledAction(url:activity:completionHandler:));

/**
 * This method will call when Synerise handles deeplink action from campaign Activity.
 *
 * @param deepLink is literal text value from activity.
 * @param activity identifies Synerise campaign activity (SNRSyneriseActivity).
 * @param completionHandler should be invoke with parameters: SNRSyneriseActivityAction and completion block to execute.
 */
- (void)SNR_handledActionWithDeepLink:(NSString *)deepLink activity:(SNRSyneriseActivity)activity completionHandler:(SNRSyneriseActivityCompletionHandler)completionHandler NS_SWIFT_NAME(snr_handledAction(deepLink:activity:completionHandler:));

@end

NS_ASSUME_NONNULL_END

/**
 * A protocol to block Synerise Activities.
 * Implement this protocol in ViewController that cannot be covered by Synerise Activity.
 */
NS_SWIFT_NAME(SyneriseActivityNotAllowed)
@protocol SNRSyneriseActivityNotAllowed

@end

/**
 * SNRSynerise is responsible for initialization SyneriseSDK and its main actions.
 */

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(Synerise)
@interface SNRSynerise : NSObject

@property (class, nonatomic, nonnull, readonly) SNRNotificationServiceSettings *notificationServiceSettings;

+ (instancetype)new __unavailable;
- (instancetype)init __unavailable;

/**
 Initializes SyneriseSDK.
 
 @note This method needs to be called before any other method of SyneriseSDK and only once during application lifecycle.
 
 @param businessProfileApiKey Synerise API Key for Business Profile.
 @param clientApiKey Synerise API Key for Business Profile.
 */
+ (void)initializeWithBusinessProfileApiKey:(NSString *)businessProfileApiKey andClientApiKey:(NSString *)clientApiKey NS_SWIFT_NAME(initialize(businessProfileApiKey:clientApiKey:));

/**
 Initializes SyneriseSDK.
 
 @note This method needs to be called before any other method of SyneriseSDK and only once during application lifecycle.
 
 @param businessProfileApiKey Synerise API Key for Business Profile.
 @param clientApiKey Synerise API Key for Business Profile.
 @param baseUrl Synerise API custom environment base URL.
 */
+ (void)initializeWithBusinessProfileApiKey:(NSString *)businessProfileApiKey andClientApiKey:(NSString *)clientApiKey andBaseUrl:(nullable NSString *)baseUrl NS_SWIFT_NAME(initialize(businessProfileApiKey:clientApiKey:baseUrl:));

/**
 * This method sets object for Synerise delegate methods.
 *
 * @param delegate object that implement SNRSyneriseDelegate protocol.
 */
+ (void)setDelegate:(id<SNRSyneriseDelegate>)delegate;

/**
 * This method checkes that notification's sender is Synerise.
 *
 * @param userInfo Key-Value map of data. Key "issuer" must be set to "Synerise" value.
 */
+ (BOOL)isSyneriseNotification:(NSDictionary *)userInfo;

/**
 * This method handles new push message and starts activity, which build proper views from provided data.
 *
 * @param userInfo Key-Value map of data. Key "issuer" must be set to "Synerise" value.
 */
+ (void)handleNotification:(NSDictionary *)userInfo;

@end

NS_ASSUME_NONNULL_END
