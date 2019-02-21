//
//  SNRClientRegisterAccountContext.h
//  SyneriseSDK
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

#import "SNRBaseContext.h"
#import "SNRClientSex.h"
#import "SNRClientAgreements.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * @class SNRClientRegisterAccountContext
 */

NS_SWIFT_NAME(ClientRegisterAccountContext)
@interface SNRClientRegisterAccountContext : SNRBaseContext

@property (copy, nonatomic, nullable, readwrite) NSString *email;
@property (copy, nonatomic, nonnull, readwrite) NSString *password;

@property (copy, nonatomic, nullable, readwrite) NSString *firstName;
@property (copy, nonatomic, nullable, readwrite) NSString *lastName;
@property (copy, nonatomic, nullable, readwrite) NSString *customId;

@property (assign, nonatomic, readwrite) SNRClientSex sex;
@property (copy, nonatomic, nullable, readwrite) NSString *phone;
@property (copy, nonatomic, nullable, readwrite) NSString *company;
@property (copy, nonatomic, nullable, readwrite) NSString *address;
@property (copy, nonatomic, nullable, readwrite) NSString *city;
@property (copy, nonatomic, nullable, readwrite) NSString *province;
@property (copy, nonatomic, nullable, readwrite) NSString *zipCode;
@property (copy, nonatomic, nullable, readwrite) NSString *countryCode;

@property (copy, nonatomic, nullable, readwrite) SNRClientAgreements *agreements;

@property (copy, nonatomic, nullable, readwrite) NSDictionary *attributes;
@property (copy, nonatomic, nullable, readwrite) NSString *tags;

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

- (instancetype)initWithEmail:(NSString *)email andPassword:(NSString *)password NS_SWIFT_NAME(init(email:password:));

@end

NS_ASSUME_NONNULL_END
