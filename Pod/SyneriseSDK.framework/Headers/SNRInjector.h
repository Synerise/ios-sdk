//
//  SNRInjector.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

/**
 * A protocol to handle events from Injector for Walkthrough campaigns.
 *
 * When you choose to load and present Walkthrough manually, you may be interested in following delegate methods.
 *
 * Note, that all these methods are optional and implementing them is not required. These are also called when Walkthrough was loaded automatically.
 */
NS_SWIFT_NAME(InjectorWalkthroughDelegate)
@protocol SNRInjectorWalkthroughDelegate

@optional

/**
 * This method will be called when Walkthrough has been loaded.
 */
- (void)SNR_walkthroughDidLoad NS_SWIFT_NAME(snr_walkthroughDidLoad());

/**
 * This method will be called when an error occured while Walkthrough loading.
 */
- (void)SNR_walkthroughLoadingError:(NSError* _Nonnull)error NS_SWIFT_NAME(snr_walkthroughLoadingError(error:));

/**
 * This method will be called when Walkthrough has been appeared.
 */
- (void)SNR_walkthroughDidAppear NS_SWIFT_NAME(snr_walkthroughDidAppear());

/**
 * This method will be called when Walkthrough has been disappeared.
 */
- (void)SNR_walkthroughDidDisappear NS_SWIFT_NAME(snr_walkthroughDidDisappear());

@end


/**
 * A protocol to handle events from Injector for banner campaigns.
 *
 * It is not always suitable for you to cover your Activities with any banners which may come.
 * Fortunately, we have put this into deep consideration and as for now, we'd like to present our optional banner delegate methods.
 */
NS_SWIFT_NAME(InjectorBannerDelegate)
@protocol SNRInjectorBannerDelegate

@optional

/**
 * This method will be called when Banner has been loaded and SyneriseSDK asks for permission to show it.
 */
- (BOOL)SNR_shouldBannerAppear NS_SWIFT_NAME(snr_shouldBannerAppear());

/**
 * This method will be called when Banner has been appeared.
 */
- (void)SNR_bannerDidAppear NS_SWIFT_NAME(snr_bannerDidAppear());

/**
 * This method will be called when Banner has been disappeared.
 */
- (void)SNR_bannerDidDisappear NS_SWIFT_NAME(snr_bannerDidDisappear());

@end


/**
* SNRInjector is responsible for intergration with Synerise mobile content methods.
*/
NS_SWIFT_NAME(Injector)
@interface SNRInjector : NSObject

NS_ASSUME_NONNULL_BEGIN

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

/**
 * Enables/disables console logs from SNRInjector.
 *
 * @note It is not recommended to use debug mode in release version of your application.
 *
 * @param enabled Enables/disables console logs.
 */
+ (void)setLoggingEnabled:(BOOL)enabled;

/**
 * Enables/disables automatic for SNRInjector.
 *
 * @param automatic enables/disables automatic.
 */
+ (void)setAutomatic:(BOOL)automatic;

/**
 * Initializes SNRInjector.
 *
 * @note This method needs to be called before any other method of SNRInjector class and only once during application lifecycle.
 *
 * @param apiKey Synerise API Key for Business Profile.
 */
+ (void)initialize:(NSString *)apiKey;

/**
 * This method sets object for Walkthrough delegate methods.
 *
 * @param delegate object that implement SNRInjectorWalkthroughDelegate protocol.
 */
+ (void)setWalkthroughDelegate:(id<SNRInjectorWalkthroughDelegate>)delegate;

/**
 * This method sets object for Banner delegate methods.
 *
 * @param delegate object that implement SNRInjectorBannerDelegate protocol.
 */
+ (void)setBannerDelegate:(id<SNRInjectorBannerDelegate>)delegate;

/**
 * Fetches Walkthrough.
 */
+ (void)getWalkthrough;

/**
 * Shows Walkthrough when it is loaded.
 */
+ (void)showWalkthrough;

/**
 * Checks that Walkthrough is loaded.
 */
+ (BOOL)isWalkthroughLoaded;

/**
 * Checks that Walkthrough is unique than previous one.
 */
+ (BOOL)isLoadedWalkthroughUnique;

NS_ASSUME_NONNULL_END

@end
