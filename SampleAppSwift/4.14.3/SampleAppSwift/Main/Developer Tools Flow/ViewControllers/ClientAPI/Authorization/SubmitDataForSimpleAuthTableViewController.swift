//
//  SubmitDataForSimpleAuthTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2023 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class SubmitDataForSimpleAuthTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var customIdTextField: UITextField!
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var uuidTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func submitDataButtonWasPressed(_ sender: DefaultButton) {
        let email: String? = emailTextField.text != nil && emailTextField.text?.isEmpty == false ? emailTextField.text : nil
        let customId: String? = customIdTextField.text != nil && customIdTextField.text?.isEmpty == false ? customIdTextField.text : nil
        let firstName: String? = firstnameTextField.text != nil && firstnameTextField.text?.isEmpty == false ? firstnameTextField.text : nil
        let lastName: String? = lastnameTextField.text != nil && lastnameTextField.text?.isEmpty == false ? lastnameTextField.text : nil
        let phone: String? = phoneTextField.text != nil && phoneTextField.text?.isEmpty == false ? phoneTextField.text : nil
        let uuid: String? = uuidTextField.text != nil && uuidTextField.text?.isEmpty == false ? uuidTextField.text : nil
                
        let data = ClientSimpleAuthenticationData()
        data.email = email
        data.customId = customId
        data.firstName = firstName
        data.lastName = lastName
        data.phone = phone
        data.uuid = uuid
        
        Client.simpleAuthentication(data: data, authID: "johny3") {
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
        self.navigationItem.title = "Submit Data for Simple Auth"
    }

}
