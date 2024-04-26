//
//  SNRContentWidgetHorizontalSliderLayout.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRContentWidgetLayout.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRContentWidgetHorizontalSliderLayout
 */

NS_SWIFT_NAME(ContentWidgetHorizontalSliderLayout)
@interface SNRContentWidgetHorizontalSliderLayout : SNRContentWidgetLayout

@property (assign, nonatomic, readwrite) CGFloat itemSpacing;

/**
 * Gets content size of Widget.
 */
- (CGSize)getSize NS_SWIFT_NAME(getSize());

@end

NS_ASSUME_NONNULL_END
