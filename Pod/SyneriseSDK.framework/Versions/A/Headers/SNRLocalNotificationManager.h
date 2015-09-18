//
//  SNRLocalNotificationManager.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 20.01.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import "SNRAbstractManager.h"

typedef void(^LocalNotificationManagerSuccessBlock)(void);
typedef void(^LocalNotificationManagerFailedBlock)(NSError *error);
typedef void(^LocalNotificationManagerRetryBlock)();

@class SNRLocalNotificationManager;

@interface SNRLocalNotificationManager : NSObject

+ (SNRLocalNotificationManager*)sharedInstance;

@property (nonatomic, strong) NSArray *beaconHints;

- (void)requestForBeaconHintsInLat:(float)latitude
                               lon:(float)longitude
                      successBlock:(LocalNotificationManagerSuccessBlock)successBlock
                    andFailedBlock:(LocalNotificationManagerFailedBlock)failedBlock;

@end
