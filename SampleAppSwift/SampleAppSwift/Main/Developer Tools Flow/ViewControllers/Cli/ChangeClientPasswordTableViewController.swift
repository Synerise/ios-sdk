//
//  ChangeClientPasswordTableViewController
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ChangeClientPasswordTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var newClientPasswordTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func changeClientPassword() {
        guard let password = newClientPasswordTextField.text, !password.isEmpty else { return }
        
        self.showLoading()
        
        do {
            try SNRExceptionHandler.catchException {
                Client.changePassword(password: password, success: { (_) in
                    self.hideLoading()
                    self.showSuccessInfo()
                }, failure: { (error) in
                    self.hideLoading()
                    self.showErrorInfo(error as NSError)
                })
            }
        } catch let error as NSError {
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Change Client Password"
    }
}
