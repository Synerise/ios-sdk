//
//  SNRApiError.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRApiError
 */

@interface SNRApiError : SNRError

@property (strong, nonatomic, nonnull, readonly) NSArray<SNRError *> *errors;

- (instancetype)initWithDomain:(NSErrorDomain)domain
                          code:(NSInteger)code
                      userInfo:(nullable NSDictionary<NSErrorUserInfoKey, id> *)dict
                        errors:(NSArray *)errors;

@end

NS_ASSUME_NONNULL_END
