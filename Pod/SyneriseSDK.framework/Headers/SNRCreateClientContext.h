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
@property (copy, nonatomic, nullable) NSString *email;
@property (copy, nonatomic, nullable) NSString *phone;
@property (copy, nonatomic, nullable) NSString *customId;
@property (copy, nonatomic, nullable) NSString *firstName;
@property (copy, nonatomic, nullable) NSString *lastName;
@property (copy, nonatomic, nullable) NSString *displayName;
@property (copy, nonatomic, nullable) NSUUID *uuid;
@property (copy, nonatomic, nullable) NSURL *avatarUrl;
@property (copy, nonatomic, nullable) NSString *birthDate;
@property (copy, nonatomic, nullable) NSString *company;
@property (copy, nonatomic, nullable) NSString *city;
@property (copy, nonatomic, nullable) NSString *address;
@property (copy, nonatomic, nullable) NSString *zipCode;
@property (copy, nonatomic, nullable) NSString *province;
@property (copy, nonatomic, nullable) NSString *countryCode;
@property (copy, nonatomic, nullable) SNRClientSex *sex;
@property (copy, nonatomic, nullable) SNRClientAgreementsContext *agreements;

/**
 @attention Raises an @c NSInvalidArgumentException if object is not JSON encodable.
 */
@property (copy, nonatomic, nullable) NSDictionary *attributes;
@property (copy, nonatomic, nullable) NSArray<NSString *> *tags;

@end
