//
//  DeleteClientViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class DeleteClientViewController: DefaultTableViewController {
    
    @IBOutlet weak var clientIDTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func deleteClientButtonWasPressed(_ sender: DefaultButton) {
        guard let clientIDstring = clientIDTextField.text, clientIDstring != "", let clientID = Int(clientIDstring) else {
            clientIDTextField.animateEmpty(withDuration: 0.3)
            
            return
        }
        
        deleteClient(clientID)
        sender.animateTapping()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Delete Client"
        clientIDTextField.text = "570750172"
    }
    
    // MARK: - Private
    
    func deleteClient(_ clientID: Int) {
        showLoading()
        Profile.deleteClient(clientID, success: { (success) in
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
