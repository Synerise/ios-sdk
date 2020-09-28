//
//  SDKCommandsViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2019 Synerise. All rights reserved.
//

import UIKit

class SDKCommandsViewController: DefaultViewController {

    // MARK: - IBAction
    
    @IBAction func getLocationSDKCommand() {
        LocalNotificationSender().sendGetLocationSDKCommand()
    }
    
    @IBAction func signOutSDKCommand() {
        LocalNotificationSender().sendSignOutSDKCommand()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "SDK Commands"
        
        prepareBackButton()
    }
}
