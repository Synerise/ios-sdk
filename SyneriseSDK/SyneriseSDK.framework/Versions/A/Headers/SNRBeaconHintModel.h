//
//  SNRBeaconHintModel.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 23.03.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNRBeaconHintModel : NSObject <NSCopying>


@property (nonatomic, strong) NSNumber *hintId;
@property (nonatomic, strong) NSString *uuid;
@property (nonatomic, strong) NSNumber *major;
@property (nonatomic, strong) NSNumber *minor;
@property (nonatomic, strong) NSNumber *openType;
@property (nonatomic, strong) NSNumber *openObjectId;
@property (nonatomic, strong) NSNumber *actionType;
@property (nonatomic, strong) NSString *openTarget;
@property (nonatomic, strong) NSString *photoExtension;
@property (nonatomic, strong) NSString *imagePath;
@property (nonatomic, strong) NSString *message;

- (id)initWithId:(NSNumber*)hintId
            uuid:(NSString*)uuid
           major:(NSNumber*)major
           minor:(NSNumber*)minor
        openType:(NSNumber*)openType
    openObjectId:(NSNumber*)openObjectId
      actionType:(NSNumber*)actionType
      openTarget:(NSString*)openTarget
  photoExtension:(NSString*)photoExtension
       imagePath:(NSString*)imagePath
         message:(NSString*)message;

@end
