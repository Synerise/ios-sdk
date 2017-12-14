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

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // custom
    if (indexPath.section == 0 && indexPath.row == 0) { [self sendCustomEvent]; }

    // product
    if (indexPath.section == 1 && indexPath.row == 0) { [self sendAddedToCartEvent]; }
    if (indexPath.section == 1 && indexPath.row == 1) { [self sendRemovedFromCartEvent]; }
    if (indexPath.section == 1 && indexPath.row == 2) { [self sendAddedToFavoritesEvent]; }

    // transaction
    if (indexPath.section == 2 && indexPath.row == 0) { [self sendCompletedTransactionEvent]; }
    if (indexPath.section == 2 && indexPath.row == 1) { [self sendCancelledTransactionEvent]; }

    // session
    if (indexPath.section == 3 && indexPath.row == 0) { [self sendLoggedInEvent]; }
    if (indexPath.section == 3 && indexPath.row == 1) { [self sendLoggedOutEvent]; }
    if (indexPath.section == 3 && indexPath.row == 2) { [self sendRegisteredEvent]; }

    // push
    if (indexPath.section == 4 && indexPath.row == 0) { [self sendPushClickedEvent]; }
    if (indexPath.section == 4 && indexPath.row == 1) { [self sendPushViewedEvent]; }
    if (indexPath.section == 4 && indexPath.row == 2) { [self sendPushCancelledEvent]; }

    // other
    if (indexPath.section == 5 && indexPath.row == 0) { [self sendAppearedInLocationEvent]; }
    if (indexPath.section == 5 && indexPath.row == 1) { [self sendHitTimerEvent]; }
    if (indexPath.section == 5 && indexPath.row == 2) { [self sendSearchedEvent]; }
    if (indexPath.section == 5 && indexPath.row == 3) { [self sendSharedEvent]; }
    if (indexPath.section == 5 && indexPath.row == 4) { [self sendVisitedScreenEvent]; }

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Custom events
- (void)sendCustomEvent {
    SNREvent *event = [[SNRCustomEvent alloc] initWithLabel:@"custom" action: @"customAction"];
    [SNRTracker send:event];
}

#pragma mark - Product events
- (void)sendAddedToCartEvent {
    SNREvent *event;
    SNRUnitPrice *price = [[SNRUnitPrice alloc] initWithAmount:10.99];
    event = [[SNRAddedProductToCartEvent alloc] initWithLabel:@"label" sku:@"sku" finalPrice:price quantity:12 andParams:nil];
    [(SNRAddedProductToCartEvent *)event setDiscountedPrice:[[SNRUnitPrice alloc] initWithAmount:10.0]];
    [SNRTracker send: event];
}

- (void)sendRemovedFromCartEvent {
    SNREvent *event;
    SNRUnitPrice *price = [[SNRUnitPrice alloc] initWithAmount:10.99];
    event = [[SNRRemovedProductFromCartEvent alloc] initWithLabel:@"label" sku:@"sku" finalPrice:price quantity:53 andParams:nil];
    [(SNRRemovedProductFromCartEvent *)event setDiscountedPrice:[[SNRUnitPrice alloc] initWithAmount:19.99]];
    [SNRTracker send:event];
}

- (void)sendAddedToFavoritesEvent {
    SNREvent *event = [[SNRAddedProductToFavoritesEvent alloc] initWithLabel:@"label"];
    [SNRTracker send:event];
}

#pragma mark - Transaction events
- (void)sendCompletedTransactionEvent {
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
    SNREvent *event = [[SNRLoggedInEvent alloc] initWithLabel:@"label"];
    [SNRTracker send:event];
}

- (void)sendLoggedOutEvent {
    SNREvent *event = [[SNRLoggedOutEvent alloc] initWithLabel:@"label"];
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
    SNREvent *event = [[SNRHitTimerEvent alloc] initWithLabel:@"label"];
    [SNRTracker send:event];
}

- (void)sendSearchedEvent {
    SNREvent *event = [[SNRSearchedEvent alloc] initWithLabel:@"label"];

    [SNRTracker send:event];
}

- (void)sendSharedEvent {
    SNREvent *event = [[SNRSharedEvent alloc] initWithLabel:@"label"];
    [SNRTracker send:event];
}

- (void)sendVisitedScreenEvent {
    SNREvent *event = [[SNRVisitedScreenEvent alloc] initWithLabel:@"label"];
    [SNRTracker send:event];
}

- (IBAction)forceSendEvents:(id)sender {
    [SNRTracker flushEvents];
}
- (IBAction)cancelTapped:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

@end
