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
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *zipcode;
@property (nonatomic, strong) NSString *facebookConnect;
@property (nonatomic, strong) NSData *custom;


- (id)initWithId:(NSString*)guid
      loginToken:(NSString*)loginToken
       firstName:(NSString*)firstName
        lastName:(NSString*)lastName
         zipcode:(NSString*)zipcode
 facebookConnect:(NSString*)facebookConnect
          custom:(NSData*)custom;
@end
