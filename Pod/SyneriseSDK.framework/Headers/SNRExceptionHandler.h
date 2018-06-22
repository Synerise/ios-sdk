// 
//  SNRExceptionHandler.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNRExceptionHandler : NSObject

+ (BOOL)catchException:(void(^)(void))tryBlock error:(__autoreleasing NSError **)error;

@end
