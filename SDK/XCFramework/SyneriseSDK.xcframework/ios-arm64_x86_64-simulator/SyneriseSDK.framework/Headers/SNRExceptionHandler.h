// 
//  SNRExceptionHandler.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2024 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRExceptionHandler
 */

@interface SNRExceptionHandler : NSObject

+ (BOOL)catchException:(void(^)(void))tryBlock error:(NSError **)error;

@end

NS_ASSUME_NONNULL_END
