//
//  SNRClientRegisterContext.h
//  SyneriseSDK
//
//  Created on 27/11/2017.
//  Copyright © 2017 Synerise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNRClientAgreementsContext.h"
#import "SNRClientSex.h"

/**
 Register context to @c [SNRClient registerClient] metod
 */
@interface SNRRegisterClientContext : NSObject

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

- (nonnull instancetype)init:(NSString * _Nonnull)email
                    password:(NSString * _Nonnull)password;

@end
