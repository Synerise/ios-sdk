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

@property (nonatomic, nullable, copy) NSString *address;
@property (nonatomic, nullable, copy) SNRClientAgreementsContext *agreements;
@property (nonatomic, nullable, copy) NSDictionary *attributes;
@property (nonatomic, nullable, copy) NSString *city;
@property (nonatomic, nullable, copy) NSString *company;

// Country code, e.g. "pl" (ISO  nullable,3166-1 alpha-2)
@property (nonatomic, nullable, copy) NSString *countryCode;
@property (nonatomic, nullable, copy) NSString *customId;
@property (nonatomic, nonnull, copy) NSString *email;
@property (nonatomic, nullable, copy) NSString *firstName;
@property (nonatomic, nullable, copy) NSString *lastName;
@property (nonatomic, nonnull, copy) NSString *password;
@property (nonatomic, nullable, copy) NSString *phone;
@property (nonatomic, nullable, copy) NSString *province;
@property (nonatomic, nullable, copy) SNRClientSex *sex;
@property (nonatomic, nullable, copy) NSString *tags;
@property (nonatomic, nullable, copy) NSString *zipCode;

- (nullable instancetype)init __unavailable;
+ (nullable instancetype)new __unavailable;

/**
 * @throws NSInvalidArgumentException if email is invalid - email should be valid email address.
 * @throws NSInvalidArgumentException if password is invalid - password that consists of at least one uppercase, one lowercase, one special character and is at least 8 characters long.
 */
- (nonnull instancetype)init:(NSString * _Nonnull)email
                    password:(NSString * _Nonnull)password;

@end
