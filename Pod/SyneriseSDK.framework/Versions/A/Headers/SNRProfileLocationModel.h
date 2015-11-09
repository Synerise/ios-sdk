//
//  SRProfileLocationModel.h
//  SyneriseBeacon
//
//  Created by Milosz Balus on 11.02.2015.
//  Copyright (c) 2015 Humanoit Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNRProfileLocationModel : NSObject <NSCopying>

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *postalCode;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *lat;
@property (nonatomic, strong) NSString *lng;
@property (nonatomic, strong) NSString *website;
@property (nonatomic, strong) NSString *region;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *locationDescription;
@property (nonatomic, strong) NSString *logoMobile;
@property (nonatomic, strong) NSString *logoWebsite;
@property (nonatomic, strong) NSString *distance;
@property (nonatomic, strong) NSString *openWorkdaysFrom;
@property (nonatomic, strong) NSString *openWorkdaysTo;
@property (nonatomic, strong) NSString *openSaturdayFrom;
@property (nonatomic, strong) NSString *openSaturdayTo;
@property (nonatomic, strong) NSString *openSundayFrom;
@property (nonatomic, strong) NSString *openSundayTo;
@property (nonatomic, assign) NSInteger locationIdent;


- (id)initWithId:(NSNumber*)id
        name:(NSString*)name
        address:(NSString*) address
        city:(NSString*) city
        postalCode:(NSString*) postalCode
        phone:(NSString*) phone
        email:(NSString*) email
        lat:(NSString*) lat
        lng:(NSString*) lng
        website:(NSString*) website
        region:(NSString*) region
        country:(NSString*) country
        locationDescription:(NSString*) locationDescription
        logoMobile:(NSString*) logoMobile
        logoWebsite:(NSString*) logoWebsite
        distance:(NSString*) distance
        openWorkdaysFrom:(NSString*) openWorkdaysFrom
        openWorkdaysTo:(NSString*) openWorkdaysTo
        openSaturdayFrom:(NSString*) openSaturdayFrom
        openSaturdayTo:(NSString*) openSaturdayTo
        openSundayFrom:(NSString*) openSundayFrom
        openSundayTo:(NSString*) openSundayTo
        locationIdent:(NSInteger) locationIdent;

@end