//
//  SNRProfileCreateClientContext.h
//  SyneriseSDK
//
//  Created on 27/11/2017.
//  Copyright © 2017 Synerise. All rights reserved.
//

#import "SNRBaseContext.h"
#import "SNRClientAgreementsContext.h"
#import "SNRClientSex.h"

@interface SNRCreateClientContext : SNRBaseContext

@property (nonatomic, nullable, copy) NSString *email;
@property (nonatomic, nullable, copy) NSString *phone;
@property (nonatomic, nullable, copy) NSString *customId;
@property (nonatomic, nullable, copy) NSString *firstName;
@property (nonatomic, nullable, copy) NSString *lastName;
@property (nonatomic, nullable, copy) NSString *displayName;
@property (nonatomic, nullable, copy) NSUUID *uuid;
@property (nonatomic, nullable, copy) NSURL *avatarUrl;
@property (nonatomic, nullable, copy) NSDate *birthDate;
@property (nonatomic, nullable, copy) NSString *company;
@property (nonatomic, nullable, copy) NSString *city;
@property (nonatomic, nullable, copy) NSString *address;
@property (nonatomic, nullable, copy) NSString *zipCode;
@property (nonatomic, nullable, copy) NSString *province;
@property (nonatomic, nullable, copy) NSString *countryCode;
@property (nonatomic, nullable, copy) SNRClientSex *sex;
@property (nonatomic, nullable, copy) SNRClientAgreementsContext *agreements;

/**
 @attention Raises an @c NSInvalidArgumentException if object is not JSON encodable.
 */
@property (nonatomic, nullable, copy) NSDictionary *attributes;
@property (nonatomic, nullable, copy) NSArray<NSString *> *tags;

@end
