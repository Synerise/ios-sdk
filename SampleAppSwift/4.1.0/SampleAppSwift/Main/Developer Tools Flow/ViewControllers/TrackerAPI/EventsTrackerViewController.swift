//
//  EventsTrackerViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class EventsTrackerViewController: DefaultViewController {
    
    @IBOutlet weak var testButton: DefaultButton!
    @IBOutlet weak var testSwitch: UISwitch!
    @IBOutlet weak var testSegmentedControl: UISegmentedControl!
    @IBOutlet weak var testSlider: UISlider!
    @IBOutlet weak var testStepper: UIStepper!
    @IBOutlet weak var stepperValueLabel: UILabel!
    @IBOutlet weak var testDateAndTimePicker: UIDatePicker!
    @IBOutlet weak var testDatePicker: UIDatePicker!
    @IBOutlet weak var testTimePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "VIEW_CONTROLLER_EVENTS_TRACKER_TITLE".localized()
        
        prepareBackButton()
    }
    
    @IBAction func testButtonTapped(_ sender: DefaultButton) {
        sender.animateTapping()
    }
    
    @IBAction func testSwitchValueChanged(_ sender: Any) {
    }
    
    @IBAction func testSegmentedControlValueChanged(_ sender: Any) {
        
    }
    @IBAction func testSliderValueChanged(_ sender: Any) {
        
    }
    @IBAction func testStepperValueChanged(_ sender: UIStepper) {
        stepperValueLabel.text = String(format: "%.0f", sender.value)
    }
    @IBAction func testDateAndTimePickerValueChanged(_ sender: Any) {
        
    }
    @IBAction func testDatePickerValueChanged(_ sender: Any) {
        
    }
    @IBAction func testTimePickerValueChanged(_ sender: Any) {
        
    }
}
