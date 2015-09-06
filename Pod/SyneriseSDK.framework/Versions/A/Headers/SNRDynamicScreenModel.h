//
//  SNRDynamicScreenModel.h
//  
//
//  Created by Milosz Balus on 20.08.2015.
//
//

#import <Foundation/Foundation.h>

@interface SNRDynamicScreenModel : NSObject <NSCopying>

@property (nonatomic, strong) NSNumber *id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *segueToDispatch;
@property (nonatomic, strong) NSString *valueToDispatch;
@property (nonatomic, strong) NSString *imageURL;


- (id)initWithId:(NSNumber*)id
           title:(NSString*) title
 segueToDispatch:(NSString*) segueToDispatch
 valueToDispatch:(NSString*) valueToDispatch
        imageURL:(NSString*) imageURL;

@end
