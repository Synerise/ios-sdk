//
//  SNRClientAccountInformation.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "SNRClientSex.h"
#import "SNRBaseContext.h"

NS_SWIFT_NAME(ClientAccountInformation)
@interface SNRClientAccountInformation : NSObject

- (nonnull instancetype)init __unavailable;
+ (nonnull instancetype)new __unavailable;

/**
 * @attention setters can throw exception
 *
 * @throws NSInvalidArgumentException if @property phone is invalid - phone number should match ^(\\+[0-9]{6,19})|([0-9]{6,20})$ regex pattern.
 * @throws NSInvalidArgumentException if @property birthdate is invalid - birthdate should match matching \d{4}-\d{2}-\d{2} regex pattern. Use YYYY-MM-DD format (1985-11-09).
 */

@property (nonatomic, nullable, copy) NSString *address;
@property (nonatomic, nullable, copy) NSString *birthDate;
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
