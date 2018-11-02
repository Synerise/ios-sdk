//
//  UpdateClientTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class UpdateTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var clientIDTextField: UITextField!
    @IBOutlet weak var clientContextFirstNameTextField: UITextField!
    @IBOutlet weak var clientContextLastNameTextField: UITextField!
    @IBOutlet weak var clientContextCustomIDTextField: UITextField!
    @IBOutlet weak var clientContextDisplayNameTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func createClientButtonWasPressed(_ sender: DefaultButton) {
        updateClient()
        sender.animateTapping()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Update Client"
        clientIDTextField.text = "570750172"
    }
    
    // MARK: - Private
    
    private func updateClient() {
        
        guard let clientIDstring = clientIDTextField.text, clientIDstring != "", let clientID = Int(clientIDstring) else {
            clientIDTextField.animateEmpty(withDuration: 0.3)
            
            return
        }
        
        let createClientContext = makeUpdateClientContext()
        
        showLoading()
        
        Profile.updateClient(clientID, context: createClientContext, success: { (success) in
            if success {
                self.hideLoading()
                self.showSuccessInfo()
            }
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
        
    }
    
    private func makeUpdateClientContext() -> UpdateClientContext {
        let context = UpdateClientContext()
        
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
