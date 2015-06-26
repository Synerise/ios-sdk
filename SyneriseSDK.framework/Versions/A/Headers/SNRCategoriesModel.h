//
//  SRCategoriesModel.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 23.03.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNRCategoriesModel : NSObject

@property (nonatomic, assign) NSInteger categoryId;
@property (nonatomic, assign) NSInteger parentId;
@property (nonatomic, strong) NSString *name;

- (id)initWithId:(NSInteger)categoryId
        parentId:(NSInteger)parentId
            name:(NSString*)name;

@end