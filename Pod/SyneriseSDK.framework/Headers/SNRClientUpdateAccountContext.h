//
//  SNRClientUpdateAccountContext.h
//  SyneriseSDK
//
//  Created on 27/11/2017.
//  Copyright © 2017 Synerise. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SNRClientSex;

@interface SNRClientUpdateAccountContext : NSObject

@property (nonatomic, nullable, copy) NSString *address;
@property (nonatomic, nullable, copy) NSDate *birthDate;
@property (nonatomic, nullable, copy) NSString *city;
@property (nonatomic, nullable, copy) NSString *company;
@property (nonatomic, nullable, copy) NSString *countryCode;
@property (nonatomic, nullable, copy) NSString *displayName;
@property (nonatomic, nullable, copy) NSString *firstName;
@property (nonatomic, nullable, copy) NSString *lastName;
@property (nonatomic, nullable, copy) NSString *phoneNumber;
@property (nonatomic, nullable, copy) NSString *province;
@property (nonatomic, nullable, copy) SNRClientSex *sex;
@property (nonatomic, nullable, copy) NSString *zipCode;

@end
