//
//  SNRScreenBlockManager.h
//  SyneriseSDK
//
//  Created by Milosz Balus on 21.09.2015.
//  Copyright © 2015 HG Intelligence. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SNRBlocksModel.h"

typedef void(^ScreenBlockManagerSuccessBlock)(void);
typedef void(^ScreenBlockManagerFailedBlock)(NSError *error);


@interface SNRScreenBlockManager : NSObject

@property (nonatomic, strong) NSArray *screens;
@property (nonatomic, strong) SNRBlocksModel *blockDetailObject;

+ (SNRScreenBlockManager*)sharedInstance;


- (void) listScreenBlocks:(NSString*)uuid
             successBlock:(ScreenBlockManagerSuccessBlock)successBlock
            andErrorBlock:(ScreenBlockManagerFailedBlock)errorBlock;

- (void)blockDetail:(NSString*)uuid
       successBlock:(ScreenBlockManagerSuccessBlock)successBlock
      andErrorBlock:(ScreenBlockManagerFailedBlock)errorBlock;

@end
