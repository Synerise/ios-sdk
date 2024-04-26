//
//  SNRContentWidgetBadgeDataModel.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRContentWidgetBadgeDataModel
 */

NS_SWIFT_NAME(ContentWidgetBadgeDataModel)
@interface SNRContentWidgetBadgeDataModel : NSObject

@property (copy, nonatomic, nonnull, readwrite) UIColor *backgroundColor;
@property (copy, nonatomic, nonnull, readwrite) UIColor *textColor;
@property (copy, nonatomic, nonnull, readwrite) NSString *text;


+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithBackgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor text:(NSString *)text NS_SWIFT_NAME(init(backgroundColor:textColor:text:));

@end

NS_ASSUME_NONNULL_END
