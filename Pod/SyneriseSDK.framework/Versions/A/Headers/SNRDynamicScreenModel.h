//
//  SNRDynamicScreenModel.h
//  
//
//  Created by Milosz Balus on 20.08.2015.
//
//

#import <Foundation/Foundation.h>
#import "SNRBlocksModel.h"

@interface SNRDynamicScreenModel : NSObject <NSCopying>

@property (nonatomic, strong) NSNumber *idScreen;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *segueToDispatch;
@property (nonatomic, strong) NSString *valueToDispatch;
@property (nonatomic, strong) NSString *imageURL;
@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) SNRBlocksModel *blockDetailObject;


- (id)initWithId:(NSNumber*) idScreen
           title:(NSString*) title
 segueToDispatch:(NSString*) segueToDispatch
 valueToDispatch:(NSString*) valueToDispatch
       imageName:(NSString*) imageName
        imageURL:(NSString*) imageURL;

@end
