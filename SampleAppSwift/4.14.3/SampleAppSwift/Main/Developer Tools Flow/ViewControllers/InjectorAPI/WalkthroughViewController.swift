//
//  WalkthroughViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2020 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class WalkthroughViewController: DefaultViewController {

    // MARK: - IBAction
    
    @IBAction func getWalkthrough() {
        Injector.getWalkthrough()
    }
    
    @IBAction func showWalkthrough() {
        Injector.showWalkthrough()
    }
    
    @IBAction func isWalkthroughLoaded() {
        self.presentAlert(title: "IS WALKTHROUGH LOADED", message: "\(Injector.isWalkthroughLoaded())")
    }
    
    @IBAction func isLoadedWalkthroughUnique() {
        self.presentAlert(title: "IS LOADED WALKTHROUGH UNIQUE", message: "\(Injector.isLoadedWalkthroughUnique())")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Walkthrough"
        
        prepareBackButton()
    }
}
