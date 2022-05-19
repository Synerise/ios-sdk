//
//  ClientAuthorizationViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ClientAuthorizationViewController: DefaultViewController {
    
    // MARK: - IBAction
    
    @IBAction func signOutButtonWasPressed(_ sender: DefaultButton) {
        Client.signOut()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Authorization"
    }
}
