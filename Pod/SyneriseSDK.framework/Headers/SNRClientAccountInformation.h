//
//  SNRClientAccountInformation.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "SNRBaseModel.h"
#import "SNRClientSex.h"
#import "SNRClientAgreements.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRClientAccountInformation
 */

NS_SWIFT_NAME(ClientAccountInformation)
@interface SNRClientAccountInformation : SNRBaseModel

@property (assign, nonatomic, readonly) NSInteger clientId;
@property (copy, nonatomic, nonnull, readonly) NSString *email;
@property (copy, nonatomic, nullable, readonly) NSString *phone;
@property (copy, nonatomic, nullable, readonly) NSString *customId;
@property (copy, nonatomic, nonnull, readonly) NSString *uuid;

@property (copy, nonatomic, nullable, readonly) NSString *firstName;
@property (copy, nonatomic, nullable, readonly) NSString *lastName;
@property (copy, nonatomic, nullable, readonly) NSString *displayName;
@property (assign, nonatomic, readonly) SNRClientSex sex;
@property (copy, nonatomic, nullable, readonly) NSString *company;
@property (copy, nonatomic, nullable, readonly) NSString *address;
@property (copy, nonatomic, nullable, readonly) NSString *city;
@property (copy, nonatomic, nullable, readonly) NSString *province;
@property (copy, nonatomic, nullable, readonly) NSString *zipCode;
@property (copy, nonatomic, nullable, readonly) NSString *countryCode;
@property (copy, nonatomic, nullable, readonly) NSString *birthDate;
@property (copy, nonatomic, nonnull, readonly) NSDate *lastActivityDate;
@property (copy, nonatomic, nullable, readonly) NSString *avatarUrl;

@property (assign, nonatomic, readonly) BOOL anonymous;

@property (copy, nonatomic, nullable, readonly) SNRClientAgreements *agreements;

@property (copy, nonatomic, nullable, readonly) NSDictionary *attributes;
@property (copy, nonatomic, nullable, readonly) NSArray<NSString *> *tags;

@end

NS_ASSUME_NONNULL_END
