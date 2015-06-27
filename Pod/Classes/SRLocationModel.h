//
//  SRLocationModel.h
//  SyneriseBeacon
//
//  Created by Milosz Balus on 25.01.2015.
//  Copyright (c) 2015 Humanoit Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRLocationModel : NSObject <NSCopying>

@property (nonatomic, assign) NSInteger locationId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *postal_code;
@property (nonatomic, strong) NSString *lat;
@property (nonatomic, strong) NSString *lng;
@property (nonatomic, strong) NSData   *promotion_id;


- (id)initWithId:(NSInteger)locationId
            name:(NSString*)name
         address:(NSString*)address
            city:(NSString*)city
           state:(NSString*)state
     postal_code:(NSString*)postal_code
             lat:(NSString*)lat
             lng:(NSString*)lng
    promotion_id:(NSData*)promotion_id;

@end
