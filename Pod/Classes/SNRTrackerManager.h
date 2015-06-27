//
//  SRTrackerManager.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 23.02.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNRAbstractManager.h"

typedef void(^TrackerManagerSuccessBlock)(void);
typedef void(^TrackerManagerFailedBlock)(NSError *error, UIAlertView *alertView);
typedef void(^TrackerManagerRetryBlock)();

@interface SNRTrackerManager : SNRAbstractManager

@property (strong, nonatomic, readonly) NSString *uniqueDeviceId;
@property (strong, nonatomic, readonly) NSString *deviceToken;

/**
 *  Create event for tracking user screen activity
 */
- (void)createBeaconEventWithUUID:(NSString*)uuid
                            major:(NSNumber*)major
                            minor:(NSNumber*)minor
                     andProximity:(NSString*)proximity;


/**
 *  Traking used with beacon activity
 */
- (void)createEventWithCategory:(NSString*)category
                         action:(NSString*)action
                          label:(NSString*)label
                         params:(NSDictionary*)params;

/**
 *  Add device in order to receive push messages
 *
 */
- (void)addDevice:(NSData*)token;


@end
