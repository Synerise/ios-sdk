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

/**
 *  Disptach push notyfication
 *
 */
- (void)pushNotificationHandleResult:(id)result andFetchType:(FetchedResultsType)fetchType;

@end

@interface SNRPushNotificationManager : SNRAbstractManager

/**
 *  Delegate
 */
@property (assign, nonatomic) id <SNRPushNotificationManagerDelegate> delegate;


/**
 *  Device token
 *
 *  @param deviceToken <#deviceToken description#>
 */
-(void) setDeviceToken:(NSData*)deviceToken;


/**
 *  Handler for recive remote notyfication
 */
-(void) receiveRemoteNotificationWithUserInfo:(NSDictionary*)userInfo
                                startDispatch:(BOOL)dispatch;



/**
 *  Register device to push notyfication
 */
-(void) registerToReceivePushNotification;


/**
 *  Resume receive user info
 */
-(void)resumeDispatch;


@end
