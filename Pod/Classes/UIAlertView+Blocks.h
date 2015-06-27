//
//  UIAlertView+Blocks.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 30.12.2014.
//  Copyright (c) 2014 HG Intelligence. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^UIAlertViewActionBlock)(void);

@interface UIAlertView (Blocks) <UIAlertViewDelegate>

- (void)addBlock:(UIAlertViewActionBlock)block;
- (void)addBlock:(UIAlertViewActionBlock)block forButtonIndex:(NSInteger)index;

@end