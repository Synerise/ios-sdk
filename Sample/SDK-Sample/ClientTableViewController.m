//
//  ClientTableViewController.m
//  Sample
//
//  Created on 30/11/2017.
//  Copyright © 2017 Synerise. All rights reserved.
//

#import <SyneriseSDK/SyneriseSDK.h>
#import "ClientTableViewController.h"

@interface ClientTableViewController ()

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation ClientTableViewController

- (IBAction)cancelTapped:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView endEditing:YES];

    if (indexPath.section == 1 && indexPath.row == 0) { [self loginClient]; }
    if (indexPath.section == 2 && indexPath.row == 0) { [self getClientAccount]; }
    if (indexPath.section == 3 && indexPath.row == 0) { [self updateClientAccount] ;}
    if (indexPath.section == 4 && indexPath.row == 0) { [self getClientToken]; }
    if (indexPath.section == 5 && indexPath.row == 0) { [self logoutClient]; }

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Client SDK methods
- (void)loginClient {
    NSString *login = _emailTextField.text;
    NSString *password = _passwordTextField.text;
    [SNRClient logIn:login
            password:password
            deviceId:nil
             success:^(BOOL isSuccess) {
                 NSLog(@"Success!");
             } failure:^(NSError * _Nonnull error) {
                 NSLog(@"Failure: %@", error);
             }];
}

- (void)getClientAccount {
    [SNRClient getAccountWithSuccess:^(SNRClientAccountInformation * _Nonnull information) {
        NSLog(@"Success!");
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"Failure: %@", error);
    }];
}

- (void)updateClientAccount {
    SNRClientUpdateAccountContext *context = [SNRClientUpdateAccountContext new];
    context.firstName = @"firstname";

    [SNRClient updateAccount:context success:^(BOOL isSuccess) {
        NSLog(@"Success!");
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"Failure: %@", error);
    }];
}

- (void)getClientToken {
    [SNRClient getTokenWithSuccess:^(NSString *token) {
        NSLog(@"Success");
    } failure:^(NSError *error) {
        NSLog(@"Failure: %@", error);
    }];
}

- (void)logoutClient {
    [SNRClient logOut];
}

@end
