//
//  SNRClientSubmitDataContext.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2023 Synerise. All rights reserved.
//

#import <SyneriseSDK/SNRBaseModel.h>
#import <SyneriseSDK/SNRClientSex.h>
#import <SyneriseSDK/SNRClientAgreements.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRClientSimpleAuthenticationData
 */

NS_SWIFT_NAME(ClientSimpleAuthenticationData)
@interface SNRClientSimpleAuthenticationData : SNRBaseModel

@property (copy, nonatomic, nullable, readwrite) NSString *email;
@property (copy, nonatomic, nullable, readwrite) NSString *phone;
@property (copy, nonatomic, nullable, readwrite) NSString *customId;
@property (copy, nonatomic, nullable, readwrite) NSString *uuid;

@property (copy, nonatomic, nullable, readwrite) NSString *firstName;
@property (copy, nonatomic, nullable, readwrite) NSString *lastName;
@property (copy, nonatomic, nullable, readwrite) NSString *displayName;
@property (assign, nonatomic, readwrite) SNRClientSex sex;
@property (copy, nonatomic, nullable, readwrite) NSString *company;
@property (copy, nonatomic, nullable, readwrite) NSString *address;
@property (copy, nonatomic, nullable, readwrite) NSString *city;
@property (copy, nonatomic, nullable, readwrite) NSString *province;
@property (copy, nonatomic, nullable, readwrite) NSString *zipCode;
@property (copy, nonatomic, nullable, readwrite) NSString *countryCode;
@property (copy, nonatomic, nullable, readwrite) NSString *birthDate;
@property (copy, nonatomic, nullable, readwrite) NSString *avatarUrl;

@property (copy, nonatomic, nullable, readwrite) SNRClientAgreements *agreements;

@property (copy, nonatomic, nullable, readwrite) NSDictionary *attributes;
@property (copy, nonatomic, nullable, readwrite) NSArray<NSString *> *tags;

@end

NS_ASSUME_NONNULL_END
