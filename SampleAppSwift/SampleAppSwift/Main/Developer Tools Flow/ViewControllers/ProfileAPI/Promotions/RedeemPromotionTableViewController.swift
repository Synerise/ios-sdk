//
//  RedeemPromotionTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class RedeemPromotionTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var promotionCodeTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var clientIdTextField: UITextField!
    @IBOutlet weak var customIdTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func redeemPromotionByPhoneNumber() {
        let promotionCode = self.promotionCodeTextField.text ?? ""
        let phoneNumber = self.phoneNumberTextField.text ?? ""
        
        self.showLoading()
        Profile.redeemPromotion(phoneNumber: phoneNumber, promotionCode: promotionCode, success: { _ in
            self.hideLoading()
            self.showSuccessInfo()
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    @IBAction func redeemPromotionByClientId() {
        let promotionCode = self.promotionCodeTextField.text ?? ""
        let clientId = self.clientIdTextField.text ?? ""
        
        self.showLoading()
        Profile.redeemPromotion(clientId: clientId, promotionCode: promotionCode, success: { _ in
            self.hideLoading()
            self.showSuccessInfo()
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    @IBAction func redeemPromotionByCustomId() {
        let promotionCode = self.promotionCodeTextField.text ?? ""
        let customId = self.customIdTextField.text ?? ""
        
        self.showLoading()
        Profile.redeemPromotion(customId: customId, promotionCode: promotionCode, success: { _ in
            self.hideLoading()
            self.showSuccessInfo()
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    @IBAction func redeemPromotionByEmail() {
        let promotionCode = self.promotionCodeTextField.text ?? ""
        let email = self.emailTextField.text ?? ""
        
        self.showLoading()
        Profile.redeemPromotion(email: email, promotionCode: promotionCode, success: { _ in
            self.hideLoading()
            self.showSuccessInfo()
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Redeem Promotion"
    }
}
