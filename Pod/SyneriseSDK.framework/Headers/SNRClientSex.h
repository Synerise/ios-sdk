//
//  SNRClientSex.h
//  SyneriseSDK
//
//  Copyright © 2018 Synerise. All rights reserved.
//

NS_SWIFT_NAME(ClientSex)
@interface SNRClientSex : NSObject <NSCopying>

- (instancetype)init __unavailable;
+ (instancetype)new __unavailable;

+ (instancetype)male;
+ (instancetype)female;
+ (instancetype)notSpecified;

+ (instancetype)sexFromString:(NSString *)sexString;

@end
