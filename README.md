# SyneriseSDK

The Synerise iOS SDK is designed to be simple to develop with, allowing you to easily integrate SyneriseSDK software into your apps. For more info about Synerise visit the [Synerise Website](http://synerise.com)

## Supported iOS Versions

As Synerise relies on iBeacon support the SDK only performs functionality on iOS 7 (see supported devices http://support.apple.com/kb/HT6048). 
Valid Architectures: armv7 armv7s i386 arm64
Minimum iOS Deployment Target: 5.1
Base SDK support: iOS 8

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

---

## Quickstart


### Step 1: Install the SDK

SyneriseSDK is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```Objective-C
pod "SyneriseSDK"
```

Under your application targets "Build Settings" configuration find the "Other Linker Flags" property and set it to "-ObjC".

You'll need to import the <SyneriseSDK/SyneriseSDK.h> header into the files that contain code relating to Synerise. You can either add them to individual files or include it in your AppName-Prefix.pch file.

```Objective-C
#import "<SyneriseSDK/SyneriseSDK.h>"
```

In your application plist file (often called "Info.plist") add a row for "Required background modes" of type Array. It then needs:

- "App downloads content in response to push notifications"

To support updates in iOS 8 you need to add the following Cocoa Keys to the plist.

```Objective-C
<key>NSLocationAlwaysUsageDescription</key>
<string>Required for ios 8 compatibilty</string>
```

#####For iOS 9 only: Whitelist Synerise Servers

If you compile your app with iOS SDK 9.0, you will be affected by App Transport Security. Currently, you will need to whitelist Synerise domains in your app by adding the following to your application's plist:

```Objective-C
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSExceptionDomains</key>
    <dict>
        <key>synerise.com</key>
        <dict>
            <key>NSIncludesSubdomains</key> 
            <true/>        
            <key>NSExceptionRequiresForwardSecrecy</key> 
            <false/>
        </dict>
    </dict>
</dict>
```


### Step 2: Setup SyneriseSDK

If you haven't done so already, login to Synerise to get your Synerise API Key.
Go into the `-application:didFinishLaunchingWithOptions:` method of your XXAppDelegate and provide API Key. When your application to to backgorud all events should be flush. Therefore you should add `forceFlushEvents` in  `applicationDidEnterBackground:`.

##### AppDelegate.m
```Objective-C
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Provide API Key for setup SyneriseSDK
    [SNRSyneriseManager provideAPIKey:@"<your api key>"];

    // Optional you can turn on debugging mode
    [SNRSyneriseManager debugModeEnabled:YES];

    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[SNRTrackerManager sharedInstance] forceFlushEvents];
}

```

### Step 3:  Track events
Using SyneriseTracker is the way how you tell Synerise about which actions your users are performing inside your app. You can track custom events or screen activity by two separate methods.

```Objective-C
SNRTrackerManager *syneriseTracker = [SNRTrackerManager sharedInstance];

// #1. You can track application screen view with params. 
[syneriseTracker trackScreen:@"ProductViewScreen" withParams:@{
    @"Category": @"Sport",
    @"Brand": @"Noname",
    @"Price":@"99.99"
}];

// #2. Traking custom event like form submit, buttons tap, purchased item etc.
[syneriseTracker trackEvent:@"AddToFavourites" withParams:@{
    @"ProductName": @"iPhone 6",
    @"ProductCategory": @"Smartphones"
}];
```

### Step 4:  Identify Users
SyneriseSDK has own build in session manager, which take care about unique user identity. You can provide tracker with custom client data. Basic call of this might look like:

```Objective-C
[[SNRTrackerManager sharedInstance] client:@{@"email": @"john.smith@mail.com",
                                         @"firstname":@"John",
                                        @"secondname":@"Smith",
                                               @"age":@"33"}];
```

You should know that Synerise has it own predefined Client model which is build with parameters:
* email
* firstname
* secondname
* adress
* city
* region
* phone
* sex
* birthday 

That mean you can overwrite user profile with parameters send by tracker.
Of course you can also add more client data but they would be dipatch as custom fields tide to your Customer profile.

If you want using your own identity for user application call `-customIdentify:`. It might look like:

```Objective-C
[[SNRTrackerManager sharedInstance] customIdentify:@"<custom clientID>"];
```
After that all events generated in application will be signed in this identity.

### Step 5: Log customer location (optional)
Use information from the CLLocationManager to specify the location of the Customer session.

```Objective-C
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    [locationManager startUpdatingLocation];
    CLLocation *location = locationManager.location;
    
    [[SNRTrackerManager sharedInstance] setLatitude:location.coordinate.latitude
              longitude:location.coordinate.longitude
     horizontalAccuracy:location.horizontalAccuracy
       verticalAccuracy:location.verticalAccuracy];
```
Now you can target campaign by customer location. You can send them email, sms or push messages. 

## Push Messages

Go to https://app.synerise.com. Login and setup your accout to connection with APN. Go to Settings -> Integration and upload pem certificate for APN. Now you can define your first Push Message campaign.

SyneriseSDK  has own Push Meassage handle API. Using `SNRPushNotificationManagerDelegate` you can dipatch push message in your own way. In Synerise push messages might be triggered by:
* iBeacon
* sheduled campaign
* in one to one communication 
* autmation rule

In your mobile appliaction configure AppDelegate file.

##### AppDelegate.m
```Objective-C
- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    [[SNRPushNotificationManager sharedInstance] setDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
    [[SNRPushNotificationManager sharedInstance] receiveRemoteNotificationWithUserInfo:userInfo
                                                                         startDispatch:NO];
    completionHandler(UIBackgroundFetchResultNewData);
}
```

Now you can handle push messages. In this case use `SNRPushNotificationManagerDelegate`.

##### ViewController.h
```Objective-C
@interface ViewController () <SNRPushNotificationManagerDelegate>

@end
```

##### ViewController.m
```Objective-C
- (void)viewDidLoad {
    [super viewDidLoad];

    [[SRPushNotificationManager sharedInstance] registerToReceivePushNotification];
    [[SRPushNotificationManager sharedInstance] setDelegate:self];
    
}

#pragma - mark SNRPushNotificationManagerDelegate
-(void)pushNotificationHandleResult:(id)result andFetchType:(FetchedResultsType)fetchType {
    if(fetchType == FetchedResultsAsImage){
        NSLog(@"URL to image: %@", result);
    }
    
    if(fetchType == FetchedResultsAsURL){
        NSLog(@"URL to website: %@", result);
    }
    
    if(fetchType == FetchedResultsAsPromotionScreen){
        NSLog(@"Open promotion screen: %@", result);
    }
    
    if(fetchType == FetchedResultsAsText){
        NSLog(@"Plain text: %@", result);
    }

}
```

## Synerise and iBeacon

Use `SNRBeaconManager` for hendle iBeacon interaction and add delegate `SNRBeaconManagerDelegate` to your class. It should look like the following:

##### AppDelegate.m
```Objective-C
@interface AppDelegate () <SNRBeaconManagerDelegate>

@property SNRBeaconManager *beaconManager;

@end

@implementation AppDelegate

- (id)init {
    self = [super init];
    if (self){
        _beaconManager = [SNRBeaconManager new];
        _beaconManager.delegate = self;
    }
    return self;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 1. Setup API Key
    [SNRSyneriseManager provideAPIKey:@"<#Synerise API Key#>"];
    [SNRSyneriseManager debugModeEnabled:YES];

    // 2. Start monitor your iBeacon regions
    SNRRegion *region = [[SNRRegion alloc] initWithUUID:@"<#UUID#>"];
    [_beaconManager addRegions:@[region]];
    [_beaconManager startMonitoring];
    //....
    return YES;
}
```
Use `SNRPushNotificationManager` described above in order to deliver targeting messages. 

### Custom flow for iBeacon

If you wish implement custom flow for iBeacon based on primary iOS SDK and `CoreLocation` you can use only `createBeaconEventWithUUID` for traking activity triggered by iBeacon.

```Objective-C
-(void) clientEnterRegion{
    SNRTrackerManager *syneriseTracker = [SNRTrackerManager sharedInstance];
    [syneriseTracker createBeaconEventWithUUID:@"942c21a6-e50c-49c8-acf6-2250198b17d1"
                                major:@1234
                                minor:@1234
                         andProximity:@"1"];
}
```

## Author

Synerise, developer@synerise.com. If you need support please feel free and contact us.

## License

SyneriseSDK is available under the MIT license. See the LICENSE file for more info.