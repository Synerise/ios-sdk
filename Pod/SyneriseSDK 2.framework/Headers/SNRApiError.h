//
//  SNRApiError.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2020 Synerise. All rights reserved.
//

#import "SNRError.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @enum SNRApiErrorType
 */

typedef NS_ENUM(NSInteger, SNRApiErrorType) {
    SNRApiErrorTypeUnknown,
    SNRApiErrorTypeNetwork,
    SNRApiErrorTypeUnauthorizedSession,
    SNRApiErrorTypeHttp
    
} NS_SWIFT_NAME(SNRApiErrorType);

/**
 * @class SNRApiError
 */

@interface SNRApiError : SNRError

@property (strong, nonatomic, nullable, readonly) NSArray<SNRError *> *errors;

- (instancetype)initWithDomain:(NSErrorDomain)domain
                          code:(NSInteger)code
                      userInfo:(nullable NSDictionary<NSString *, id> *)userInfo
                        errors:(nullable NSArray *)errors;

- (SNRApiErrorType)getType;
- (NSInteger)getHttpCode;
- (nullable NSString *)getBody;

@end

NS_ASSUME_NONNULL_END
