//
//  ProfileTableViewController.m
//  Sample
//
//  Created on 30/11/2017.
//  Copyright © 2017 Synerise. All rights reserved.
//

#import "ProfileTableViewController.h"
#import <SyneriseSDK/SyneriseSDK.h>

@interface ProfileTableViewController ()

@end

@implementation ProfileTableViewController

- (IBAction)cancelTapped:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1 && indexPath.row == 0) { [self createClient]; }
    if (indexPath.section == 2 && indexPath.row == 0) { [self registerClient]; }
    if (indexPath.section == 3 && indexPath.row == 0) { [self deleteClient]; }
    if (indexPath.section == 4 && indexPath.row == 0) { [self updateClient]; }
    if (indexPath.section == 5 && indexPath.row == 0) { [self resetPassword]; }
    if (indexPath.section == 6 && indexPath.row == 0) { [self confirmResetPassword]; }
    if (indexPath.section == 7 && indexPath.row == 0) { [self registerForPushWithClientUUID]; }
    if (indexPath.section == 8 && indexPath.row == 0) { [self getProfileToken]; }

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Profile SDK methods
- (void)createClient {
    NSString *login = _emailTextField.text;
    
    SNRCreateClientContext *context = [[SNRCreateClientContext alloc] init];

    SNRClientAgreementsContext *agreements = [SNRClientAgreementsContext new];
    agreements.rfid = NO;
    agreements.push = YES;

    context.email = login;
    context.agreements = agreements;
    context.sex = [SNRClientSex male];

    [SNRProfile createClient:context success:^(BOOL isSuccess) {

    } failure:^(NSError * _Nonnull error) {

    }];
}

- (void)registerClient {
    NSString *login = _emailTextField.text;
    NSString *password = _passwordTextField.text;
    
    SNRRegisterClientContext *context = [[SNRRegisterClientContext alloc] init:login password:password];
    SNRClientAgreementsContext *agreements = [SNRClientAgreementsContext new];
    agreements.rfid = NO;
    agreements.push = YES;

    context.agreements = agreements;
    context.password = password;
    context.phone = @"123123123";

    [SNRProfile registerClient:context success:^(BOOL isSuccess) {

    } failure:^(NSError * _Nonnull error) {

    }];
}

- (void)deleteClient {
    [SNRProfile deleteClient:0 success:^(BOOL isSuccess) {

    } failure:^(NSError * _Nonnull error) {

    }];
}

- (void)updateClient {
    SNRUpdateClientContext *context = [[SNRUpdateClientContext alloc] init];
    context.email = @"invalid_email.";

    [SNRProfile updateClient:10 context:context success:^(BOOL isSuccess) {

    } failure:^(NSError * _Nonnull error) {

    }];
}

- (void)resetPassword {
    SNRClientPasswordResetRequestContext *context = [[SNRClientPasswordResetRequestContext alloc] init:@"test.email@example.com"];
    [SNRProfile resetPassword:context success:^(BOOL isSuccess) {

    } failure:^(NSError * _Nonnull error) {

    }];
}

- (void)confirmResetPassword {
    SNRClientPasswordResetConfirmationContext *context = [[SNRClientPasswordResetConfirmationContext alloc] init:@"testPassword1!" token:@"token"];
    [SNRProfile confirmResetPassword:context success:^(BOOL isSuccess) {

    } failure:^(NSError * _Nonnull error) {

    }];
}

- (void)registerForPushWithClientUUID {
    [SNRProfile registerForPush:@"test" success:^(BOOL isSuccess) {

    } failure:^(NSError * _Nonnull error) {

    }];
}

- (void)getProfileToken {
    [SNRProfile getTokenWithSuccess:^(NSString *token) {

    } failure:^(NSError *error) {

    }];
}

@end
