//
//  SNRInjector.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright © 2018 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @protocol SNRInjectorWalkthroughDelegate
 *
 * A protocol to handle events from walkthrough campaigns.
 *
 * When you choose to load and present walkthrough manually, you may be interested in following delegate methods.
 *
 * @note Note, that all these methods are optional and implementing them is not required. These are also called when walkthrough was loaded automatically.
 */

NS_SWIFT_NAME(InjectorWalkthroughDelegate)
@protocol SNRInjectorWalkthroughDelegate

@optional

/**
 * This method is called after walkthrough is loaded.
 */
- (void)SNR_walkthroughDidLoad NS_SWIFT_NAME(snr_walkthroughDidLoad());

/**
 * This method is called when an error occurs while loading walkthrough.
 */
- (void)SNR_walkthroughLoadingError:(NSError *)error NS_SWIFT_NAME(snr_walkthroughLoadingError(error:));

/**
 * This method is called after walkthrough appears.
 */
- (void)SNR_walkthroughDidAppear NS_SWIFT_NAME(snr_walkthroughDidAppear());

/**
 * This method is called after walkthrough disappears.
 */
- (void)SNR_walkthroughDidDisappear NS_SWIFT_NAME(snr_walkthroughDidDisappear());

@end

NS_ASSUME_NONNULL_END

NS_ASSUME_NONNULL_BEGIN

/**
 * @protocol SNRInjectorBannerDelegate
 *
 * A protocol to handle events from banner campaigns.
 *
 * It is not always suitable for you to cover the screen every time a banner is received.
 * You can implement optional methods to control this.
 *
 */

NS_SWIFT_NAME(InjectorBannerDelegate)
@protocol SNRInjectorBannerDelegate

@optional

/**
 * This method is called after banner is loaded and Synerise SDK asks for permission to show it.
 *
 * @param bannerDictionary Dictionary representation of banner.
 */
- (BOOL)SNR_shouldBannerAppear:(NSDictionary *)bannerDictionary NS_SWIFT_NAME(snr_shouldBannerAppear(bannerDictionary:));

/**
 * This method is called after banner appears.
 */
- (void)SNR_bannerDidAppear NS_SWIFT_NAME(snr_bannerDidAppear());

/**
 * This method is called when banner disappears.
 */
- (void)SNR_bannerDidDisappear NS_SWIFT_NAME(snr_bannerDidDisappear());

@end

NS_ASSUME_NONNULL_END

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRInjector
 */

NS_SWIFT_NAME(Injector)
@interface SNRInjector : NSObject

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

/**
 * Enables/disables console logs from SNRInjector.
 *
 * @param enabled Specifies that console logs are enabled/disabled.
 *
 * @note It is not recommended to use debug mode in release version of your application.
 */
+ (void)setLoggingEnabled:(BOOL)enabled;

/**
 * Enables/disables automatic for SNRInjector.
 *
 * @param automatic Specifies that automatic mode is enabled/disabled.
 * @deprecated Deprecated in version 3.4.8
 */
+ (void)setAutomatic:(BOOL)automatic DEPRECATED_MSG_ATTRIBUTE("Use SNRSynerise.settings.injector.automatic instead.");

/**
 * Sets object for Walkthrough delegate methods.
 *
 * @param delegate An object that implement SNRInjectorWalkthroughDelegate protocol.
 */
+ (void)setWalkthroughDelegate:(id<SNRInjectorWalkthroughDelegate>)delegate;

/**
 * Sets object for Banner delegate methods.
 *
 * @param delegate An object that implement SNRInjectorBannerDelegate protocol.
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

/**
 * Provides valid banners right from SDK cache.
 */
+ (NSArray<NSDictionary *> *)getBanners;

/**
 * Fetches banners set for mobile campaigns and caches valid ones.
 *
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)fetchBannersWithSuccess:(nullable void (^)(NSArray<NSDictionary *> *banners))success
                        failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(fetchBanners(success:failure:));

/**
 * Fetches Push Notifications set for mobile campaigns.
 *
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getPushesWithSuccess:(nullable void (^)(NSArray<NSDictionary *> *pushes))success
                     failure:(nullable void (^)(NSError *error))failure NS_SWIFT_NAME(getPushes(success:failure:));

/**
 * Shows banner immediately.
 *
 * @param bannerDictionary Dictionary representation for banner.
 * @param markPresented Sets banner as presented and this banner instance representation will not appear second time.
 */
+ (void)showBanner:(NSDictionary *)bannerDictionary
     markPresented:(BOOL)markPresented NS_SWIFT_NAME(showBanner(_:markPresented:));

@end

NS_ASSUME_NONNULL_END

