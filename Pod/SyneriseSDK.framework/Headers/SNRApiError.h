//
//  SNRApiError.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2021 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRError.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @enum SNRApiErrorType
 */

typedef NS_ENUM(NSInteger, SNRApiErrorType) {
    SNRApiErrorTypeUnknown,
    SNRApiErrorTypeNetwork,
    SNRApiErrorTypeUnauthorizedSession,
    SNRApiErrorTypeHttp
};

/**
 * @class SNRApiError
 */

@interface SNRApiError : SNRError

@property (strong, nonatomic, nullable, readonly) NSArray<SNRError *> *errors;

- (instancetype)initWithDomain:(NSErrorDomain)domain
                          code:(NSInteger)code
                     internalErrorCode:(nullable NSString *)internalErrorCode
                      userInfo:(nullable NSDictionary<NSString *, id> *)userInfo
                        errors:(nullable NSArray<SNRError *> *)errors;

- (SNRApiErrorType)getType;
- (NSInteger)getHttpCode;
- (nullable NSString *)getErrorCode;
- (nullable NSString *)getBody;

@end

NS_ASSUME_NONNULL_END
