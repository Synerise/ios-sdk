//
//  SNRProfileCreateClientContext.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "SNRBaseContext.h"
#import "SNRClientAgreementsContext.h"
#import "SNRClientSex.h"

NS_SWIFT_NAME(CreateClientContext)
@interface SNRCreateClientContext : SNRBaseContext

/**
 * @attention setters can throw exception
 *
 * @throws NSInvalidArgumentException if @property email is invalid - email should be valid email address.
 * @throws NSInvalidArgumentException if @property phone is invalid - phone number should match ^(\\+[0-9]{6,19})|([0-9]{6,20})$ regex pattern.
 * @throws NSInvalidArgumentException if @property birthdate is invalid - birthdate should match matching \d{4}-\d{2}-\d{2} regex pattern. Use YYYY-MM-DD format (1985-11-09).
 */
@property (nonatomic, nullable, copy) NSString *email;
@property (nonatomic, nullable, copy) NSString *phone;
@property (nonatomic, nullable, copy) NSString *customId;
@property (nonatomic, nullable, copy) NSString *firstName;
@property (nonatomic, nullable, copy) NSString *lastName;
@property (nonatomic, nullable, copy) NSString *displayName;
@property (nonatomic, nullable, copy) NSUUID *uuid;
@property (nonatomic, nullable, copy) NSURL *avatarUrl;
@property (nonatomic, nullable, copy) NSString *birthDate;
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
