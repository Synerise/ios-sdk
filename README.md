# Synerise iOS SDK

The Synerise iOS SDK is designed to be simple to develop with, allowing you to easily integrate SyneriseSDK software into your apps. For more info about Synerise visit the [Synerise Website](http://synerise.com).


# Requirements

* Xcode 9 and iOS SDK 11
* iOS 9.0+ target deployment
* Valid architectures: armv7, armv7s, arm64 devices and i386, x86_64 simulators


# Installation

## Install SyneriseSDK from CocoaPods

CocoaPods is a dependency manager for Cocoa projects. You can install it with the following command:

```
gem install cocoapods
```

Once you have CocoaPods installed you should add below code into your Podfile in Xcode:

```
platform :ios, '9.0'
use_frameworks!

target YOUR_PROJECT_TARGET do
  pod 'SyneriseSDK'
end
```


## Install SyneriseSDK from Carthage

Add following line to your Cartfile:
```
github "synerise/ios-sdk"
```

After that please update carthage:
```
carthage update
```

Go to your Xcode project's "General" settings. Open `<YOUR_XCODE_PROJECT_DIRECTORY>/Carthage/Build/iOS` in Finder and drag `SyneriseSDK.framework` to the "Embedded Binaries" section in Xcode.

Make sure `Copy items if needed` is selected and click `Finish`.


## Dependencies

SyneriseSDK requires Firebase with Messaging module so you have to import these dependencies for CocoaPods or Carthage.


# Quick Start

## Configuration

1. Under your application targets "Build Settings" configuration find the "Other Linker Flags" property and set it to "-ObjC".
2. In your application plist file (often called "Info.plist") add a row for "Required background modes" of type Array. It then needs: "App downloads content in response to push notifications".
3. You will need to change whitelist domains in your app by adding the following to your application's plist (often called "Info.plist"):

```
<key>NSAppTransportSecurity</key>
<dict>
	<key>NSAllowsArbitraryLoads</key><true/>
</dict>
```

4. You will need to import the SyneriseSDK header into the files that contain code relating to SyneriseSDK. 

**Swift:**
```
import SyneriseSDK
```

**Objective-C:**
```
<SyneriseSDK/SyneriseSDK.h>
```

In Objective-C, you can either include it in your AppName-Prefix.pch file.


## Initialize

First of all, you need to initialize Synerise iOS SDK with `SNRSynerise` class in your AppDelegate and provide `Business Api Key`, `Client Api Key`.
To get `Business Api Key` and  `Client Api Key`, please sign in to your Synerise account and visit [https://app.synerise.com/api](https://app.synerise.com/api).
Then, generate new `Api Key` for `Business Profile` audience and new `Api Key` for `Client` audience.

**Swift:**
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
	let businessProfileApiKey = "DAA341FD-B541-F894-A28D-77B2F9A8055B";
	let clientApiKey = "622376F8-4A8F-8B24-D7F9-070FA956E963";

	SNRSynerise.initialize(withBusinessProfileApiKey: businessProfileApiKey, andClientApiKey: clientApiKey)
}
```

**Objective-C:**
```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	static NSString *businessProfileApiKey = @"DAA341FD-B541-F894-A28D-77B2F9A8055B";
	static NSString *clientApiKey = @"622376F8-4A8F-8B24-D7F9-070FA956E963";

	[SNRSynerise initializeWithBusinessProfileApiKey:businessProfileApiKey andClientApiKey:clientApiKey];
}
```


## Setup

Configuration for SyneriseSDK should be completely resolved before end of `AppDelegate` `didFinishLaunchingWithOptions` method.

For example:

**Swift:**
```swift
let businessProfileApiKey = "DAA341FD-B541-F894-A28D-77B2F9A8055B";
let clientApiKey = "622376F8-4A8F-8B24-D7F9-070FA956E963";
       
SNRSynerise.initialize(withBusinessProfileApiKey: businessProfileApiKey, andClientApiKey: clientApiKey)
SNRSynerise.setDelegate(self)
        
SNRTracker.setLoggingEnabled(true)
SNRTracker.setAutoTrackMode(.fine)
        
SNRClient.setLoggingEnabled(true)
        
SNRProfile.setLoggingEnabled(true)

SNRInjector.setLoggingEnabled(true)
```

**Objective-C:**
```objective-c
static NSString *businessProfileApiKey = @"DAA341FD-B541-F894-A28D-77B2F9A8055B";
static NSString *clientApiKey = @"622376F8-4A8F-8B24-D7F9-070FA956E963";

[SNRSynerise initializeWithBusinessProfileApiKey:kBusinessProfileApiKey andClientApiKey:kClientApiKey];
[SNRSynerise setDelegate:self];
    
[SNRTracker setLoggingEnabled:YES];
[SNRTracker setAutoTrackMode:SNRTrackerAutoTrackModeFine];

[SNRClient setLoggingEnabled:YES];

[SNRProfile setLoggingEnabled:YES];

[SNRInjector setLoggingEnabled:YES];
```


### Implement SyneriseSDK delegate methods

You can specify your custom action when user clicks on your banner, welcome screen, simple push button or walkthrough page.<br>
There are 2 main actions user may choose so far - Open url and Deep link.<br>

**Swift:**
```swift
//MARK: SNRSyneriseDelegate
    
func syneriseUserInteraction(with url: URL) {
	// web url handled
	// sample implementation
        
	if UIApplication.shared.canOpenURL(url) {
		UIApplication.shared.open(url, options:[:], completionHandler:nil)
	}
}
    
func syneriseUserInteraction(withDeepLink deepLink: String) {
	// application deeplink handled
	// deeplink custom implementation
}
```

**Objective-C:**
```objective-c
#pragma mark - SNRSyneriseDelegate

- (void)syneriseUserInteractionWithURL:(NSURL*)url {
	// web url handled
	// sample implementation

    if ([[UIApplication sharedApplication] canOpenURL:url ]) {
        [[UIApplication sharedApplication] openURL:url options:nil completionHandler:^(BOOL success) {
            
        }];
    }
}

- (void)syneriseUserInteractionWithDeepLink:(NSString*)deepLink {
	// application deeplink handled
    // deeplink custom implementation
}
```


### Debug logs

You can enable debug logs for SyneriseSDK modules, such as: SNRTracker, SNRProfile, SNRClient, SNRInjector.
It is not recommended to use debug mode in release version of your app.

- SNRTracker: you can receive some simple logs about sending events (like success, failure etc.) by enabling debug mode, which is disabled by default.
- SNRProfile: you can receive some simple logs about profile actions (like registration etc.) by enabling debug mode, which is disabled by default.
- SNRClient: you can receive some simple logs about client actions (like login etc.) by enabling debug mode, which is disabled by default.
- SNRInjector: you can receive some simple logs about Injector actions (like walkthrough or welcome screen availability) by enabling debug mode, which is disabled by default.

It can be enabled by method `setLoggingEnabled` for each module. For example:

**Swift:**
```swift
SNRTracker.setLoggingEnabled(true)
```

**Objective-C:**
```objective-c
[SNRTracker setLoggingEnabled(YES];
```



## Event Tracking

Synerise SDK provides you with powerful features for User Activity Tracking that you can use within your mobile application.

### Auto-tracking

Auto-tracking is functionality available in our SDK that can attach to nearly everything within your application and log events automatically that you can then make use of within Synerise.

By default functionality is disabled and in order to enable it you need to use code like this:

**Swift:**
```swift
SNRTracker.setAutoTrackMode(.fine)
```

**Objective-C:**
```objective-c
[SNRTracker setAutoTrackMode:SNRTrackerAutoTrackModeFine];
```

#### Accepted values for setAutoTrackMode(mode) method:

**EAGER** - listeners are set to on touch events only<br>
**PLAIN** - listeners are set to on click events only<br>
**FINE** - listeners are attached to nearly everything in your app (even to activities and fragments `viewDidAppear:` method to record VisitedScreen events)<br>
**DISABLED** - listeners are disabled<br>


### Tracking events

To send some evens just use `SNRTracker` `send(YOUR_EVENT)` method:

**Swift:**
```swift
let event: SNRCustomEvent = SNRCustomEvent(label: "YOUR_LABEL", action: "YOUR_ACTION")
SNRTracker.send(event)
```

**Objective-C:**
```objective-c
SNRCustomEvent *event = [[SNRCustomEvent alloc] initWithLabel:@"YOUR_LABEL" action:@"YOUR_ACTION"];
[SNRTracker send:event];
```

You can also pass your custom parameters:

**Swift:**
```swift
let parameters: SNRTrackerParams = SNRTrackerParams.make {
	builder in
	
	builder.setString("John", forKey: "name")
	builder.setInt(27, forKey: "age")
	builder.setBool(true, forKey: "isGreat")
	builder.setDouble(384.28, forKey: "lastOrder")
	builder.setInt(10, forKey: "count")
	builder.setObject(SampleObject(), forKey: "someObject")
}
        
let event: SNRCustomEvent = SNRCustomEvent(label: "YOUR_LABEL", action: "YOUR_ACTION", andParams: parameters)
SNRTracker.send(event)
```

**Objective-C:**
```objective-c
SNRTrackerParams *parameters = [SNRTrackerParams makeWithBuilder:^(SNRTrackerParamsBuilder *builder) {
	[builder setString:@"John" forKey:@"name"];
	[builder setInt:27 forKey:@"age"];
	[builder setBool:YES forKey:@"isGreat"];
	[builder setDouble:384.28 forKey:@"lastOrder"];
	[builder setInt:10 forKey:@"count"];
	[builder setObject:[SampleObject new] forKey:@"someObject"];
}];
    
SNRCustomEvent *event = [[SNRCustomEvent alloc] initWithLabel:@"YOUR_LABEL" action:@"YOUR_ACTION" andParams:parameters];
[SNRTracker send:event];
```

Tracker caches and enqueues all your events locally, so they all will be send when available.

#### - Session Events
Group of events related to user's session.

##### SNRLoggedInEvent
Record a 'client logged in' event.

##### SNRLoggedOutEvent
Record a 'client logged out' event.

##### SNRRegisteredEvent
Record a 'client registered' event.

#### - Products Events
Group of events related to products and cart.

##### SNRAddedProductToFavoritesEvent
Record a 'client added product to favorites' event.

##### SNRAddedProductToCartEvent
Record a 'client added product to cart' event.

##### SNRRemovedProductFromCartEvent
Record a 'client removed product from cart' event.

#### - Transaction Events
Group of events related to user's transactions.

##### SNRCancelledTransactionEvent
Record a 'client cancelled transaction' event.

##### SNRCompletedTransactionEvent
Record a 'client completed transaction' event.

#### - Other Events
Group of uncategorized events related to user's location and actions.

##### SNRAppearedInLocationEvent
Record a 'client appeared in location' event.

##### SNRHitTimerEvent
Record a 'client hit timer' event. This could be used for profiling or activity time monitoring - you can send "hit timer" when your client starts doing something and send it once again when finishes, but this time with different time signature. Then you can use our analytics engine to measure e.g. average activity time.

##### SNRSearchedEvent
Record a 'client searched' event.

##### SNRSharedEvent
Record a 'client shared' event.

##### SNRVisitedScreenEvent
Record a 'client visited screen' event.

##### SNRCustomEvent
This is the only event which requires `action` field.

Log your custom data with TrackerParams class.


### Other features

#### `SNRTracker` `flushEvents` and `flushEventsWithCompletionHandler`
Flush method forces sending events from queue to server.

#### `SNRTracker` `setClientId(id)`
Synerise Client ID may be obtained after integration with Synerise API.


## Client

#### `Client` `logIn:password:deviceId:success:`
Sign in a client in order to obtain the JWT token, which could be used in subsequent requests.<br>
The token is currently valid for 1 hour and SDK will refresh token before each call if it is expiring (but not expired).<br>
Method requires valid and non-null email and password. Device ID is optional.<br>

#### `Client` `logOut`
Signing client out causes in generating new UUID for a new anonymous one.

#### `Client` `getAccountWithSuccess:failure:`
Use this method to get client's account information.<br>
This method pass `SNRClientAccountInformation` with success block execution.

#### `Client` `updateAccount:success:failure:`
Use this method to update client's account information.<br>
This method pass `SNRClientUpdateAccountContext` with success block execution.

#### `Client` `getTokenWithSuccess:failure:`
Get valid JWT login token.<br>
This method pass `NSString` token with success block execution.


You can also provide your custom Client `Authorization Configuration`. At this moment, configuration handles `Base URL` changes.

**Swift:**
```swift
let clientBaseURL: URL! = URL(string: "YOUR_BASE_URL")
let clientAuthConfig: SNRClientAuthConfig = SNRClientAuthConfig(baseURL: clientBaseURL)
SNRClient.initialize("YOUR_API_KEY", config: clientAuthConfig)
```

**Objective-C:**
```objective-c
NSURL *clientBaseURL = [NSURL URLWithString:@"YOUR_BASE_URL"];
SNRClientAuthConfig *clientAuthConfig = [[SNRClientAuthConfig alloc] initWithBaseURL:clientBaseURL];
[SNRClient initialize:@"YOUR_API_KEY" config:clientAuthConfig];
```


## Profile

#### `SNRProfile` `createClient:success:failure:`
Create a new client record if no identifier has been assigned for him before in Synerise.
This method requires `SNRCreateClientContext`

#### `SNRProfile` `registerClient:success:failure:`
Register new Client with email, password and optional data.
This method requires `SNRRegisterClientContext`

#### `SNRProfile` `updateClient:context:success:failure:`
Update client with ID and optional data.
This method requires `SNRUpdateClientContext`

#### `SNRProfile` `deleteClient:success:failure:`
Delete client with ID.
This method requires client's id.

#### `SNRProfile` `resetPassword:success:failure:`
Request client's password reset with email. Client will receive a token on provided email address in order to use Profile.confirmResetPassword(password, token).
This method requires `SNRClientPasswordResetRequestContext`

#### `SNRProfile` `confirmResetPassword:success:failure:`
Confirm client's password reset with new password and token provided by Profile.requestPasswordReset(email).
This method requires `SNRClientPasswordResetConfirmationContext`

#### `SNRProfile` `getTokenWithSuccess:failure:` 
Get valid JWT login token.<br>
This method pass `NSString` token with success block execution.


## Injector

Injector is designed to be simple to develop with, allowing you to integrate Synerise Mobile Content into your apps easily.<br>

### Configure Push Notifications

You have to run Firebase service and register for Apple Push Notifications. 

**Swift:**
```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
	FirebaseApp.configure()
        
	if #available(iOS 10, *) {
		UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
		//...
		}

    } else {
		let settings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
		application.registerUserNotificationSettings(settings)
	}
        
	application.registerForRemoteNotifications()
}

//MARK: MessagingDelegate

func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
	SNRProfile .register(forPush: fcmToken, success: {
		(success) in
		//...
	}) {
		(error) in
		//...
	}
}
```

**Objective-C:**
```objective-c
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [FIRApp configure];
    
    if (@available(iOS 10, *)) {
        [UNUserNotificationCenter currentNotificationCenter].delegate = self;
        UNAuthorizationOptions authOptions = (UNAuthorizationOptionAlert | UNAuthorizationOptionSound | UNAuthorizationOptionBadge);
        [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:authOptions completionHandler:^(BOOL granted, NSError * _Nullable error) {
            //...
        }];
    
    } else {
        UIUserNotificationType allNotificationTypes = (UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge);
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:allNotificationTypes categories:nil];
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    }
    
    [[UIApplication sharedApplication] registerForRemoteNotifications];
    //...
    //...
}

#pragma mark - FIRMessagingDelegate

- (void)messaging:(FIRMessaging *)messaging didReceiveRegistrationToken:(NSString *)fcmToken {
    [SNRProfile registerForPush:fcmToken success:^(BOOL isSuccess) {
        //...
    } failure:^(NSError * _Nonnull error) {
        //...
    }];
}

```


### Handling Push Notifications

**Swift:**
```swift
// iOS 9

func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
	let isSyneriseNotification: Bool = SNRSynerise.isSyneriseNotification(userInfo)
	if isSyneriseNotification {
		SNRSynerise.handleNotification(userInfo)

	} else {
		//...
	}
}
    
func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
	let isSyneriseNotification: Bool = SNRSynerise.isSyneriseNotification(userInfo)
	if isSyneriseNotification {
		SNRSynerise.handleNotification(userInfo)
		completionHandler(.noData)
            
	} else {
		//...
	}
}
    
func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification userInfo: [AnyHashable : Any], completionHandler: @escaping () -> Void) {
	let isSyneriseNotification: Bool = SNRSynerise.isSyneriseNotification(userInfo)
	if isSyneriseNotification {
		SNRSynerise.handleNotification(userInfo)
		completionHandler()
            
	} else {
		//...
	}
}

// iOS 10 and above
// MARK: UNUserNotificationCenterDelegate

@available(iOS 10.0, *)
func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
	let userInfo = response.notification.request.content.userInfo
        
	let isSyneriseNotification: Bool = SNRSynerise.isSyneriseNotification(userInfo)
	if isSyneriseNotification {
		SNRSynerise.handleNotification(userInfo)
		completionHandler()
            
	} else {
		//...
	}
}
    
@available(iOS 10.0, *)
func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
	let userInfo = notification.request.content.userInfo
        
	let isSyneriseNotification: Bool = SNRSynerise.isSyneriseNotification(userInfo)
	if isSyneriseNotification {
		SNRSynerise.handleNotification(userInfo)
		completionHandler(UNNotificationPresentationOptions.init(rawValue: 0))
            
	} else {
		//...
	}
}
```

**Objective-C:**
```objective-c
// iOS 9

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    BOOL isSyneriseNotification = [SNRSynerise isSyneriseNotification:userInfo];
    if (isSyneriseNotification) {
        [SNRSynerise handleNotification:userInfo];
        
    } else {
        //...
    }
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    BOOL isSyneriseNotification = [SNRSynerise isSyneriseNotification:userInfo];
    if (isSyneriseNotification) {
        [SNRSynerise handleNotification:userInfo];
        completionHandler(UIBackgroundFetchResultNoData);

    } else {
        //...
    }
}

- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler {
    BOOL isSyneriseNotification = [SNRSynerise isSyneriseNotification:userInfo];
    if (isSyneriseNotification) {
        [SNRSynerise handleNotification:userInfo];
        completionHandler();
    } else {
        //...
    }
}


// iOS 10 and above
// pragma mark - UNUserNotificationCenterDelegate

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler NS_AVAILABLE_IOS(10) {
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    
    BOOL isSyneriseNotification = [SNRSynerise isSyneriseNotification:userInfo];
    if (isSyneriseNotification) {
        [SNRSynerise handleNotification:userInfo];
        completionHandler();
        
    } else {
        //...
    }
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler NS_AVAILABLE_IOS(10) {
    NSDictionary *userInfo = notification.request.content.userInfo;
    
    BOOL isSyneriseNotification = [SNRSynerise isSyneriseNotification:userInfo];
    if (isSyneriseNotification) {
        [SNRSynerise handleNotification:userInfo];
        completionHandler(UNNotificationPresentationOptionNone);
        
    } else {
        //...
    }
}
```



### Mobile Content integration

#### Campaign banner
If app was invisible to user (minimized or destroyed) and campaign banner came in - Synerise SDK makes it neat and simple.
Simple push message is presented to the user and launcher activity is fired after click on push.
It is a prefect moment for you to pass this data and SDK will verify whether it is campaign banner
and if so, banner will be presented within the app.

#### Walkthrough
Walkthrough is called automatically during Injector initialization.<br>
The moment SDK gets successful response with walkthrough data, activity is started (naturally atop of activities stack).<br>
Note, that all intents to start new activities from your launcher activity are blocked in order to not cover walkthrough.
These intents are first distincted and then launched in order they were fired after walkthrough finishes.<br>
Note, that explained mechanism only works for support activities (extending AppCompatActivity) and it *does not* handle starting activities for result.<br>
Moreover, walkthrough with given id may be launched only once. This id is saved locally when activity is created and will be checked whether received walkthrough is not the same.

#### Welcome screen
Welcome screen is called automatically during SDK initialization.<br>
The moment SDK gets successful response with welcome screen data, activity is started (naturally atop of activities stack).<br>
Note, that all intents to start new activities from your launcher activity are blocked in order to not cover welcome screen.
These intents are first distincted and then launched in order they were fired after welcome screen finishes.<br>
Note, that explained mechanism only works for support activities (extending AppCompatActivity) and it *does not* handle starting activities for result.<br>
Moreover, welcome screen may be launched only once. Simple flag is saved locally when activity is created and SDK will not attempt to retrieve welcome screen from API again.



## Author
Synerise, developer@synerise.com. If you need support please feel free to contact us.