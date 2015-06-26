//
//  SRLocationManager.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 25.01.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNRAbstractManager.h"
#import "SNRLocationModel.h"

typedef void(^LocationManagerSuccessBlock)(void);
typedef void(^LocationManagerFailedBlock)(NSError *error, UIAlertView *alertView);
typedef void(^LocationManagerRetryBlock)();

@interface SNRLocationManager : SNRAbstractManager

@property (nonatomic, strong) NSArray *locations;
@property (nonatomic, strong) SNRLocationModel *selectedLocation;

- (void)locationListForPromotionId:(NSInteger)promotionId
                      successBlock:(LocationManagerSuccessBlock)successBlock
                             retryBlock:(LocationManagerRetryBlock)retryBlock
                         andFailedBlock:(LocationManagerFailedBlock)failedBlock;


@end
