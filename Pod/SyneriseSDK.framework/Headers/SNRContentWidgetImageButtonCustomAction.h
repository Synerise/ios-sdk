//
//  SNRContentWidgetImageButtonCustomAction.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2019 Synerise. All rights reserved.
//

#import "SNRContentWidgetBaseCustomAction.h"

typedef void (^SNRContentWidgetImageButtonCustomActionReceiveClickActionBlock)(SNRBaseModel * _Nullable model, BOOL isSelected);
typedef BOOL (^SNRContentWidgetImageButtonCustomActionIsSelectedBlock)(SNRBaseModel * _Nullable model);

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(ContentWidgetImageButtonCustomAction)
@interface SNRContentWidgetImageButtonCustomAction : SNRContentWidgetBaseCustomAction

@property (assign, nonatomic, readwrite) CGSize size;

@property (strong, nonatomic, nullable, readwrite) UIColor *backgroundColor;
@property (strong, nonatomic, nullable, readwrite) UIColor *tintColor;
@property (strong, nonatomic, nullable, readwrite) UIImage *image;

@property (assign, nonatomic, readwrite) BOOL isSelectable;
@property (strong, nonatomic, nullable, readwrite) UIImage *selectedImage;
@property (strong, nonatomic, nullable, readwrite) SNRContentWidgetImageButtonCustomActionIsSelectedBlock isSelected;

@property (strong, nonatomic, nullable, readwrite) SNRContentWidgetImageButtonCustomActionReceiveClickActionBlock onReceiveClickAction;

@end

NS_ASSUME_NONNULL_END
