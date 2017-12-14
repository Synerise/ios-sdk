//
//  SNRClientPasswordResetRequestContext.h
//  SyneriseSDK
//
//  Created on 27/11/2017.
//  Copyright © 2017 Synerise. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SNRClientPasswordResetRequestContext : NSObject

@property (readonly, nonatomic, nonnull, copy) NSString *email;

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

- (instancetype)init:(NSString *)email;

@end

NS_ASSUME_NONNULL_END
