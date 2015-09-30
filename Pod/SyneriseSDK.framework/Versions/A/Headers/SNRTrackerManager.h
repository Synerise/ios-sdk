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

@interface SNRTrackerManager : NSObject

+ (SNRTrackerManager*)sharedInstance;

@property (strong, nonatomic, readonly) NSString *uniqueDeviceId;

@property (strong, nonatomic, readonly) NSString *deviceToken;

/**
 *  Set events flush buffer size.
 *  30 is default value.
 *
 */
@property (assign, nonatomic) NSUInteger flushBufforSize;


/**
 * Set the dispatch interval in seconds.
 * 60 seconds is the default value.
 *
 */
@property (nonatomic) float dispatchInterval;


-(void)customIdentify:(NSString*)identify;

/**
 *  Register device in Synerise for Push Messages purpose.
 *
 */
- (void)addDevice:(NSData*)token;


/**
 *  Tracking custom event in application like button press, submit forms etc.
 */
-(void)trackEvent:(NSString*)eventName withParams:(id)params;


/**
 *  Track iBeacon events.
 */
-(void)trackEventBeaconWithUUID:(NSString*)uuid
                          major:(NSNumber*)major
                          minor:(NSNumber*)minor
                   andProximity:(NSString*)proximity;

/**
 *  Traking screen visit.
 */
-(void)trackScreen:(NSString*)screenName withParams:(id)params;


/**
 *  Provide tracker with Client custom properties and data.
 */
-(void)client:(NSDictionary*)clientData;

/**
 *  Set geolocation for device. You can use this for geofencing features in Synerise.
 */
-(void)setLatitude:(float)latitude
         longitude:(float)longitude
horizontalAccuracy:(float)hAccuracy
  verticalAccuracy:(float)vAccuracy;

/**
 *  Create pure event.
 */
-(void)event:(NSString*)category
      action:(NSString*)action
       label:(NSString*)label
  withParams:(NSDictionary*)params;


/**
 *  Flush all events
 */
-(void) forceFlushEvents;


@end
