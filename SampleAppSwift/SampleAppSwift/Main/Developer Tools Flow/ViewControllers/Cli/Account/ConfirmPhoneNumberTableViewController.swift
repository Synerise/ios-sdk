//
//  ConfirmPhoneNumberTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ConfirmPhoneNumberTableViewController: DefaultTableViewController {

    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var confirmationCodeTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func confirmPhoneNumber() {
        let phoneNumber = phoneNumberTextField.text ?? ""
        let confirmationCode = confirmationCodeTextField.text ?? ""
        
        do {
            try SNRExceptionHandler.catchException {
                Client.confirmPhoneUpdate(phone: phoneNumber, confirmationCode: confirmationCode, success: { _ in
                    self.showSuccessInfo()
                }, failure: { (error) in
                    self.showErrorInfo(error as NSError)
                })
            }
        } catch let error as NSError {
            self.showErrorInfo(error as NSError)
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Confirm Phone Number"
    }
}
