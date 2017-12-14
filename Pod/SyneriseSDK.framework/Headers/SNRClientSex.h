//
//  SNRClientSex.h
//  SyneriseSDK
//
//  Created on 27/11/2017.
//  Copyright © 2017 Synerise. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNRClientSex : NSObject <NSCopying>

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

+ (instancetype)male;
+ (instancetype)female;
+ (instancetype)notSpecified;

+ (instancetype)sexFromString:(NSString *)sexString;

@end
