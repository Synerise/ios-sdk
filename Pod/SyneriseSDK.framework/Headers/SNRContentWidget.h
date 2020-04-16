//
//  SNRContentWidget.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2020 Synerise. All rights reserved.
//

#import "SNRContentWidgetOptions.h"
#import "SNRContentWidgetAppearance.h"

NS_ASSUME_NONNULL_BEGIN

@class SNRContentWidget;

/**
 * @protocol SNRContentWidgetDelegate
 *
 * A protocol to handle Content Widget actions.
 */

NS_SWIFT_NAME(ContentWidgetDelegate)
@protocol SNRContentWidgetDelegate

@required

/**
 * This method is called after widget is loaded.
 */
- (void)SNR_widgetDidLoad:(SNRContentWidget *)widget NS_SWIFT_NAME(snr_widgetDidLoad(widget:));

/**
 * This method is called when an error occurs while loading.
 */
- (void)SNR_widget:(SNRContentWidget *)widget didNotLoadWithError:(NSError *)error NS_SWIFT_NAME(snr_widgetDidNotLoad(widget:error:));

/**
 * This method is called when the user clicks a widget’s item.
 */
- (void)SNR_widget:(SNRContentWidget *)widget didReceiveClickActionForModel:(SNRBaseModel *)model NS_SWIFT_NAME(snr_widgetDidReceiveClickAction(widget:model:));

@optional

/**
 * This method is called when the widget’s loading state changes.
 */
- (void)SNR_widget:(SNRContentWidget *)widget isLoading:(BOOL)isLoading NS_SWIFT_NAME(snr_widgetIsLoading(widget:isLoading:));

/**
 * This method is called when the widget’s size changes.
 */
- (void)SNR_widget:(SNRContentWidget *)widget didChangeToSize:(CGSize)size NS_SWIFT_NAME(snr_widgetDidChangeSize(widget:size:));

@end

/**
 * @class SNRContentWidget
 */

NS_SWIFT_NAME(ContentWidget)
@interface SNRContentWidget : NSObject

@property (strong, nonatomic, nonnull, readonly) SNRContentWidgetOptions *options;
@property (strong, nonatomic, nonnull, readonly) SNRContentWidgetAppearance *appearance;

@property (weak, nonatomic, nullable, readwrite) id<SNRContentWidgetDelegate> delegate;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

/**
 * Creates widget instance.
 *
 * @param options SNRContentWidgetOptions object providing business logic parameters for widget.
 * @param appearance SNRContentWidgetAppearance object providing appearance parameters for widget.
 */
- (instancetype)initWithOptions:(SNRContentWidgetOptions *)options andAppearance:(SNRContentWidgetAppearance *)appearance NS_SWIFT_NAME(init(options:appearance:));

/**
 * Starts operation of fetching data and creates view structure of widget.
 *
 * @note When you call this method, be aware that widget will notify you about the progress by SNRContentWidgetDelegate methods.
 */
- (void)load;

/**
 * Checks whether widget is loaded with success.
 */
- (BOOL)isLoaded;

/**
 * Gets root view of whole widget view structure.
 *
 * @note You should remember that default size of widget equals zero for width and height.
 * You have to set size of this view or add suitable layout constraints for it. Whole view structure of Widget is flexible for dimension that you need.
 */
- (UIView *)getView;

@end

NS_ASSUME_NONNULL_END
