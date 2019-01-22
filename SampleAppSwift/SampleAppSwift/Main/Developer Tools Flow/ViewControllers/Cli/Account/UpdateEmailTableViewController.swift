//
//  UpdateEmailTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2019 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class UpdateEmailTableViewController: DefaultTableViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func updateEmail() {
        let email = self.emailTextField.text ?? ""
        
        Client.requestEmailChange(email: email, success: { _ in
            self.showSuccessInfo()
        }) { (error) in
            self.showErrorInfo(error as NSError)
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Update Email"
    }
}
