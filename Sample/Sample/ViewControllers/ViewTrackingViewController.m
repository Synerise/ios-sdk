//
//  AutoTrackingPresentationViewController.m
//  Sample
//
//  Created by BPOL1179 on 19.03.2018.
//  Copyright © 2018 Synerise. All rights reserved.
//

#import "ViewTrackingViewController.h"

@interface ViewTrackingViewController ()

@end

@implementation ViewTrackingViewController

- (void)viewDidLoad {
    NSArray *preferredLanguages = [NSLocale preferredLanguages];
    NSString *preferredLanguageIdentifier = preferredLanguages.firstObject;
    NSLocale *preferredLocale = [NSLocale localeWithLocaleIdentifier:preferredLanguageIdentifier];

    [self.dateAndTimeDatePicker setLocale:preferredLocale];
    [self.dateDatePicker setLocale:preferredLocale];
    [self.timeDatePicker setLocale:preferredLocale];
}

- (IBAction)buttonTapped:(id)sender {
    
}

- (IBAction)switchChanged:(id)sender {
    
}

- (IBAction)segmentedControlChanged:(id)sender {
    
}

- (IBAction)sliderChanged:(id)sender {
    
}

- (IBAction)stepperChanged:(id)sender {
    self.stepperValueLabel.text = [NSString stringWithFormat:@"%li", (NSInteger)((UIStepper*)sender).value];
}

- (IBAction)datePickerChanged:(id)sender {
    
}

@end
