// 
//  SNRExceptionHandler.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

@interface SNRExceptionHandler : NSObject

+ (BOOL)catchException:(nonnull void(^)(void))tryBlock error:(__autoreleasing NSError * _Nonnull *)error;

@end
