//
//  SNRInjector.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2023 Synerise. All rights reserved.
//

@class SNRInAppMessageData;

NS_ASSUME_NONNULL_BEGIN

/**
 * @protocol SNRInjectorWalkthroughDelegate
 *
 * A delegate to handle events from walkthrough campaigns.
 *
 * When you choose to load and present a walkthrough manually, you may be interested in the following delegate methods.
 *
 * @note Note that all these methods are optional and implementing them is not required. They are also called when a walkthrough was loaded automatically.
 */

NS_SWIFT_NAME(InjectorWalkthroughDelegate)
@protocol SNRInjectorWalkthroughDelegate

@optional

/**
 * This method is called after a walkthrough is loaded.
 *
 * @note This method will be invoked when the `SNR_walkthroughDidLoad:` method is not implemented.
 */
- (void)SNR_walkthroughDidLoad NS_SWIFT_NAME(snr_walkthroughDidLoad());

/**
 * This method is called after a walkthrough is loaded.
 *
 * @param walkthroughDictionary Dictionary representation of the walkthrough.
 */
- (void)SNR_walkthroughDidLoad:(NSDictionary *)walkthroughDictionary NS_SWIFT_NAME(snr_walkthroughDidLoad(walkthroughDictionary:));

/**
 * This method is called when an error occurs while loading a walkthrough.
 *
 * @param error The error that occurred.
 */
- (void)SNR_walkthroughLoadingError:(NSError *)error NS_SWIFT_NAME(snr_walkthroughLoadingError(error:));

/**
 * This method is called after a walkthrough appears.
 */
- (void)SNR_walkthroughDidAppear NS_SWIFT_NAME(snr_walkthroughDidAppear());

/**
 * This method is called after a walkthrough disappears.
 */
- (void)SNR_walkthroughDidDisappear NS_SWIFT_NAME(snr_walkthroughDidDisappear());

@end


/**
 * @protocol SNRInjectorBannerDelegate
 *
 * A delegate to handle events from banner campaigns.
 *
 * @note It's not always suitable for you to cover the screen every time a banner is received. You can implement optional methods to control this.
 */

NS_SWIFT_NAME(InjectorBannerDelegate)
@protocol SNRInjectorBannerDelegate

@optional

/**
 * This method is called after a banner is loaded and Synerise SDK asks for permission to show it.
 *
 * @param bannerDictionary Dictionary representation of a banner.
 */
- (BOOL)SNR_shouldBannerAppear:(NSDictionary *)bannerDictionary NS_SWIFT_NAME(snr_shouldBannerAppear(bannerDictionary:));

/**
 * This method is called after a banner appears.
 */
- (void)SNR_bannerDidAppear NS_SWIFT_NAME(snr_bannerDidAppear());

/**
 * This method is called after a banner disappears.
 */
- (void)SNR_bannerDidDisappear NS_SWIFT_NAME(snr_bannerDidDisappear());

@end

/**
 * @protocol SNRInjectorInAppMessageDelegate
 *
 * A delegate to handle events from in-app message campaigns.
 */

NS_SWIFT_NAME(InjectorInAppMessageDelegate)
@protocol SNRInjectorInAppMessageDelegate

@optional

/**
 * This method is called after an in-app message is loaded and Synerise SDK asks for permission to show it.
 *
 * @param data Model representation of the in-app message.
 */
- (BOOL)SNR_shouldInAppMessageAppear:(SNRInAppMessageData *)data NS_SWIFT_NAME(snr_shouldInAppMessageAppear(data:));

/**
 * This method is called after an in-app message appears.
 *
 * @param data Model representation of the in-app message.
 */
- (void)SNR_inAppMessageDidAppear:(SNRInAppMessageData *)data NS_SWIFT_NAME(snr_inAppMessageDidAppear(data:));

/**
 * This method is called after an in-app message disappears.
 *
 * @param data Model representation of the in-app message.
 */
- (void)SNR_inAppMessageDidDisappear:(SNRInAppMessageData *)data NS_SWIFT_NAME(snr_inAppMessageDidDisappear(data:));

/**
 * This method is called when an in-app message changes size.
 */
- (void)SNR_inAppMessageDidChangeSize:(CGRect)rect NS_SWIFT_NAME(snr_inAppMessageDidChangeSize(rect:));

/**
 * This method is called when a individual context for an in-app message is needed.
 *
 * @param data Model representation of the in-app message.
 */
- (nullable NSDictionary *)SNR_inAppMessageContextIsNeeded:(SNRInAppMessageData *)data NS_SWIFT_NAME(snr_inAppMessageContextIsNeeded(data:));

/**
 * This method is called when Synerise handles URL action from in-app messages.
 *
 * @param data Model representation of the in-app message.
 * @param url URL address value from the activity.
 */
- (void)SNR_inAppMessageHandledURLAction:(SNRInAppMessageData *)data url:(NSURL *)url NS_SWIFT_NAME(snr_inAppMessageHandledAction(data:url:));

/**
 * This method is called when Synerise handles deeplink action from in-app messages.
 *
 * @param data Model representation of the in-app message.
 * @param deeplink Literal text value from the activity.
 */
- (void)SNR_inAppMessageHandledDeeplinkAction:(SNRInAppMessageData *)data deeplink:(NSString *)deeplink NS_SWIFT_NAME(snr_inAppMessageHandledAction(data:deeplink:));

/**
 * This method is called when Synerise handles custom action from in-app messages.
 *
 * @param data Model representation of the in-app message.
 * @param name Custom action name for identification.
 * @param parameters  Custom action parameters.
 */
- (void)SNR_inAppMessageHandledCustomAction:(SNRInAppMessageData *)data name:(NSString *)name parameters:(NSDictionary *)parameters NS_SWIFT_NAME(snr_inAppMessageHandledCustomAction(data:name:parameters:));

@end


/**
 * @class SNRInjector
 */

NS_SWIFT_NAME(Injector)
@interface SNRInjector : NSObject

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

/**
 * Sets an object for walkthrough delegate methods.
 *
 * @param delegate An object that implements the `SNRInjectorWalkthroughDelegate` protocol.
 */
+ (void)setWalkthroughDelegate:(id<SNRInjectorWalkthroughDelegate>)delegate;

/**
 * Sets an object for banner delegate methods.
 *
 * @param delegate An object that implements the `SNRInjectorBannerDelegate` protocol.
 */
+ (void)setBannerDelegate:(id<SNRInjectorBannerDelegate>)delegate;

/**
 * Sets an object for in-app messages delegate methods.
 *
 * @param delegate An object that implements the `SNRInAppMessageDelegate` protocol.
 */
+ (void)setInAppMessageDelegate:(id<SNRInjectorInAppMessageDelegate>)delegate;

/**
 * Fetches a walkthrough.
 */
+ (void)getWalkthrough;

/**
 * Shows a walkthrough when it is loaded.
 */
+ (void)showWalkthrough;

/**
 * Checks if a walkthrough is loaded.
 */
+ (BOOL)isWalkthroughLoaded;

/**
 * Checks if walkthrough is unique compared to the previous one.
 */
+ (BOOL)isLoadedWalkthroughUnique;

/**
 * Fetches Push Notifications set for mobile campaigns.
 *
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getPushesWithSuccess:(void (^)(NSArray<NSDictionary *> *pushes))success
                     failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(getPushes(success:failure:));

@end

NS_ASSUME_NONNULL_END

