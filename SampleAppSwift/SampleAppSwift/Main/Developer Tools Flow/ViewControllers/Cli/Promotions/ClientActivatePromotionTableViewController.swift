//
//  ClientActivatePromotionTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

// swiftlint:disable:next type_name
class ClientActivatePromotionTableViewController: DefaultTableViewController {

    @IBOutlet weak var uuidTextField: UITextField!
    @IBOutlet weak var codeTextField: UITextField!
    
    @IBAction func activatePromotioByUUID() {
        let uuid = self.uuidTextField.text ?? ""
        
        self.showLoading()
        Client.activatePromotion(uuid: uuid, success: { (success) in
            self.hideLoading()
            self.showSuccessInfo()
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    @IBAction func activatePromotioByCode() {
        let code = self.codeTextField.text ?? ""
        
        self.showLoading()
        Client.activatePromotion(code: code, success: { (success) in
            self.hideLoading()
            self.showSuccessInfo()
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Activate Promotion"
    }
}
