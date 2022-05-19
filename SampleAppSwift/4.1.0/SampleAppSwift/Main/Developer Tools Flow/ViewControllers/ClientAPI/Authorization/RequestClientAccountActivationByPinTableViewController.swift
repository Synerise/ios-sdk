//
//  RequestClientAccountActivationByPinTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2021 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class RequestClientAccountActivationByPinTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func requestAccountActivationByPinButtonWasPressed(_ sender: DefaultButton) {
        guard let email = emailTextField.text, !email.isEmpty else { return }
        
        Client.requestAccountActivationByPin(email: email) { isSuccess in
            self.hideLoading()
            self.showSuccessInfo()
        } failure: { apiError in
            self.hideLoading()
            self.showErrorInfo(apiError as NSError)
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Request Account Activation By Pin"
    }
}
