//
//  ConfirmAccountActivationByPinTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2021 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ConfirmAccountActivationByPinTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pinCodeTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func confirmAccountActivationByPinButtonWasPressed(_ sender: DefaultButton) {
        guard let email = emailTextField.text, !email.isEmpty else { return }
        guard let pinCode = pinCodeTextField.text, !pinCode.isEmpty else { return }
        
        Client.confirmAccountActivationByPin(pinCode: pinCode, email: email) { isSuccess in
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
        self.navigationItem.title = "Confirm Account Activation By Pin"
    }
}
