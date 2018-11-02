//
//  CreateClientTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class CreateClientTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var clientContextEmailTextField: UITextField!
    @IBOutlet weak var clientContextPhoneTextField: UITextField!
    @IBOutlet weak var clientContextFirstNameTextField: UITextField!
    @IBOutlet weak var clientContextLastNameTextField: UITextField!
    @IBOutlet weak var clientContextCustomIDTextField: UITextField!
    @IBOutlet weak var clientContextDisplayNameTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func createClientButtonWasPressed(_ sender: DefaultButton) {
        createClientContext()
        sender.animateTapping()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Create Client Context"
    }
    
    // MARK: - Private
    
    private func createClientContext() {
        let createClientContext = makeCreateClientContext()
        showLoading()
        Profile.createClient(createClientContext, success: { (success) in
            if success {
                self.hideLoading()
                self.showSuccessInfo()
            }
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    private func makeCreateClientContext() -> CreateClientContext {
        let context = CreateClientContext()
        
        context.email = clientContextEmailTextField.text
        context.phone = clientContextPhoneTextField.text
        context.firstName = clientContextFirstNameTextField.text
        context.lastName = clientContextLastNameTextField.text
        context.customId = clientContextCustomIDTextField.text
        context.displayName = clientContextDisplayNameTextField.text
        
        let agreements = ClientAgreements()
        agreements.email = true
        agreements.sms = true
        agreements.push = true
        agreements.bluetooth = true
        agreements.rfid = true
        agreements.wifi = true
        
        context.agreements = agreements
        
        return context
    }
}
