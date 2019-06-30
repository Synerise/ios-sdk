//
//  SNRContentWidgetGridLayout.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2019 Synerise. All rights reserved.
//

#import "SNRContentWidgetLayout.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRContentWidgetGridLayout
 */

NS_SWIFT_NAME(ContentWidgetGridLayout)
@interface SNRContentWidgetGridLayout : SNRContentWidgetLayout

@property (assign, nonatomic, readwrite) CGFloat itemHorizontalSpacing;
@property (assign, nonatomic, readwrite) CGFloat itemVerticalSpacing;

/**
 * Gets content size of Widget for your given preffered width.
 */
- (CGSize)getSizeForPrefferedWidth:(CGFloat)prefferedWidth NS_SWIFT_NAME(getSize(prefferedWidth:));

@end

NS_ASSUME_NONNULL_END
