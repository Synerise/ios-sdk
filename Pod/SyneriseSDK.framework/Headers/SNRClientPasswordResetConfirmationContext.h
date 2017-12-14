//
//  SNRClientPasswordResetConfirmationContext.h
//  SyneriseSDK
//
//  Created on 27/11/2017.
//  Copyright © 2017 Synerise. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SNRClientPasswordResetConfirmationContext : NSObject

@property (readonly, nonatomic, nonnull, copy) NSString *password;
@property (readonly, nonatomic, nonnull, copy) NSString *token;

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

- (instancetype)init:(NSString *)password token:(NSString *)token;

@end

NS_ASSUME_NONNULL_END
