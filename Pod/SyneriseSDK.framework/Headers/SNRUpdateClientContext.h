//
//  SNRUpdateClientContext.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "SNRBaseContext.h"
#import "SNRClientAgreementsContext.h"
#import "SNRClientSex.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(UpdateClientContext)
@interface SNRUpdateClientContext : SNRBaseContext

/**
 * @attention Setters can throw exception.
 *
 * @note Email should be valid email address.
 * @note Phone number should match ^(\\+[0-9]{6,19})|([0-9]{6,20})$ regex pattern.
 * @note Birthdate should match matching \d{4}-\d{2}-\d{2} regex pattern. Use YYYY-MM-DD format (1985-11-09).
 *
 * @throws SNRInvalidEmailException for Obj-C and SNRInvalidEmailError for Swift if an email is invalid.
 * @throws SNRInvalidPhoneNumberException for Obj-C and SNRInvalidPhoneNumberError for Swift if a phone number is invalid.
 * @throws SNRInvalidBirthdateException for Obj-C and SNRInvalidBirthdateError for Swift if a birthdate is invalid.
 */

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
@property (copy, nonatomic, nullable, readwrite) NSString *sex;
@property (copy, nonatomic, nullable, readwrite) SNRClientAgreementsContext *agreements;

/**
 @attention Raises an @c NSInvalidArgumentException if object is not JSON encodable.
 */
@property (copy, nonatomic, nullable, readwrite) NSDictionary *attributes;
@property (copy, nonatomic, nullable, readwrite) NSArray<NSString *> *tags;

@end

NS_ASSUME_NONNULL_END
