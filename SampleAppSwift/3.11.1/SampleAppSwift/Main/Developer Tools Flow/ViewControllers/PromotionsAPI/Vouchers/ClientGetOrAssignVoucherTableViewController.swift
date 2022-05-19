//
//  ClientGetOrAssignVoucherTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

//swiftlint:disable type_name
class ClientGetOrAssignVoucherTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var poolUUIDTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func getOrAssignVoucherButtonWasPressed(_ sender: DefaultButton) {
        getOrAssignVoucher()
        sender.animateTapping()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Get Or Assign Voucher"
    }
    
    // MARK: - Private
    
    private func getOrAssignVoucher() {
        
        guard let poolUUID = poolUUIDTextField.text, poolUUID != "" else {
            poolUUIDTextField.animateEmpty(withDuration: 0.3)
            
            return
        }
        
        showLoading()
        Promotions.getOrAssignVoucher(poolUUID: poolUUID, success: { (assignVoucherResponse) in
            self.hideLoading()
            
            let debugInfoString = self.makeVoucherStringRepresentation(assignVoucherResponse)
            self.pushDebugViewController(text: debugInfoString)
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    private func makeVoucherStringRepresentation(_ response: AssignVoucherResponse) -> String {
        
        let message = response.message
        let code = response.assignVoucherData.code
        let expireIn = response.assignVoucherData.expireIn?.description ?? "nil"
        let redeemAt = response.assignVoucherData.redeemAt?.description ?? "nil"
        let assignedAt = response.assignVoucherData.assignedAt?.description ?? "nil"
        let createdAt = response.assignVoucherData.createdAt.description
        let updatedAt = response.assignVoucherData.updatedAt.description
        
        let promotionStringRepresentation = """
        message: \(message)
        code: \(code)
        expireIn: \(expireIn)
        redeemAt: \(redeemAt)
        assignedAt: \(assignedAt)
        createdAt: \(createdAt)
        updatedAt: \(updatedAt)
        """
        
        return promotionStringRepresentation
    }
}
