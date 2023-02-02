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
    
    @IBAction func signOutModeLogoutButtonWasPressed(_ sender: DefaultButton) {
        Client.signOut(mode: .signOut)
    }
    
    @IBAction func signOutModeLogoutWithSessionButtonWasPressed(_ sender: DefaultButton) {
        Client.signOut(mode: .signOutWithSessionDestroy)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Authorization"
    }
}
