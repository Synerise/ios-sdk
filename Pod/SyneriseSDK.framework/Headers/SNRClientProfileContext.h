//
//  SNRClientProfileContext.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "SNRBaseContext.h"
#import "SNRClientAgreementsContext.h"
#import "SNRClientSex.h"

NS_SWIFT_NAME(ClientProfileContext)
@interface SNRClientProfileContext : SNRBaseContext

- (nonnull instancetype)init __unavailable;
+ (nonnull instancetype)new __unavailable;

@property (copy, nonatomic, nullable) NSNumber *clientId;
@property (copy, nonatomic, nullable) NSString *customId;
@property (copy, nonatomic, nullable) NSDate *lastActivityDate;
@property (copy, nonatomic, nullable) NSString *email;
@property (copy, nonatomic, nullable) NSString *phone;
@property (copy, nonatomic, nullable) NSString *firstName;
@property (copy, nonatomic, nullable) NSString *lastName;
@property (copy, nonatomic, nullable) NSString *displayName;
@property (copy, nonatomic, nullable) NSUUID *uuid;
@property (copy, nonatomic, nullable) NSURL *avatarUrl;
@property (copy, nonatomic, nullable) NSString *birthDate;
@property (copy, nonatomic, nullable) NSString *company;
@property (copy, nonatomic, nullable) NSString *city;
@property (copy, nonatomic, nullable) NSString *address;
@property (copy, nonatomic, nullable) NSString *zipCode;
@property (copy, nonatomic, nullable) NSString *province;
@property (copy, nonatomic, nullable) NSString *countryCode;

@end
