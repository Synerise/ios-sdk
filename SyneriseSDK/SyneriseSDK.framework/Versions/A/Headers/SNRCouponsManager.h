//
//  SRCouponsManager.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 23.03.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SNRAbstractManager.h"

typedef void(^CouponManagerSuccessBlock)(void);
typedef void(^CouponManagerFailedBlock)(NSError *error, UIAlertView *alertView);
typedef void(^CouponManagerRetryBlock)();

@interface SNRCouponsManager : SNRAbstractManager

@property (nonatomic, strong) NSArray *coupons;

- (void)getCouponDetailWithUUID:(NSString*)uuid
                  successBlock:(CouponManagerSuccessBlock)successBlock
                    retryBlock:(CouponManagerRetryBlock)retryBlock
                andFailedBlock:(CouponManagerFailedBlock)failedBlock;

- (void)getCouponsWithLimit:(NSNumber*)limit
                    offset:(NSNumber*)offset
              successBlock:(CouponManagerSuccessBlock)successBlock
                retryBlock:(CouponManagerRetryBlock)retryBlock
            andFailedBlock:(CouponManagerFailedBlock)failedBlock;

- (void)startClientCouponWithUUID:(NSString*)uuid
                    successBlock:(CouponManagerSuccessBlock)successBlock
                      retryBlock:(CouponManagerRetryBlock)retryBlock
                  andFailedBlock:(CouponManagerFailedBlock)failedBlock;


- (void)activeCouponWithUUID:(NSString*)uuid
                successBlock:(CouponManagerSuccessBlock)successBlock
              andFailedBlock:(CouponManagerFailedBlock)failedBlock;

@end
