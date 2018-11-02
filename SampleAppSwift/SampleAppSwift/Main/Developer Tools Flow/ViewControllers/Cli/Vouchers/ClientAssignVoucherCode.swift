//
//  ClientAssignVoucherCodeTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

//swiftlint:disable type_name
class ClientAssignVoucherCodeTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var poolUUIDTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func assignVoucherCodeButtonWasPressed(_ sender: DefaultButton) {
        assignVoucherCode()
        sender.animateTapping()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Client Assign Voucher Code"
    }
    
    // MARK: - Private
    
    private func assignVoucherCode() {
        
        guard let poolUUID = poolUUIDTextField.text, poolUUID != "" else {
            poolUUIDTextField.animateEmpty(withDuration: 0.3)
            
            return
        }
        
        showLoading()
        Client.assignVoucherCode(poolUUID: poolUUID, success: { (assignVoucherResponse) in
            self.hideLoading()
            let debugInfoString = self.makeVoucherStringRepresentation(assignVoucherResponse)
            DispatchQueue.main.async {
                self.pushToDebugTextViewController(string: debugInfoString)
            }
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    private func pushToDebugTextViewController(string: String) {
        let debugTextViewController = DebugTextViewController(text: string, copyEnabled: false)
        
        self.navigationController?.pushViewController(debugTextViewController, animated: true)
    }
    
    private func makeVoucherStringRepresentation(_ response: AssignVoucherResponse) -> String {
        
        let message = response.message ?? "nil"
        let code = response.data?.code ?? "nil"
        let expireIn = response.data?.expireIn?.description ?? "nil"
        let redeemAt = response.data?.redeemAt?.description ?? "nil"
        let assignedAt = response.data?.assignedAt?.description ?? "nil"
        let createdAt = response.data?.createdAt?.description ?? "nil"
        let updatedAt = response.data?.updatedAt?.description ?? "nil"
        
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
