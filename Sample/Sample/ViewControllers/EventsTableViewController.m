//
//  EventsTableViewController.m
//  Sample
//
//  Created on 28/11/2017.
//  Copyright © 2017 Synerise. All rights reserved.
//

#import "EventsTableViewController.h"
#import <SyneriseSDK/SyneriseSDK.h>

@interface EventsTableViewController ()

@end

@implementation EventsTableViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // custom
    if (indexPath.section == 0 && indexPath.row == 0) { [self sendCustomEvent]; }

    // product
    if (indexPath.section == 2 && indexPath.row == 0) { [self sendAddedToCartEvent]; }
    if (indexPath.section == 2 && indexPath.row == 1) { [self sendRemovedFromCartEvent]; }
    if (indexPath.section == 2 && indexPath.row == 2) { [self sendAddedToFavoritesEvent]; }

    // transaction
    if (indexPath.section == 3 && indexPath.row == 0) { [self sendCompletedTransactionEvent]; }
    if (indexPath.section == 3 && indexPath.row == 1) { [self sendCancelledTransactionEvent]; }

    // session
    if (indexPath.section == 4 && indexPath.row == 0) { [self sendLoggedInEvent]; }
    if (indexPath.section == 4 && indexPath.row == 1) { [self sendLoggedOutEvent]; }
    if (indexPath.section == 4 && indexPath.row == 2) { [self sendRegisteredEvent]; }

    // push
    if (indexPath.section == 5 && indexPath.row == 0) { [self sendPushClickedEvent]; }
    if (indexPath.section == 5 && indexPath.row == 1) { [self sendPushViewedEvent]; }
    if (indexPath.section == 5 && indexPath.row == 2) { [self sendPushCancelledEvent]; }

    // other
    if (indexPath.section == 6 && indexPath.row == 0) { [self sendAppearedInLocationEvent]; }
    if (indexPath.section == 6 && indexPath.row == 1) { [self sendHitTimerEvent]; }
    if (indexPath.section == 6 && indexPath.row == 2) { [self sendSearchedEvent]; }
    if (indexPath.section == 6 && indexPath.row == 3) { [self sendSharedEvent]; }
    if (indexPath.section == 6 && indexPath.row == 4) { [self sendVisitedScreenEvent]; }

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Custom events
- (void)sendCustomEvent {
    SNREvent *event = [[SNRCustomEvent alloc] initWithLabel:@"custom" action: @"customAction"];
    [SNRTracker send:event];
}

#pragma mark - Product events
- (void)sendAddedToCartEvent {
    SNRUnitPrice *price = [[SNRUnitPrice alloc] initWithAmount:10.99];
    SNRAddedProductToCartEvent *event = [[SNRAddedProductToCartEvent alloc] initWithLabel:@"yourLabel" sku:@"sku" finalPrice:price quantity:12];

    // additional parameters
    [event setProducer:@"Producer"];
    [event setName:@"name"];
    [event setRegularPrice:[[SNRUnitPrice alloc] initWithAmount:9.99]];

    [SNRTracker send:event];
}

- (void)sendRemovedFromCartEvent {
    SNRUnitPrice *price = [[SNRUnitPrice alloc] initWithAmount:10.99];
    SNRRemovedProductFromCartEvent *event = [[SNRRemovedProductFromCartEvent alloc] initWithLabel:@"yourLabel" sku:@"sku" finalPrice:price quantity:12];

    // additional parameters
    [event setProducer:@"Producer"];
    [event setName:@"name"];
    [event setRegularPrice:[[SNRUnitPrice alloc] initWithAmount:9.99]];

    [SNRTracker send:event];
}

- (void)sendAddedToFavoritesEvent {
    SNREvent *event = [[SNRAddedProductToFavoritesEvent alloc] initWithLabel:@"label"];

    [SNRTracker send:event];
}

#pragma mark - Transaction events
- (void)sendCompletedTransactionEvent {
    // setup product (optional)
    SNREventProduct *product = [SNREventProduct new];
    product.sku = @"completedProduct";
    product.tax = 0.23;
    product.regularPrice = [[SNRUnitPrice alloc] initWithAmount:10.23];

    SNRCompletedTransactionEvent *event = [[SNRCompletedTransactionEvent alloc] initWithLabel:@"label"];
    [event setProducts:@[product]];
    [event setOrderId:@"completedOrderId"];
    [event setRecordedAt:[NSDate date]];

    [SNRTracker send:event];
}

- (void)sendCancelledTransactionEvent {
    // setup product (optional)
    SNREventProduct *product = [SNREventProduct new];
    product.sku = @"cancelledProduct";
    product.tax = 0.08;
    product.quantity = 20;
    product.regularPrice = [[SNRUnitPrice alloc] initWithAmount:230.23];

    SNRCancelledTransactionEvent *event = [[SNRCancelledTransactionEvent alloc] initWithLabel:@"label"];
    [event setProducts:@[product]];
    [event setOrderId:@"cancelledOrderId"];
    [event setRecordedAt:[NSDate date]];

    [SNRTracker send:event];
}

#pragma mark - Session events
- (void)sendLoggedInEvent {
    SNRTrackerParams *params = [SNRTrackerParams makeWithBuilder:^(SNRTrackerParamsBuilder * _Nonnull builder) {
        [builder setDouble:1.023 forKey:@"someKey"];
        [builder setObject:@[@{@"someKey":@"someValue"}] forKey:@"anotherKey"];
        [builder setString:@"String" forKey:@"importantString"];
        [builder setInt:42 forKey:@"answer"];
    }];

    SNREvent *event = [[SNRLoggedInEvent alloc] initWithLabel:@"label" andParams:params];
    [SNRTracker send:event];
}

- (void)sendLoggedOutEvent {
    SNREvent *event = [[SNRLoggedOutEvent alloc] initWithLabel:@"label" andParams:nil];
    [SNRTracker send:event];
}

- (void)sendRegisteredEvent {
    SNREvent *event = [[SNRRegisteredEvent alloc] initWithLabel:@"label"];
    [SNRTracker send:event];
}

#pragma mark - Push events
- (void)sendPushClickedEvent {
    SNREvent *event = [[SNRPushClickedEvent alloc] initWithLabel:@"label"];
    [SNRTracker send:event];
}

- (void)sendPushViewedEvent {
    SNREvent *event = [[SNRPushViewedEvent alloc] initWithLabel:@"label"];
    [SNRTracker send:event];
}

- (void)sendPushCancelledEvent {
    SNREvent *event = [[SNRCancelledPushEvent alloc] initWithLabel:@"label"];
    [SNRTracker send:event];
}

#pragma mark - Other events
- (void)sendAppearedInLocationEvent {
    CLLocation *loc = [[CLLocation alloc] initWithLatitude:10.032 longitude:10.523];
    SNREvent *event = [[SNRAppearedInLocationEvent alloc] initWithLabel:@"label" andLocation:loc];

    [SNRTracker send:event];
}

- (void)sendHitTimerEvent {
    SNRTrackerParams *params = [SNRTrackerParams makeWithBuilder:^(SNRTrackerParamsBuilder * _Nonnull builder) {
        [builder setDouble:1.023 forKey:@"someKey"];
        [builder setObject:@[@{@"someKey":@"someValue"}] forKey:@"anotherKey"];
        [builder setString:@"String" forKey:@"importantString"];
        [builder setInt:42 forKey:@"answer"];
    }];

    SNREvent *event = [[SNRHitTimerEvent alloc] initWithLabel:@"label" andParams:params];
    [SNRTracker send:event];
}

- (void)sendSearchedEvent {
    SNREvent *event = [[SNRSearchedEvent alloc] initWithLabel:@"label"];

    [SNRTracker send:event];
}

- (void)sendSharedEvent {
    SNRTrackerParams *params = [SNRTrackerParams makeWithBuilder:^(SNRTrackerParamsBuilder * _Nonnull builder) {
        [builder setDouble:1.023 forKey:@"someKey"];
        [builder setObject:@[@{@"someKey":@"someValue"}] forKey:@"anotherKey"];
        [builder setString:@"String" forKey:@"importantString"];
        [builder setInt:42 forKey:@"answer"];
    }];

    SNREvent *event = [[SNRSharedEvent alloc] initWithLabel:@"label" andParams:params];
    [SNRTracker send:event];
}

- (void)sendVisitedScreenEvent {
    SNREvent *event = [[SNRVisitedScreenEvent alloc] initWithLabel:@"label"];
    [SNRTracker send:event];
}

- (IBAction)forceSendEvents:(id)sender {
    [SNRTracker flushEventsWithCompletionHandler:^{

    }];
}


@end
