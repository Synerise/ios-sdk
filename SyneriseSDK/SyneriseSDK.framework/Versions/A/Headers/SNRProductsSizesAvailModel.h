//
//  SRProductsSizesAvailModel.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 14.02.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNRProductsSizesAvailModel : NSObject <NSCopying>

@property (nonatomic, strong) NSString *size;

- (id)initWithId:(NSString*)size;

@end