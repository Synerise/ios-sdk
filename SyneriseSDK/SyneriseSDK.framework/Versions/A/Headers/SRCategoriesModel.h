//
//  SRCategoriesModel.h
//  SyneriseBeacon
//
//  Created by Milosz Balus on 23.03.2015.
//  Copyright (c) 2015 Humanoit Group. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRCategoriesModel : NSObject

@property (nonatomic, assign) NSInteger categoryId;
@property (nonatomic, assign) NSInteger parentId;
@property (nonatomic, strong) NSString *name;

- (id)initWithId:(NSInteger)categoryId
        parentId:(NSInteger)parentId
            name:(NSString*)name;

@end