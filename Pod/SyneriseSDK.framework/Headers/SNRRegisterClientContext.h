//
//  SNRClientRegisterContext.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "SNRBaseContext.h"
#import "SNRClientAgreementsContext.h"
#import "SNRClientSex.h"

/**
 * @enum SNRRegisterClientContextRegistrationType
 */
typedef NS_ENUM(NSInteger, SNRRegisterClientContextRegistrationType) {
    SNRRegisterClientContextRegistrationTypeByEmail,
    SNRRegisterClientContextRegistrationTypeByPhone
} NS_SWIFT_NAME(RegistrationType);

/**
 Register context to @c [SNRClient registerClient] metod
 */

NS_SWIFT_NAME(RegisterClientContext)
@interface SNRRegisterClientContext : SNRBaseContext

/**
 * @attention setters can throw exception
 *
 * @throws NSInvalidArgumentException if @property email is invalid - email should be valid email address.
 * @throws NSInvalidArgumentException if @property password is invalid - password that consists of at least one uppercase, one lowercase, one special character and is at least 8 characters long.
 * @throws NSInvalidArgumentException if @property phone is invalid - phone number should match ^(\\+[0-9]{6,19})|([0-9]{6,20})$ regex pattern.
 */

@property (copy, nonatomic, nullable) NSString *address;
@property (copy, nonatomic, nullable) SNRClientAgreementsContext *agreements;
@property (copy, nonatomic, nullable) NSDictionary *attributes;
@property (copy, nonatomic, nullable) NSString *city;
@property (copy, nonatomic, nullable) NSString *company;

// Country code, e.g. "pl" (ISO  nullable,3166-1 alpha-2)
@property (copy, nonatomic, nullable) NSString *countryCode;
@property (copy, nonatomic, nullable) NSString *customId;
@property (copy, nonatomic, nullable) NSString *email;
@property (copy, nonatomic, nullable) NSString *firstName;
@property (copy, nonatomic, nullable) NSString *lastName;
@property (copy, nonatomic, nonnull) NSString *password;
@property (copy, nonatomic, nullable) NSString *phone;
@property (copy, nonatomic, nullable) NSString *province;
@property (copy, nonatomic, nullable) SNRClientSex *sex;
@property (copy, nonatomic, nullable) NSString *tags;
@property (copy, nonatomic, nullable) NSString *zipCode;

@property (nonatomic, assign) SNRRegisterClientContextRegistrationType registrationType;

- (nullable instancetype)init __unavailable;
+ (nullable instancetype)new __unavailable;

/**
 * @throws NSInvalidArgumentException if email is invalid - email should be valid email address.
 * @throws NSInvalidArgumentException if password is invalid - password that consists of at least one uppercase, one lowercase, one special character and is at least 8 characters long.
 */
- (nonnull instancetype)init:(nonnull NSString *)email
                    password:(nonnull NSString *)password;

/**
 * @throws NSInvalidArgumentException if phone is invalid - phone number should match ^(\\+[0-9]{6,19})|([0-9]{6,20})$ regex pattern.
 * @throws NSInvalidArgumentException if password is invalid - password that consists of at least one uppercase, one lowercase, one special character and is at least 8 characters long.
 */
- (nonnull instancetype)initWithPhoneNumber:(nonnull NSString *)phoneNumber
                    password:(nonnull NSString *)password;

@end
