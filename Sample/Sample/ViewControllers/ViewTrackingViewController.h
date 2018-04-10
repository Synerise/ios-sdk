//
//  AutoTrackingPresentationViewController.h
//  Sample
//
//  Created by BPOL1179 on 19.03.2018.
//  Copyright © 2018 Synerise. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewTrackingViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *stepperValueLabel;

@property (nonatomic, weak) IBOutlet UIDatePicker *dateAndTimeDatePicker;
@property (nonatomic, weak) IBOutlet UIDatePicker *dateDatePicker;
@property (nonatomic, weak) IBOutlet UIDatePicker *timeDatePicker;

- (IBAction)buttonTapped:(id)sender;
- (IBAction)switchChanged:(id)sender;
- (IBAction)segmentedControlChanged:(id)sender;
- (IBAction)sliderChanged:(id)sender;
- (IBAction)stepperChanged:(id)sender;
- (IBAction)datePickerChanged:(id)sender;

@end
