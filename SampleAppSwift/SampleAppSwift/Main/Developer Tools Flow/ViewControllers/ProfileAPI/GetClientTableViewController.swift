//
//  GetClientTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class GetClientTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var clientEmailTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func getClientButtonWasPressed(_ sender: DefaultButton) {
        guard let email = clientEmailTextField.text, email != "" else {
            clientEmailTextField.animateEmpty(withDuration: 0.3)
            
            return
        }
        
        getClient(email)
        sender.animateTapping()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Get Client"
    }
    
    // MARK: - Private
    
    func getClient(_ email: String) {
        showLoading()
        Profile.getClient(email, success: { (clientProfileContext) in
            self.hideLoading()
            self.showSuccessInfo()
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
}
