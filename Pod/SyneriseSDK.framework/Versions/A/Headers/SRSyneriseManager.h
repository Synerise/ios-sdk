//
//  SRSyneriseManager.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 24.06.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SRAbstractManager.h"

@interface SRSyneriseManager : SRAbstractManager

@property (nonatomic, strong, readonly) NSString *apiKey;

+ (void)provideAPIKey: (NSString*)apiKey;

@end
