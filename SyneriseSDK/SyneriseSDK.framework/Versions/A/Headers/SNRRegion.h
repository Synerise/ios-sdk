//
//  SNRRegion.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 26.06.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNRRegion : NSObject

@property (strong, nonatomic, readwrite) NSString *uuid;
@property (strong, nonatomic, readwrite) NSNumber *major;
@property (strong, nonatomic, readwrite) NSNumber *minor;


#pragma mark - Initializers

- (id)initWithUUID:(NSString *)uuid major:(NSNumber *)major andMinor:(NSNumber *)minor;

- (id)initWithUUID:(NSString *)uuid;

- (id)initWithUUID:(NSString *)uuid andMajor:(NSNumber *)major;

@end
