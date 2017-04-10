//
//  SRPromotionModel+JSON.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 12.01.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNRBeaconHintModel.h"

@interface SNRBeaconHintModel(JSON)

+ (id)dataFromJSONDictionary:(NSDictionary*)json;
+ (NSArray*)beaconWithHintsListFromJSONDictionary:(NSDictionary*)jsonDict;

@end



