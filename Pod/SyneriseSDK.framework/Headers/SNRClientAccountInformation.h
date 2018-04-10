//
//  SNRClientAccountInformation.h
//  SyneriseSDK
//
//  Created by on 04/12/2017.
//  Copyright © 2017 Synerise. All rights reserved.
//

#import "SNRClientSex.h"
#import "SNRBaseContext.h"

@interface SNRClientAccountInformation : NSObject

- (nonnull instancetype)init __unavailable;
+ (nonnull instancetype)new __unavailable;

@property (nonatomic, nullable, copy) NSString *address;
@property (nonatomic, nullable, copy) NSDate *birthDate;
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
