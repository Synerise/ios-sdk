//
//  InjectorTableViewController.m
//  Sample
//
//  Created on 15/12/2017.
//  Copyright © 2017 Synerise. All rights reserved.
//

#import "InjectorTableViewController.h"
#import <SyneriseSDK/SyneriseSDK.h>

@interface InjectorTableViewController ()

@end

@implementation InjectorTableViewController

- (IBAction)cancelTapped:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) { [self showOnboarding]; }
    if (indexPath.section == 1 && indexPath.row == 0) { [self showWelcomeScreen]; }

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)showOnboarding {
    [SNRInjector showOnboardingIfPresentForBucket:<#Bucket Name#> completion:^{
        NSLog(@"finished");
    }];
}

- (void)showWelcomeScreen {
    [SNRInjector showWelcomeScreenIfPresentForBucket:<#Bucket Name#> completion:^{
        NSLog(@"finished");
    }];
}

@end
