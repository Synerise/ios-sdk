//
//  SNRClientUpdateAccountContext.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "SNRBaseContext.h"

@class SNRClientSex;

NS_SWIFT_NAME(ClientUpdateAccountContext)
@interface SNRClientUpdateAccountContext : SNRBaseContext

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
