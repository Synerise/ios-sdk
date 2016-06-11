//
//  SRClientModel.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 20.03.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNRClientModel : NSObject <NSCopying>

@property (nonatomic, strong) NSString *guid;
@property (nonatomic, strong) NSString *loginToken;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *zipcode;
@property (nonatomic, strong) NSString *adress;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *region;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *facebookConnect;
@property (nonatomic, strong) NSString *facebookId;
@property (nonatomic, strong) NSString *locale;
@property (nonatomic, strong) NSData *custom;
@property (nonatomic, strong) NSString *clubcard;
@property (nonatomic, strong) NSString *company;
@property (nonatomic, strong) NSString *customIdentify;
@property (nonatomic, strong) NSString *newsletter;

- (id)initWithId:(NSString*)guid
      loginToken:(NSString*)loginToken
           email:(NSString*)email
           gener:(NSString*)gender
       firstName:(NSString*)firstName
        lastName:(NSString*)lastName
         zipcode:(NSString*)zipcode
          adress:(NSString*)adress
            city:(NSString*)city
         country:(NSString*)country
          region:(NSString*)region
           phone:(NSString*)phone
 facebookConnect:(NSString*)facebookConnect
      facebookId:(NSString*)facebookId
          locale:(NSString*)locale
          custom:(NSData*)custom
          clubcard:(NSString*)clubcard
          company:(NSString*)company
  customIdentify:(NSString*)customIdentify
      newsletter:(NSString*)newsletter;
@end
