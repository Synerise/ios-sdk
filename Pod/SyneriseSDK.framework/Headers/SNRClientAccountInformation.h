//
//  SNRClientAccountInformation.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "SNRClientSex.h"
#import "SNRBaseContext.h"

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(ClientAccountInformation)
@interface SNRClientAccountInformation : NSObject

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

/**
 * @attention Setters can throw exception.
 *
 * @note Birthdate should match matching \d{4}-\d{2}-\d{2} regex pattern. Use YYYY-MM-DD format (1985-11-09).
 * @note Phone number should match ^(\\+[0-9]{6,19})|([0-9]{6,20})$ regex pattern.
 *
 * @throws SNRInvalidBirthdateException for Obj-C and SNRInvalidBirthdateError for Swift if a birthdate is invalid.
 * @throws SNRInvalidPhoneNumberException for Obj-C and SNRInvalidPhoneNumberError for Swift if a phone number is invalid.
 */

@property (copy, nonatomic, nullable, readwrite) NSString *address;
@property (copy, nonatomic, nullable, readwrite) NSString *birthDate;
@property (copy, nonatomic, nullable, readwrite) NSString *city;
@property (copy, nonatomic, nullable, readwrite) NSString *company;
@property (copy, nonatomic, nullable, readwrite) NSString *countryCode;
@property (copy, nonatomic, nullable, readwrite) NSString *displayName;
@property (copy, nonatomic, nullable, readwrite) NSString *firstName;
@property (copy, nonatomic, nullable, readwrite) NSString *lastName;
@property (copy, nonatomic, nullable, readwrite) NSString *phoneNumber;
@property (copy, nonatomic, nullable, readwrite) NSString *province;
@property (copy, nonatomic, nullable, readwrite) SNRClientSex *sex;
@property (copy, nonatomic, nullable, readwrite) NSString *zipCode;

@end

NS_ASSUME_NONNULL_END
