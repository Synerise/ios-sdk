//
//  SNRInjector.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2021 Synerise. All rights reserved.
//

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
 * Provides valid banners directly from SDK cache.
 */
+ (NSArray<NSDictionary *> *)getBanners;

/**
 * Fetches banners set for mobile campaigns and caches valid ones.
 *
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)fetchBannersWithSuccess:(void (^)(NSArray<NSDictionary *> *banners))success
                        failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(fetchBanners(success:failure:));

/**
 * Fetches Push Notifications set for mobile campaigns.
 *
 * @param success A block object to be executed when the operation finishes successfully.
 * @param failure A block object to be executed when the operation finishes unsuccessfully.
 */
+ (void)getPushesWithSuccess:(void (^)(NSArray<NSDictionary *> *pushes))success
                     failure:(void (^)(NSError *error))failure NS_SWIFT_NAME(getPushes(success:failure:));

/**
 * Shows a banner immediately.
 *
 * @param bannerDictionary Dictionary representation of a banner.
 * @param markPresented Sets a banner as presented and this banner instance representation will not appear again.
 */
+ (void)showBanner:(NSDictionary *)bannerDictionary
     markPresented:(BOOL)markPresented NS_SWIFT_NAME(showBanner(_:markPresented:));

@end

NS_ASSUME_NONNULL_END

