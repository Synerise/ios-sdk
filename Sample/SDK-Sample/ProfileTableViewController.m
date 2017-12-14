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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) { [self createClient]; }
    if (indexPath.section == 1 && indexPath.row == 0) { [self registerClient]; }
    if (indexPath.section == 2 && indexPath.row == 0) { [self deleteClient]; }
    if (indexPath.section == 3 && indexPath.row == 0) { [self updateClient]; }
    if (indexPath.section == 4 && indexPath.row == 0) { [self resetPassword]; }
    if (indexPath.section == 5 && indexPath.row == 0) { [self confirmResetPassword]; }
    if (indexPath.section == 6 && indexPath.row == 0) { [self registerForPushWithClientId]; }
    if (indexPath.section == 7 && indexPath.row == 0) { [self registerForPushWithClientUUID]; }

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Profile SDK methods
- (void)createClient {
    SNRCreateClientContext *context = [[SNRCreateClientContext alloc] init];

    SNRClientAgreementsContext *agreements = [SNRClientAgreementsContext new];
    agreements.rfid = NO;
    agreements.push = YES;

    context.email = @"test.email2@example.com";
    context.agreements = agreements;
    context.sex = [SNRClientSex male];

    [SNRProfile createClient:context success:^(BOOL isSuccess) {
        NSLog(@"yes");
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"noo");
    }];
}

- (void)registerClient {
    SNRRegisterClientContext *context = [[SNRRegisterClientContext alloc] init:@"test.email2@example.com" password:@"testPass1!"];
    SNRClientAgreementsContext *agreements = [SNRClientAgreementsContext new];
    agreements.rfid = NO;
    agreements.push = YES;

    context.agreements = agreements;
    context.password = @"testPass1!";
    context.phone = @"123123123";

    [SNRProfile registerClient:context success:^(BOOL isSuccess) {
        NSLog(@"yes");
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"noo");
    }];
}

- (void)deleteClient {
    [SNRProfile deleteClient:0 success:^(BOOL isSuccess) {
        NSLog(@"yes");
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"noo");
    }];
}

- (void)updateClient {
    SNRUpdateClientContext *context = [[SNRUpdateClientContext alloc] init];
    context.email = @"invalid_email.";

    [SNRProfile updateClient:10 context:context success:^(BOOL isSuccess) {
        NSLog(@"yes");
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"noo");
    }];

}

- (void)resetPassword {
    SNRClientPasswordResetRequestContext *context = [[SNRClientPasswordResetRequestContext alloc] init:@"test.email@example.com"];
    [SNRProfile resetPassword:context success:^(BOOL isSuccess) {
        NSLog(@"yes");
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"noo");
    }];
}

- (void)confirmResetPassword {
    SNRClientPasswordResetConfirmationContext *context = [[SNRClientPasswordResetConfirmationContext alloc] init:@"testPassword1!" token:@"token"];
    [SNRProfile confirmResetPassword:context success:^(BOOL isSuccess) {
        NSLog(@"yes");
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"noo");
    }];
}

- (void)registerForPushWithClientId {
    [SNRProfile registerForPush:@"test" clientId:123 success:^(BOOL isSuccess) {
        NSLog(@"yes");
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"noo");
    }];
}

- (void)registerForPushWithClientUUID {
    [SNRProfile registerForPush:@"test" success:^(BOOL isSuccess) {
        NSLog(@"yes");
    } failure:^(NSError * _Nonnull error) {
        NSLog(@"noo");
    }];
}
@end
