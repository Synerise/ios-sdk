// 
//  SNRException.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

@class SNRError;

NS_ASSUME_NONNULL_BEGIN

@interface SNRException : NSException

@property (strong, nonatomic, nonnull, readwrite) SNRError *error;

+ (void)throwException:(NSExceptionName)exceptionName reason:(NSString *)reason;

@end

NS_ASSUME_NONNULL_END