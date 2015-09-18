//
//  SNRBeaconManager.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 26.06.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@class SNRBeaconManager;

@protocol SNRBeaconManagerDelegate <NSObject>

/*
 *  locationManager:didEnterRegion:
 *
 *  Discussion:
 *    Invoked when the user enters a monitored region.  This callback will be invoked for every allocated
 *    CLLocationManager instance with a non-nil delegate that implements this method.
 */
- (void)locationManager:(CLLocationManager *)manager
        didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region;


/*
 *  locationManager:didExitRegion:
 *
 *  Discussion:
 *    Invoked when the user exits a monitored region.  This callback will be invoked for every allocated
 *    CLLocationManager instance with a non-nil delegate that implements this method.
 */
- (void)locationManager:(CLLocationManager *)manager
         didEnterRegion:(CLRegion *)region;

/*
 *  locationManager:didRangeBeacons:inRegion:
 *
 *  Discussion:
 *    Invoked when a new set of beacons are available in the specified region.
 *    beacons is an array of CLBeacon objects.
 *    If beacons is empty, it may be assumed no beacons that match the specified region are nearby.
 *    Similarly if a specific beacon no longer appears in beacons, it may be assumed the beacon is no longer received
 *    by the device.
 */
- (void)locationManager:(CLLocationManager *)manager
          didExitRegion:(CLRegion *)region;

- (void) locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLBeaconRegion *)region;


@end


@interface SNRBeaconManager : NSObject <CLLocationManagerDelegate>

+ (SNRBeaconManager*)sharedInstance;

#pragma mark - class methods

+ (BOOL)isBeaconMonitoringEnabled;

#pragma mark - properties

@property (assign, nonatomic, readwrite) id <SNRBeaconManagerDelegate> delegate;


#pragma mark - public methods

-(void)addRegions:(NSArray *)regions;

-(void)startMonitoring;

-(void)stopMonitoring;


@end
