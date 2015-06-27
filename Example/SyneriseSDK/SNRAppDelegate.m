//
//  SNRAppDelegate.m
//  SyneriseExample
//
//  Created by Milosz Balus on 24.06.2015.
//  Copyright (c) 2015 HG Intelligence. All rights reserved.
//


#import "SNRAppDelegate.h"
#import <SyneriseSDK/SyneriseSDK.h>


@interface SNRAppDelegate () <SNRBeaconManagerDelegate>

@property SNRBeaconManager *beaconManager;

@end

@implementation SNRAppDelegate

- (id)init
{
    self = [super init];
    
    if (self)
    {
        _beaconManager = [SNRBeaconManager new];
        _beaconManager.delegate = self;
    }
    
    return self;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
 
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.2157 green:0.7255 blue:0.7804 alpha:1.0]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor],
                                                           NSFontAttributeName: [UIFont systemFontOfSize:18]}];
    
    
    [SNRSyneriseManager provideAPIKey:@"3DF69D1C-20E9-6AB7-573E-C8D3D6671402"];
    [SNRSyneriseManager debugModeEnabled:YES];
    
    
    if([SNRBeaconManager isBeaconMonitoringEnabled]){
        
        SNRRegion *region = [[SNRRegion alloc] initWithUUID:@"e0357084-d48e-49ff-b014-bf6e6c61b193"];
        
        [_beaconManager addRegions:@[region]];
        [_beaconManager startMonitoring];
    }
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    [[SNRPushNotificationManager sharedInstance] setDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    [[SNRPushNotificationManager sharedInstance] receiveRemoteNotificationWithUserInfo:userInfo
                                                                         startDispatch:NO];
    completionHandler(UIBackgroundFetchResultNewData);
}


@end
