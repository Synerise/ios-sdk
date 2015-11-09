//
//  SRProfileLocations.h
//  SyneriseBeacon
//
//  Created by Milosz Balus on 11.02.2015.
//  Copyright (c) 2015 Humanoit Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNRAbstractManager.h"

typedef void(^ProfileLocationManagerSuccessBlock)(void);
typedef void(^ProfileLocationManagerFailedBlock)(NSError *error, UIAlertView *alertView);
typedef void(^ProfileLocationManagerRetryBlock)();

@interface SNRProfileLocationsManager : SNRAbstractManager

@property (nonatomic, strong) NSArray *locations;
@property (nonatomic, strong) NSArray *filteredLocations;


- (void)filterLocationByAvail:(NSArray*)filter
                 successBlock:(ProfileLocationManagerSuccessBlock)successBlock
               andFailedBlock:(ProfileLocationManagerFailedBlock)failedBlock;

- (void)getListLocationWithLatitude:(NSString*)latitude
                          longitude:(NSString*)longitude
                        maxDistance:(NSNumber*)maxDistance
                              limit:(NSNumber*)limit
                             offset:(NSNumber*)offset
                       successBlock:(ProfileLocationManagerSuccessBlock)successBlock
                         retryBlock:(ProfileLocationManagerRetryBlock)retryBlock
                     andFailedBlock:(ProfileLocationManagerFailedBlock)failedBlock;


@end
