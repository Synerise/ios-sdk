//
//  UpdateAccountTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class UpdateAccountTableViewController: DefaultTableViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func updateAccountButtonWasPressed(_ sender: DefaultButton) {
        updateClient()
        sender.animateTapping()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Update Account"
    }
    
    // MARK: - Private
    
    private func updateClient() {
        guard let createClientContext = makeClientUpdateAccountContext() else { return }
        
        showLoading()
        Client.updateAccount(context: createClientContext, success: { (success) in
            if success {
                self.hideLoading()
                self.showSuccessInfo()
            }
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
        
    }
    
    private func makeClientUpdateAccountContext() -> ClientUpdateAccountContext? {
        let context = ClientUpdateAccountContext()
        
        guard let phoneNumber = phoneNumberTextField.text, phoneNumber != ""  else {
            phoneNumberTextField.animateEmpty(withDuration: 0.3)
            
            return nil
        }
        
        context.customId = "TEST"
        context.phone = phoneNumber
        context.firstName = firstNameTextField.text
        context.lastName = lastNameTextField.text
        context.address = addressTextField.text
        context.city = cityTextField.text
        context.company = companyTextField.text
        
        return context
    }
}
