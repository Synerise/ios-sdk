//
//  SRAbstractManager.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 24.06.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

typedef void(^APIErrorBlock)(NSError *error);
typedef void(^APISuccessBlock)(id response);

#import <Foundation/Foundation.h>

@interface SNRAbstractManager : NSObject

+ (id)sharedInstance;

@end