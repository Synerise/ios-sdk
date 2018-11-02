//
//  ConfirmPhoneRegistrationTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

// swiftlint:disable:next type_name
class ConfirmPhoneRegistrationTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var confirmationCodeTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func confirmPhoneRegistrationButtonWasPressed(_ sender: DefaultButton) {
        confirmPhoneRegistration()
        sender.animateTapping()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Confrim Phone Registration"
    }
    
    // MARK: - Private
    
    private func confirmPhoneRegistration() {
        guard let phone = phoneTextField.text, !phone.isEmpty else {
            phoneTextField.animateEmpty(withDuration: 0.3)
            
            return
        }
        
        guard let confirmationCode = confirmationCodeTextField.text, !confirmationCode.isEmpty else {
            confirmationCodeTextField.animateEmpty(withDuration: 0.3)
            
            return
        }
        
        showLoading()
        Profile.confirmPhoneRegistration(phone: phone, confirmationCode: confirmationCode, success: { (success) in
            if success {
                self.hideLoading()
                self.showSuccessInfo()
            }
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
}
