//
//  SRPushNotificationManager.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 12.06.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNRAbstractManager.h"

@class SNRPushNotificationManager;

typedef enum NSFetchedResultsType {
    FetchedResultsAsImage = 1,
    FetchedResultsAsURL = 2,
    FetchedResultsAsPromotionScreen = 3,
    FetchedResultsAsText = 4
} FetchedResultsType;

@protocol SNRPushNotificationManagerDelegate <NSObject>

- (void)pushNotificationHandleResult:(id)result andFetchType:(FetchedResultsType)fetchType;

@end

@interface SNRPushNotificationManager : SNRAbstractManager

@property (assign, nonatomic) id <SNRPushNotificationManagerDelegate> delegate;

-(void) setDeviceToken:(NSData*)deviceToken;
-(void) receiveRemoteNotificationWithUserInfo:(NSDictionary*)userInfo
                                startDispatch:(BOOL)dispatch;
-(void) registerToReceivePushNotification;
-(void)resumeDispatch;

@end
