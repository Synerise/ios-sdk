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
    SNRRegisterClientContextRegistrationTypeByEmailWithoutActivation,
    SNRRegisterClientContextRegistrationTypeByEmail,
    SNRRegisterClientContextRegistrationTypeByPhone
} NS_SWIFT_NAME(RegistrationType);

/**
 Register context to @c [SNRClient registerClient] metod
 */

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(RegisterClientContext)
@interface SNRRegisterClientContext : SNRBaseContext

/**
 * @attention setters can throw exception
 *
 * @throws NSInvalidArgumentException if @property email is invalid - email should be valid email address.
 * @throws NSInvalidArgumentException if @property password is invalid - password that consists of at least one uppercase, one lowercase, one special character and is at least 8 characters long.
 * @throws NSInvalidArgumentException if @property phone is invalid - phone number should match ^(\\+[0-9]{6,19})|([0-9]{6,20})$ regex pattern.
 */

@property (copy, nonatomic, nullable, readwrite) NSString *address;
@property (copy, nonatomic, nullable, readwrite) SNRClientAgreementsContext *agreements;
@property (copy, nonatomic, nullable, readwrite) NSDictionary *attributes;
@property (copy, nonatomic, nullable, readwrite) NSString *city;
@property (copy, nonatomic, nullable, readwrite) NSString *company;

// Country code, e.g. "pl" (ISO  nullable,3166-1 alpha-2)
@property (copy, nonatomic, nullable, readwrite) NSString *countryCode;
@property (copy, nonatomic, nullable, readwrite) NSString *customId;
@property (copy, nonatomic, nullable, readwrite) NSString *email;
@property (copy, nonatomic, nullable, readwrite) NSString *firstName;
@property (copy, nonatomic, nullable, readwrite) NSString *lastName;
@property (copy, nonatomic, nonnull, readwrite) NSString *password;
@property (copy, nonatomic, nullable, readwrite) NSString *phone;
@property (copy, nonatomic, nullable, readwrite) NSString *province;
@property (copy, nonatomic, nullable, readwrite) SNRClientSex *sex;
@property (copy, nonatomic, nullable, readwrite) NSString *tags;
@property (copy, nonatomic, nullable, readwrite) NSString *zipCode;

@property (assign, nonatomic, readwrite) SNRRegisterClientContextRegistrationType registrationType;

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

/**
 * @throws NSInvalidArgumentException if email is invalid - email should be valid email address.
 * @throws NSInvalidArgumentException if password is invalid - password that consists of at least one uppercase, one lowercase, one special character and is at least 8 characters long.
 */
- (instancetype)init:(NSString *)email
            password:(NSString *)password;


/**
 * @throws NSInvalidArgumentException if email is invalid - email should be valid email address.
 * @throws NSInvalidArgumentException if password is invalid - password that consists of at least one uppercase, one lowercase, one special character and is at least 8 characters long.
 */
- (instancetype)initWithEmailWithoutActivation:(NSString *)email
            password:(NSString *)password;

/**
 * @throws NSInvalidArgumentException if phone is invalid - phone number should match ^(\\+[0-9]{6,19})|([0-9]{6,20})$ regex pattern.
 * @throws NSInvalidArgumentException if password is invalid - password that consists of at least one uppercase, one lowercase, one special character and is at least 8 characters long.
 */
- (instancetype)initWithPhoneNumber:(NSString *)phoneNumber
                           password:(NSString *)password;

@end

NS_ASSUME_NONNULL_END
