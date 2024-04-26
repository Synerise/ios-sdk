//
//  SNRContentWidgetImageButtonCustomAction.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRContentWidgetBaseCustomAction.h>

typedef void (^SNRContentWidgetImageButtonCustomActionReceiveClickBlock)(SNRBaseModel * _Nullable model, BOOL isSelected);
typedef BOOL (^SNRContentWidgetImageButtonCustomActionIsSelectedBlock)(SNRBaseModel * _Nullable model);

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(ContentWidgetImageButtonCustomAction)
@interface SNRContentWidgetImageButtonCustomAction : SNRContentWidgetBaseCustomAction

@property (assign, nonatomic, readwrite) CGSize size;
@property (assign, nonatomic, readwrite) CGPoint position;

@property (strong, nonatomic, nullable, readwrite) UIColor *backgroundColor;
@property (strong, nonatomic, nullable, readwrite) UIColor *tintColor;
@property (strong, nonatomic, nullable, readwrite) UIImage *image;

@property (assign, nonatomic, readwrite) BOOL isSelectable;
@property (strong, nonatomic, nullable, readwrite) UIImage *selectedImage;
@property (strong, nonatomic, nullable, readwrite) SNRContentWidgetImageButtonCustomActionIsSelectedBlock isSelected;

@property (strong, nonatomic, nullable, readwrite) SNRContentWidgetImageButtonCustomActionReceiveClickBlock onReceiveClick;

@end

NS_ASSUME_NONNULL_END
