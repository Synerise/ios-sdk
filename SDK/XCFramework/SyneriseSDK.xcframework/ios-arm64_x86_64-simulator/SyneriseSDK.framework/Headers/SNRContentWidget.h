//
//  SNRContentWidget.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRContentWidgetOptions.h>
#import <SyneriseSDK/SNRContentWidgetAppearance.h>

NS_ASSUME_NONNULL_BEGIN

@class SNRContentWidget;
@class SNRContentWidgetItemLayout;
@class SNRContentWidgetItemLayoutDataModel;

/**
 * @protocol SNRContentWidgetDelegate
 *
 * A delegate to handle Content Widget actions.
 */

NS_SWIFT_NAME(ContentWidgetDelegate)
@protocol SNRContentWidgetDelegate

@required

/**
 * This method is called after a widget is loaded.
 *
 * @param widget The widget instance that called the delegate method.
 */
- (void)SNR_widgetDidLoad:(SNRContentWidget *)widget NS_SWIFT_NAME(snr_widgetDidLoad(widget:));

/**
 * This method is called when an error occurs while loading a widget.
 *
 * @param widget The widget instance that called the delegate method.
 * @param error  The error that occurred.
 */
- (void)SNR_widget:(SNRContentWidget *)widget didNotLoadWithError:(NSError *)error NS_SWIFT_NAME(snr_widgetDidNotLoad(widget:error:));

/**
 * This method is called when the user clicks a widget’s item.
 *
 * @param widget The widget instance that called the delegate method.
 * @param model The model's object that was clicked.
 */
- (void)SNR_widget:(SNRContentWidget *)widget didReceiveClickActionForModel:(SNRBaseModel *)model NS_SWIFT_NAME(snr_widgetDidReceiveClickAction(widget:model:));

@optional

/**
 * This method is called when the widget’s loading state changes.
 *
 * @param widget The widget instance that called the delegate method.
 * @param isLoading Widget's loading state.
 */
- (void)SNR_widget:(SNRContentWidget *)widget isLoading:(BOOL)isLoading NS_SWIFT_NAME(snr_widgetIsLoading(widget:isLoading:));

/**
 * This method is called when the widget’s size changes.
 *
 * @param widget The widget instance that called the delegate method.
 * @param size Widget's new size.
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
 * Creates a widget instance.
 *
 * @param options `SNRContentWidgetOptions` object providing widget business logic parameters.
 * @param appearance `SNRContentWidgetAppearance` object providing widget appearance parameters.
 */
- (instancetype)initWithOptions:(SNRContentWidgetOptions *)options andAppearance:(SNRContentWidgetAppearance *)appearance NS_SWIFT_NAME(init(options:appearance:));

/**
 * Starts fetching data and creates the view structure of a widget.
 *
 * @note When you call this method, the widget will notify you about the progress by
 *       `SNRContentWidgetDelegate` methods.
 */
- (void)load;

/**
 * Checks if a widget is loaded successfully.
 */
- (BOOL)isLoaded;

/**
 * Gets root view of the whole widget view structure.
 *
 * @note The default size of a widget equals zero for width and height.
 *       You must set the size of this view or add suitable layout constraints for it.
 *       The whole view structure of a widget is flexible for dimensions that you need.
 */
- (UIView *)getView;

@end

NS_ASSUME_NONNULL_END
