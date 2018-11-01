//
//  SNRUpdateClientContext.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "SNRBaseContext.h"
#import "SNRClientSex.h"
#import "SNRClientAgreements.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(UpdateClientContext)
@interface SNRUpdateClientContext : SNRBaseContext

@property (copy, nonatomic, nullable, readwrite) NSNumber *clientId;
@property (copy, nonatomic, nullable, readwrite) NSString *email;
@property (copy, nonatomic, nullable, readwrite) NSString *phone;
@property (copy, nonatomic, nullable, readwrite) NSString *customId;
@property (copy, nonatomic, nullable, readwrite) NSString *firstName;
@property (copy, nonatomic, nullable, readwrite) NSString *lastName;
@property (copy, nonatomic, nullable, readwrite) NSString *displayName;
@property (copy, nonatomic, nullable, readwrite) NSUUID *uuid;
@property (copy, nonatomic, nullable, readwrite) NSURL *avatarUrl;
@property (copy, nonatomic, nullable, readwrite) NSString *birthDate;
@property (copy, nonatomic, nullable, readwrite) NSString *company;
@property (copy, nonatomic, nullable, readwrite) NSString *city;
@property (copy, nonatomic, nullable, readwrite) NSString *address;
@property (copy, nonatomic, nullable, readwrite) NSString *zipCode;
@property (copy, nonatomic, nullable, readwrite) NSString *province;
@property (copy, nonatomic, nullable, readwrite) NSString *countryCode;
@property (assign, nonatomic, readwrite) SNRClientSex sex;
@property (copy, nonatomic, nullable, readwrite) SNRClientAgreements *agreements;

/**
 @attention Raises an @c NSInvalidArgumentException if object is not JSON encodable.
 */
@property (copy, nonatomic, nullable, readwrite) NSDictionary *attributes;
@property (copy, nonatomic, nullable, readwrite) NSArray<NSString *> *tags;

@end

NS_ASSUME_NONNULL_END
