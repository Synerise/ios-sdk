//
//  SNRViewController.m
//  SyneriseExample
//
//  Created by Milosz Balus on 24.06.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//



#import "SNRViewController.h"
#import <SyneriseSDK/SyneriseSDK.h>

@interface SNRViewController () <SNRPushNotificationManagerDelegate>

@property (nonatomic, strong) SNRClientManager *clientManager;
@property (nonatomic, strong) SNRTrackerManager *trackerManager;
@property (nonatomic, strong) SNRProfileLocationsManager *profileLocationManager;
@property (nonatomic, strong) SNRPromotionsManager *promotionsManager;
@property (nonatomic, strong) SNRCouponsManager *couponsManager;

@end

@implementation SNRViewController


#pragma mark - property

- (SNRClientManager*)clientManager {
    if (_clientManager == nil) {
        _clientManager = [SNRClientManager sharedInstance];
    }
    return _clientManager;
}

- (SNRProfileLocationsManager*)profileLocationManager {
    if (_profileLocationManager == nil) {
        _profileLocationManager = [SNRProfileLocationsManager sharedInstance];
    }
    return _profileLocationManager;
}

- (SNRPromotionsManager*)promotionsManager {
    if (_promotionsManager == nil) {
        _promotionsManager = [SNRPromotionsManager sharedInstance];
    }
    return _promotionsManager;
}

- (SNRCouponsManager*)couponsManager {
    if (_couponsManager == nil) {
        _couponsManager = [SNRCouponsManager sharedInstance];
    }
    return _couponsManager;
}


#pragma mark -

- (void)viewDidLoad
{
    [super viewDidLoad];

    [[SNRPushNotificationManager sharedInstance] registerToReceivePushNotification];
    [[SNRPushNotificationManager sharedInstance] setDelegate:self];
    
    [self sampleRegisterClient];
    [self sampleLoginClient];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark - 

-(void)sampleLoginClient {
    
    [self.clientManager loginClientWithEmail:@"john.smith@gmail.com" password:@"123456" successBlock:^{
        NSLog(@"%@", self.clientManager.loggedClientData);
    } retryBlock:^{

    } andFailedBlock:^(NSError *error, UIAlertView *alertView) {

    }];
}

-(void)sampleRegisterClient {
    
    [self.clientManager registerClientWithEmail:@"john.smith@gmail.com" password:@"123456" successBlock:^{
        NSLog(@"%@", self.clientManager.loggedClientData);
    } retryBlock:^{
    
    } andFailedBlock:^(NSError *error, UIAlertView *alertView) {
            
    }];
}

-(void)sampleUpdateClientData {
    [self.clientManager updateClientWithFirstname:@"John"
                                         lastname:@"Smith"
                                          address:@"1600 Amphitheatre Parkway"
                                          zipcode:@"94043"
                                             city:@"Mountain View"
                                       customData:@"{key1:value1, key2:value2}"
                                     successBlock:^(id response) {
    
                                     } andErrorBlock:^(NSError *error) {

                                     }];
}

-(void)sampleTrakingInApp {

    [[SNRTrackerManager sharedInstance] createEventWithCategory:@"Mobile.Tracking"
                                                         action:@"Open.Home.Screen"
                                                          label:@"Open home screen"
                                                         params:nil];
}

-(void)sampleProfileLocationList {
    
    [self.profileLocationManager getListLocationWithLatitude:@"0.0" longitude:@"0.0" successBlock:^{
        NSLog(@"%@",self.profileLocationManager.locations);
    } retryBlock:^{
    } andFailedBlock:^(NSError *error, UIAlertView *alertView) {

    }];
}


-(void)samplePromotionList {
    
    [self.promotionsManager promotionListWithPeriod:@"2" includeLocations:NO limit:@"100" offset:@"0" successBlock:^{
        NSLog(@"%@",self.promotionsManager.promotions);
    } retryBlock:^{
    
    } andFailedBlock:^(NSError *error, UIAlertView *alertView) {
        
    }];
}


-(void)sampleCouponsList {
    [self.couponsManager getCouponsWithLimit:@100 offset:@0 successBlock:^{
        NSLog(@"%@",self.couponsManager.coupons);
    } retryBlock:^{

    } andFailedBlock:^(NSError *error, UIAlertView *alertView) {

    }];
}


#pragma mark SNRPushNotificationManagerDelegate

-(void)pushNotificationHandleResult:(id)result andFetchType:(FetchedResultsType)fetchType {
    if(fetchType == FetchedResultsAsImage){
        NSLog(@"URL to image: %@", result);
    }

    if(fetchType == FetchedResultsAsURL){
        NSLog(@"URL to website: %@", result);
    }

    if(fetchType == FetchedResultsAsPromotionScreen){
        NSLog(@"Promotion ID: %@", result);
    }

    if(fetchType == FetchedResultsAsText){
        NSLog(@"Plain text: %@", result);
    }

}

@end
