//
//  SNRNewsModel.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 05.11.2015.
//  Copyright © 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNRNewsModel : NSObject <NSCopying>

@property (nonatomic, assign) NSInteger newsId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDate *availableFrom;
@property (nonatomic, strong) NSDate *availableTo;
@property (nonatomic, strong) NSString *newsDescription;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSString *website;
@property (nonatomic, strong) NSString *categoryId;
@property (nonatomic, strong) NSString *uuid;


- (id)initWithId:(NSInteger)newsId
            name:(NSString*)name
   availableFrom:(NSDate*)availableFrom
     availableTo:(NSDate*)availableTo
 newsDescription:(NSString*)newsDescription
            path:(NSString*)path
         website:(NSString*)website
      categoryId:(NSString*)categoryId
            uuid:(NSString*)uuid;

@end
