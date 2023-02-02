//
//  CustomEmailAndCustomIdentifierTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2019 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class CustomEmailAndCustomIdentifierTableViewController: DefaultTableViewController {

    @IBOutlet weak var customEmailTextField: UITextField!
    @IBOutlet weak var customIdentifierTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func removeCustomEmail(_ sender: DefaultButton) {
        Tracker.setCustomEmail(nil)
        sender.animateTapping()
    }
    
    @IBAction func removeCustomIdentifier(_ sender: DefaultButton) {
        Tracker.setCustomIdentifier(nil)
        sender.animateTapping()
    }
    
    @IBAction func saveCustomEmail(_ sender: DefaultButton) {
        guard let customEmail = customEmailTextField.text else {
            return
        }
        
        Tracker.setCustomEmail(customEmail)
        sender.animateTapping()
    }
    
    @IBAction func saveCustomIdentifier(_ sender: DefaultButton) {
        guard let customIdentifier = customIdentifierTextField.text else {
            return
        }
        
        Tracker.setCustomIdentifier(customIdentifier)
        sender.animateTapping()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareBackButton()
        
        self.navigationItem.title = "CustomEmail / CustomIdentifier"
    }
}
