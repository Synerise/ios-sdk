//
//  GetPromotionsListTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class GetPromotionsListTableViewController: DefaultTableViewController {

    @IBOutlet weak var limitTextField: UITextField!
    
    @IBOutlet weak var externalIdTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var clientIdTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func getPromotionsList() {
        self.showLoading()
        Profile.getPromotions(success: { (profilePromotionResponse) in
            self.hideLoading()
           
            DispatchQueue.main.async {
                let debugInfoString = self.makeProfilePromotionsListStringRepresentation(profilePromotionResponse)
                self.pushToDebugTextViewController(string: debugInfoString)
            }
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    @IBAction func getPromotionsListWithLimit() {
        let limit = self.limitTextField.text ?? ""
        let limitInt: Int = Int(limit) ?? 0
        
        self.showLoading()
        Profile.getPromotions(limit: limitInt, success: { (profilePromotionResponse) in
            self.hideLoading()
            
            DispatchQueue.main.async {
                let debugInfoString = self.makeProfilePromotionsListStringRepresentation(profilePromotionResponse)
                self.pushToDebugTextViewController(string: debugInfoString)
            }
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    @IBAction func getPromotionsListByExternalId() {
        let externalId = self.externalIdTextField.text ?? ""
        
        self.showLoading()
        Profile.getPromotions(externalId: externalId, success: { (clientPromotionResponse) in
            self.hideLoading()
            
            DispatchQueue.main.async {
                let debugInfoString = self.makeClientPromotionsListStringRepresentation(clientPromotionResponse)
                self.pushToDebugTextViewController(string: debugInfoString)
            }
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    @IBAction func getPromotionsListByPhoneNumber() {
        let phoneNumber = self.phoneNumberTextField.text ?? ""
        
        self.showLoading()
        Profile.getPromotions(phoneNumber: phoneNumber, success: { (clientPromotionResponse) in
            self.hideLoading()
            
            DispatchQueue.main.async {
                let debugInfoString = self.makeClientPromotionsListStringRepresentation(clientPromotionResponse)
                self.pushToDebugTextViewController(string: debugInfoString)
            }
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    @IBAction func getPromotionsListByClientId() {
        let clientId = self.clientIdTextField.text ?? ""
        
        self.showLoading()
        Profile.getPromotions(clientId: clientId, success: { (clientPromotionResponse) in
            self.hideLoading()
            
            DispatchQueue.main.async {
                let debugInfoString = self.makeClientPromotionsListStringRepresentation(clientPromotionResponse)
                self.pushToDebugTextViewController(string: debugInfoString)
            }
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    @IBAction func getPromotionsListByEmail() {
        let email = self.emailTextField.text ?? ""
        
        self.showLoading()
        Profile.getPromotions(email: email, success: { (clientPromotionResponse) in
            self.hideLoading()
            
            DispatchQueue.main.async {
                let debugInfoString = self.makeClientPromotionsListStringRepresentation(clientPromotionResponse)
                self.pushToDebugTextViewController(string: debugInfoString)
            }
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Promotions List"
    }

    // MARK: - Private

    private func pushToDebugTextViewController(string: String) {
        let debugTextViewController = DebugTextViewController(text: string, copyEnabled: false)

        self.navigationController?.pushViewController(debugTextViewController, animated: true)
    }

    private func makeProfilePromotionsListStringRepresentation(_ response: ProfilePromotionResponse) -> String {
        var promotionsListStringRepresentation = ""

        response.promotions.forEach { (object) in
            if let promotion = object as? ProfilePromotion {
                let promotionStringRepresentation = makeProfilePromotionStringRepresentation(promotion)
                promotionsListStringRepresentation.append("\n- - - - - - - - - - - - - - - - - - - - -\n")
                promotionsListStringRepresentation.append(promotionStringRepresentation)
            }
        }

        return promotionsListStringRepresentation
    }

    private func makeProfilePromotionStringRepresentation(_ response: ProfilePromotion) -> String {
        let uuid = response.uuid
        let code = response.code
        let status = ProfilePromotion.stringFromProfilePromotionStatus(response.status)
        let type = ProfilePromotion.stringFromPromotionType(response.type)
        
        let redeemLimitPerClient = response.redeemLimitPerClient?.stringValue ?? "-"
        let currentRedeemedQuantity = response.currentRedeemedQuantity?.stringValue ?? "-"
        let requireRedeemedPoints = response.requireRedeemedPoints?.stringValue ?? "-"
        
        let discountType = ProfilePromotion.stringFromPromotionDiscountType(response.discountType)
        let discountValue = response.discountValue.stringValue
        
        let name = response.name
        let headline = response.headline ?? "-"
        let descriptionText = response.descriptionText ?? "-"
        
        let startAt = response.startAt?.description ?? "-"
        let expireIn = response.expireIn?.description ?? "-"
        let lastingTime = response.lastingTime?.stringValue ?? "-"
        
        let images: Any = response.images ?? "-"
        let catalogIndexItems: Any = response.catalogIndexItems ?? "-"
        let params: Any = response.params ?? "-"
        let price = response.price?.stringValue ?? "-"

        let promotionStringRepresentation = """
        UUID: \(uuid)
        code: \(code)
        status: \(status)
        type: \(type)
        
        redeemLimitPerClient: \(redeemLimitPerClient)
        currentRedeemedQuantity: \(currentRedeemedQuantity)
        requireRedeemedPoints: \(requireRedeemedPoints)
        
        discountType: \(discountType)
        discountValue: \(discountValue)
        
        name: \(name)
        headline: \(headline)
        descriptionText: \(descriptionText)
        
        startAt: \(startAt)
        expireIn: \(expireIn)
        lastingTime: \(lastingTime)
        
        images: \(images as AnyObject)
        catalogIndexItems: \(catalogIndexItems as AnyObject)
        params: \(params as AnyObject)
        price: \(price)
        """

        return promotionStringRepresentation
    }
    
    private func makeClientPromotionsListStringRepresentation(_ response: ClientPromotionResponse) -> String {
        var promotionsListStringRepresentation = ""
        
        response.promotions.forEach { (object) in
            if let promotion = object as? ClientPromotion {
                let promotionStringRepresentation = makeClientPromotionStringRepresentation(promotion)
                promotionsListStringRepresentation.append("\n- - - - - - - - - - - - - - - - - - - - -\n")
                promotionsListStringRepresentation.append(promotionStringRepresentation)
            }
        }
        
        return promotionsListStringRepresentation
    }
    
    private func makeClientPromotionStringRepresentation(_ response: ClientPromotion) -> String {
        let uuid = response.uuid
        let code = response.code
        let status = ClientPromotion.stringFromClientPromotionStatus(response.status)
        let type = ProfilePromotion.stringFromPromotionType(response.type)
        
        let redeemLimitPerClient = response.redeemLimitPerClient?.stringValue ?? "-"
        let currentRedeemedQuantity = response.currentRedeemedQuantity?.stringValue ?? "-"
        let requireRedeemedPoints = response.requireRedeemedPoints?.stringValue ?? "-"
        
        let discountType = ProfilePromotion.stringFromPromotionDiscountType(response.discountType)
        let discountValue = response.discountValue.stringValue
        
        let name = response.name
        let headline = response.headline ?? "-"
        let descriptionText = response.descriptionText ?? "-"
        
        let startAt = response.startAt?.description ?? "-"
        let expireIn = response.expireIn?.description ?? "-"
        let lastingAt = response.lastingAt?.stringValue ?? "-"
        
        let images: Any = response.images ?? "-"
        let catalogIndexItems: Any = response.catalogIndexItems ?? "-"
        let params: Any = response.params ?? "-"
        let price = response.price?.stringValue ?? "-"
        
        let promotionStringRepresentation = """
        UUID: \(uuid)
        code: \(code)
        status: \(status)
        type: \(type)
        
        redeemLimitPerClient: \(redeemLimitPerClient)
        currentRedeemedQuantity: \(currentRedeemedQuantity)
        requireRedeemedPoints: \(requireRedeemedPoints)
        
        discountType: \(discountType)
        discountValue: \(discountValue)
        
        name: \(name)
        headline: \(headline)
        descriptionText: \(descriptionText)
        
        startAt: \(startAt)
        expireIn: \(expireIn)
        lastingAt: \(lastingAt)
        
        images: \(images as AnyObject)
        catalogIndexItems: \(catalogIndexItems as AnyObject)
        params: \(params as AnyObject)
        price: \(price)
        """
        
        return promotionStringRepresentation
    }

}
