//
//  SNRApiError.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

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

@interface SNRApiError : NSError

@property (strong, nonatomic, nullable, readonly) NSArray<NSError *> *errors;

- (instancetype)initWithDomain:(NSErrorDomain)domain
                          code:(NSInteger)code
                      userInfo:(nullable NSDictionary<NSErrorUserInfoKey, id> *)dict
                        errors:(nullable NSArray *)errors;

- (SNRApiErrorType)getType;
- (NSInteger)getHttpCode;
- (nullable NSString *)getBody;

@end

NS_ASSUME_NONNULL_END
