//
//  SimplePushTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class SimplePushViewController: DefaultViewController {
    
    // MARK: - IBAction
    
    @IBAction func simplePush1() {
        LocalNotificationSender().sendSimplePush1()
    }
    
    @IBAction func simplePush2() {
        LocalNotificationSender().sendSimplePush2()
    }
    
    @IBAction func simplePush3() {
        LocalNotificationSender().sendSimplePush3()
    }
    
    @IBAction func simplePush4() {
        LocalNotificationSender().sendSimplePush4()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Simple Push"
        
        prepareBackButton()
    }
}
