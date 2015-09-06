//
//  SRSyneriseManager.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 24.06.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNRAbstractManager.h"

@interface SNRSyneriseManager : SNRAbstractManager


#pragma mark properties
/**
 *  Synerise API Key
 */
@property (nonatomic, strong, readonly) NSString *apiKey;


/**
 *  Set API Key
 *
 *  @param apiKey
 */
+ (void)provideAPIKey: (NSString*)apiKey;

/**
 *  Switch on debug mode
 *
 *  @param enabled
 */
+ (void)debugModeEnabled: (BOOL)enabled;



@end
