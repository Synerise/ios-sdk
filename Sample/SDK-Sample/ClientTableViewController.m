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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelTapped:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView endEditing:YES];

    if (indexPath.section == 1 && indexPath.row == 0) { [self loginClient]; }
    if (indexPath.section == 2 && indexPath.row == 0) { [self getClientAccount]; }
    if (indexPath.section == 3 && indexPath.row == 0) { [self updateClientAccount] ;}
    if (indexPath.section == 4 && indexPath.row == 0) { [self logoutClient]; }

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
                 NSLog(@"yes");
             } failure:^(NSError * _Nonnull error) {
                 NSLog(@"no");
             }];
}

- (void)getClientAccount {
    [SNRClient getAccountWithSuccess:^(SNRClientAccountInformation * _Nonnull information) {
        NSLog(@"yes");
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"no");
    }];
}

- (void)updateClientAccount {
    SNRClientUpdateAccountContext *context = [SNRClientUpdateAccountContext new];
    context.firstName = @"firstname";

    [SNRClient updateAccount:context success:^(BOOL isSuccess) {
        NSLog(@"yes");
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"no");
    }];
}

- (void)logoutClient {
    [SNRClient logOut];
}

@end
