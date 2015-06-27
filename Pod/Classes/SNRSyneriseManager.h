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

@property (nonatomic, strong, readonly) NSString *apiKey;

+ (void)provideAPIKey: (NSString*)apiKey;
+ (void)debugModeEnabled: (BOOL)enabled;
- (void)setDebugModeEnable: (BOOL)enabled;

@end
