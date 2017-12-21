# SyneriseSDK

The Synerise iOS SDK is designed to be simple to develop with, allowing you to easily integrate SyneriseSDK software into your apps.

For more info about Synerise visit the [Synerise Website](http://synerise.com)

## Requirements

- iOS 9.0+
- Xcode 9.0+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate  into your Xcode project using CocoaPods, specify it in your `Podfile`:

```
pod 'SyneriseSDK', :git => 'https://github.com/Synerise/ios-sdk.git', :branch => 'v3.0.0'
```

Then, run the following command:

```bash
$ pod install
```

### Configuration

Under your application targets "Build Settings" configuration find the *Other Linker Flags* property and set it to `-ObjC`.

In your application plist file (often called `Info.plist`) add a row for `Required background modes` of type Array. It then needs:

`App downloads content in response to push notifications`

### Integration

Objective-C:
```Objective-C
#import "<SyneriseSDK/SyneriseSDK.h>"
```

Swift:
```Swift
import SyneriseSDK
```

## Setup SyneriseSDK

If you haven't done so already, login to Synerise to get your Synerise API Key(s).

To get `Api Key` sign in to your Synerise account and go to https://app.synerise.com/api/.
There you can generate API Keys for `Business Profile` and `Client`.

Then you have to initialize SyneriseSDK in `application:didFinishLaunchingWithOptions:` method in `AppDelegate`.

Please note that you may initialize only these modules in which you are interested in, eg. `SNRClient` and `SNRTracker`.

```Objective-C
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Initialize SNRTracker module
    [SNRTracker initialize:@"<your Business Profile API key>"];

    // Initialize SNRProfile module
    [SNRProfile initialize:@"<your Business Profile API key>"];

    // Initialize SNRClient module
    [SNRClient initialize:@"<your Client API key>"];

    // Initialize SNRInjector module
    [SNRInjector initialize:@"<your Business Profile API key>"];

    return YES;
}
```

## Event Tracker

You can log events from your mobile app to Synerise platform with SNRTracker class. You need to initialize SNRTracker with `[SNRTracker initialize:@"<your Business Profile API key>"];`. Initialize method can be called only once during whole application lifecycle.

### Sending events

To send Event simply use `SNRTracker` method
```Objective-C
[SNRTracker send: [[SNRCustomEvent alloc] initWithLabel:@"customLabel" action:@"customAction"]];
```

You can also pass your custom optional parameters to events:
```Objective-C
SNRTrackerParams *params = [SNRTrackerParams makeWithBuilder:^(SNRTrackerParamsBuilder * _Nonnull builder) {
    [builder setDouble:1.023 forKey:@"someKey"];
    [builder setObject:@[@{@"someKey":@"someValue"}] forKey:@"anotherKey"]; // note: must be JSON encodable object
    [builder setString:@"String" forKey:@"importantString"];
    [builder setInt:42 forKey:@"answer"];
}];

[SNRTracker send: [[SNRCustomEvent alloc] initWithLabel:@"customLabel" action:@"customAction" andParams:params];
```

### Logging

This method enables/disables console logs from `SNRTracker`. It is not recommended to use this debug mode in release version of your application.

```Objective-C
[SNRTracker setLoggingEnabled:YES]; // enables logging
```

### Flushing events
`SNRTracker` will handle sending events to Synerise at regular intervals with no other action being necessary to trigger this process. However, sometimes it may be required to to send events 'right now'. `SNRTracker` has `flushEventsWithCompletionHandler:` method to force send tracked events to Synerise servers.

```Objective-C
[SNRTracker flushEventsWithCompletionHandler:^{
    // called when sending events has ended
}];
```

## Events ###

### Session Events ###
Group of events related to user's session.

#### LoggedInEvent ####
Record a 'client logged in' event.
```Objective-C
SNREvent *event = [[SNRLoggedInEvent alloc] initWithLabel:@"yourLabel"];

[SNRTracker send:event];
```

#### LoggedOutEvent ####
Record a 'client logged out' event.
```Objective-C
SNREvent *event = [[SNRLoggedOutEvent alloc] initWithLabel:@"yourLabel"];

[SNRTracker send:event];
```

#### Registered Event ####
Record a 'client registered' event.
```Objective-C
SNREvent *event = [[SNRRegisteredEvent alloc] initWithLabel:@"yourLabel"];

[SNRTracker send:event];
```

### Products Events ###
Group of events related to products and cart.

#### AddedToCartEvent ####
Record a 'client added product to cart' event.
```Objective-C
SNRUnitPrice *price = [[SNRUnitPrice alloc] initWithAmount:10.99];
SNRAddedProductToCartEvent *event = [[SNRAddedProductToCartEvent alloc] initWithLabel:@"yourLabel" sku:@"sku" finalPrice:price quantity:12];

// additional product parameters
[event setProducer:@"Producer"];
[event setName:@"name"];
[event setRegularPrice:[[SNRUnitPrice alloc] initWithAmount:9.99]];

[SNRTracker send:event];
```

#### RemovedFromCartEvent ####
Record a 'client removed product from cart' event.
```Objective-C
SNRUnitPrice *price = [[SNRUnitPrice alloc] initWithAmount:10.99];
SNRRemovedProductFromCartEvent *event = [[SNRRemovedProductFromCartEvent alloc] initWithLabel:@"yourLabel" sku:@"sku" finalPrice:price quantity:12];

// additional product parameters
[event setProducer:@"Producer"];
[event setName:@"name"];
[event setRegularPrice:[[SNRUnitPrice alloc] initWithAmount:9.99]];

[SNRTracker send:event];
```

#### AddedToFavoritesEvent ####
Record a 'client added product to favorites' event.
```Objective-C
SNREvent *event = [[SNRAddedProductToFavoritesEvent alloc] initWithLabel:@"yourLabel"];

[SNRTracker send:event];
```

### Transaction Events ###
Group of events related to user's transactions.

#### CompletedTransactionEvent ####
Record a 'client completed transaction' event.
```Objective-C
// setup product (optional)
SNREventProduct *product = [SNREventProduct new];
product.sku = @"completedProduct";
product.tax = 0.23;
product.regularPrice = [[SNRUnitPrice alloc] initWithAmount:10.23];

SNRCompletedTransactionEvent *event = [[SNRCompletedTransactionEvent alloc] initWithLabel:@"yourLabel"];
[event setProducts:@[product]];
[event setOrderId:@"completedOrderId"];
[event setRecordedAt:[NSDate date]];

[SNRTracker send:event];
```

#### CancelledTransactionEvent ####
Record a 'client cancelled transaction' event.
```Objective-C
// setup product (optional)
SNREventProduct *product = [SNREventProduct new];
product.sku = @"cancelledProduct";
product.tax = 0.08;
product.quantity = 20;
product.regularPrice = [[SNRUnitPrice alloc] initWithAmount:230.23];

SNRCancelledTransactionEvent *event = [[SNRCancelledTransactionEvent alloc] initWithLabel:@"yourLabel"];
[event setProducts:@[product]];
[event setOrderId:@"cancelledOrderId"];
[event setRecordedAt:[NSDate date]];

[SNRTracker send:event];
```

### Other Events ###
Group of uncategorized events related to user's location and actions.

#### AppearedInLocationEvent ####
Record a 'client appeared in location' event. You have to provide user's location by your self, using `CoreLocation`.
```Objective-C
CLLocation *loc; // location object
SNREvent *event = [[SNRAppearedInLocationEvent alloc] initWithLabel:@"yourLabel" andLocation:loc];

[SNRTracker send:event];
```

#### HitTimerEvent ###
Record a 'client hit timer' event. This could be used for profiling or activity time monitoring - you can send "hit timer" when your client starts doing something and send it once again when finishes, but this time with different time signature. Then you can use our analytics engine to measure e.g. average activity time.
```Objective-C
SNREvent *event = [[SNRHitTimerEvent alloc] initWithLabel:@"yourLabel"];

[SNRTracker send:event];
```

#### SearchedEvent ###
Record a 'client searched' event.
```Objective-C
SNREvent *event = [[SNRSearchedEvent alloc] initWithLabel:@"yourLabel"];

[SNRTracker send:event];
```

#### SharedEvent ###
Record a 'client shared' event.
```Objective-C
SNREvent *event = [[SNRSharedEvent alloc] initWithLabel:@"yourLabel"];

[SNRTracker send:event];
```

#### VisitedScreenEvent ###
Record a 'client visited screen' event.
```Objective-C
SNREvent *event = [[SNRVisitedScreenEvent alloc] initWithLabel:@"yourLabel"];

[SNRTracker send:event];
```

### Custom Event ###
This is the only event which requires `action` field. 
```Objective-C
SNREvent *event = [[SNRCustomEvent alloc] initWithLabel:@"custom" action: @"customAction"];

[SNRTracker send:event];
```

## Client
`SNRClient` module is responsible for integrating with Synerise Client API. You need to initialize SNRClient with `[SNRClient initialize:@"<your Client API key>"];`. Initialize method can be called only once during whole application lifecycle.

### Login ###
Log in a client in order to obtain the JWT token, which could be used in subsequent requests. The token is valid for 1 hour. This SDK will refresh token before each call if it is expiring (but not expired).
Method requires valid and non-null email and password. DeviceID is optional. // todo: what is deviceId
```Objective-C
[SNRClient logIn:login password:password deviceId:nil 
	success:^(BOOL isSuccess) {
		// successfully logged in
	} failure:^(NSError * _Nonnull error) {
		// error occured
	}];
```

### Get Account ###
Use this method to get client's account information.
```Objective-C
[SNRClient getAccountWithSuccess:^(SNRClientAccountInformation * _Nonnull information) {
	// successfully retrieved account information
} failure:^(NSError * _Nonnull error) {
	// error occured
}];
```

### Update Account ###
Use this method to update client's account information. Not provided fields are not modified.

This methods requires `SNRClientUpdateAccountContext` object which is initialized as follows:
```Objective-C
SNRClientUpdateAccountContext *context = [SNRClientUpdateAccountContext new];
context.firstName = @"firstname";
context.lastName = @"lastname";
context.city = @"newCity";
```
Execute account update:
```Objective-C
[SNRClient updateAccount:context success:^(BOOL isSuccess) {
	// successfully updated client account
} failure:^(NSError * _Nonnull error) {
	// error occured
}];
```

### Logout
Logs out client
```Objective-C
[SNRClient logOut];
```

### Get token
Retrieves currrent Client authentication token. This method provides valid token if Client is logged in and current token is not expired.
```Objective-C
[SNRClient getTokenWithSuccess:^(NSString *token) {
    // successfully retrieved client authentication token
} failure:^(NSError * _Nonnull error) {
    // error occured
}];
```

### Logging ###
This method enables/disables console logs from `SNRClient`. It is not recommended to use this debug mode in release version of your application.
```Objective-C
[SNRClient setLoggingEnabled:YES] // enables logging
```

## Profile
`SNRProfile` module is responsible for integrating with Synerise Profile API. You need to initialize SNRProfile with `[SNRClient initialize:@"<your Business Profile API key>"];`. Initialize method can be called only once during whole application lifecycle.

### Create client ###
Create a new client record if no Synerise identifier has been assigned for him before. Not provided fields are not modified.
```Objective-C
SNRClientAgreementsContext *agreements = [SNRClientAgreementsContext new];
agreements.rfid = NO;
agreements.push = YES;

SNRCreateClientContext *context = [[SNRCreateClientContext alloc] init];
context.email = @"test.email@example.com";
context.agreements = agreements;
context.sex = [SNRClientSex male];
```
Execute client creation:
```Objective-C
[SNRProfile createClient:context success:^(BOOL isSuccess) {
	// successfully created client
} failure:^(NSError * _Nonnull error) {
	// error occured
}];
```

### Register client ###
Register new Client with email, password and optional data. Not provided fields are not modified.
```Objective-C
SNRClientAgreementsContext *agreements = [SNRClientAgreementsContext new];
agreements.rfid = NO;
agreements.push = YES;

SNRRegisterClientContext *context = [[SNRRegisterClientContext alloc] init:@"test.email2@example.com" password:@"testPass1!"];
context.agreements = agreements;
context.sex = [SNRClientSex male];
```
Execute client registration:
```Objective-C
[SNRProfile registerClient:context success:^(BOOL isSuccess) {
	// successfully registered client
} failure:^(NSError * _Nonnull error) {
	// error occured
}];
```

### Update client ###
Update client with provided ID and optional data.
```Objective-C
SNRUpdateClientContext *context = [[SNRUpdateClientContext alloc] init];
context.firstName = @"newName";
```
Execute client update:
```Objective-C
    [SNRProfile updateClient:10 context:context success:^(BOOL isSuccess) {
        NSLog(@"yes");
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"noo");
    }];
```

### Delete client ###
Delete client with provided ID.
```Objective-C
[SNRProfile deleteClient:1000 success:^(BOOL isSuccess) {
    // successfully deleted client
} failure:^(NSError * _Nonnull error) {
    // error occured
}];
```

### Request password reset ###
Request client's password reset with email. Client will receive a token on a provided email address in order to use `[SNRProfile confirmResetPassword:success:failure]` method.
```Objective-C
SNRClientPasswordResetRequestContext *context = [[SNRClientPasswordResetRequestContext alloc] init:@"test.email@example.com"];

[SNRProfile resetPassword:context success:^(BOOL isSuccess) {
	// successfully sent password reset request
} failure:^(NSError * _Nonnull error) {
	// error occured
}];
```

### Confirm password reset ###
Confirm client's password reset with new password and token provided sent in an e-mail sent by calling `[SNRProfile resetPassword:success:failure]` method;
```Objective-C
SNRClientPasswordResetConfirmationContext *context = [[SNRClientPasswordResetConfirmationContext alloc] init:@"testPassword1!" token:@"token"];

[SNRProfile confirmResetPassword:context success:^(BOOL isSuccess) {
	// successfully reset password
} failure:^(NSError * _Nonnull error) {
	// error occured
}];
```

### Register for push
Registers app for push notifications in Synerise.
```Objective-C
[SNRProfile registerForPush:@"deviceToken/fcmToken" success:^(BOOL isSuccess) {
    // successfully registered for push
} failure:^(NSError * _Nonnull error) {
    // error occured
}];
```

### Register for push with clientId
Registers app identified by `clientId` for push notifications in Synerise.
```Objective-C
[SNRProfile registerForPush:@"deviceToken/fcmToken" clientId:123 success:^(BOOL isSuccess) {
    // successfully registered for push
} failure:^(NSError * _Nonnull error) {
    // error occured
}];
```

### Get token
Retrieves currrent Profile authentication token. This method provides valid token if Profile is correctly initialized.
```Objective-C
[SNRProfile getTokenWithSuccess:^(NSString *token) {
    // successfully retrieved profile authentication token
} failure:^(NSError * _Nonnull error) {
    // error occured
}];
```

### Logging ###
This method enables/disables console logs from `SNRProfile`. It is not recommended to use this debug mode in release version of your application.
```Objective-C
[SNRProfile setLoggingEnabled:YES] // enables logging
```

## Injector

### Banners

To integrate handling Mobile Content banners you have to register your app for push notifications first. Incoming push notifications have to be passed to `SNRInjector`. `SNRInjector` will then handle payload and display banner if provided payload is correctly validated.

If payload validation is not successful `SNRInjector` will print a console error.

#### Handling push notifications

You have to pass incoming push notification payload to `SNRInjector`

##### iOS 10 and higher

`UNUserNotificationCenterDelegate`:

Objective-C:
```Objective-C
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void (^)(void))completionHandler {
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    [SNRInjector handlePushNotification:userInfo];

    // call completion handler after handling push notification
    completionHandler();
}

- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    NSDictionary *userInfo = notification.request.content.userInfo;
    [SNRInjector handlePushNotification:userInfo];

    // call completion handler after handling push notification with desired UNNotificationPresentationOption
    completionHandler(UNNotificationPresentationOption);
}
```


Swift:
```Swift
@available(iOS 10.0, *)
func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    let userInfo = response.notification.request.content.userInfo
    SNRInjector.handlePushNotification(userInfo)

    // call completion handler after handling push notification
    completionHandler()
}

@available(iOS 10.0, *)
func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    let userInfo = notification.request.content.userInfo
    SNRInjector.handlePushNotification(userInfo)

    // call completion handler after handling push notification with desired UNNotificationPresentationOption
    completionHandler(UNNotificationPresentationOptions)
}
```

##### iOS 9
Objective-C:
```Objective-C
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [SNRInjector handlePushNotification:userInfo];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    [SNRInjector handlePushNotification:userInfo];

    // call completion handler after handling push notification with desired UIBackgroundFetchResult
    completionHandler(UIBackgroundFetchResult);
}
```

Swift:
```Swift
func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
    SNRInjector.handlePushNotification(userInfo)
}

func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    SNRInjector.handlePushNotification(userInfo)

    // call completion handler after handling push notification with desired UIBackgroundFetchResult
    completionHandler(UIBackgroundFetchResult)
}
```

#### Welcome Screen and Onboarding

Welcome Screen and Onboarding methods are called on demand.

Objective-C:
```Objective-C
[SNRInjector showOnboardingIfPresentForBucket:@"<your bucket name>" completion:^{
    // completion handler to be executed when onboarding has finished presenting or an error occured
}];

[SNRInjector showWelcomeScreenIfPresentForBucket:@"<your bucket name>" completion:^{
    // completion handler to be executed when welcome screen has finished presenting or an error occured
}];
```

### Logging

This method enables/disables console logs from `SNRInjector`. It is not recommended to use this debug mode in release version of your application.

```Objective-C
[SNRTracker setLoggingEnabled:YES]; // enables logging
```

## Author

Synerise, developer@synerise.com. If you need support please feel free and contact us.

## License

InjectorSDK is available under the MIT license. See the LICENSE file for more info.