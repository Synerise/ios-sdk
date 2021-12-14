//
//  ClientGetPromotionTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ClientGetPromotionTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var uuidTextField: UITextField!
    @IBOutlet weak var codeTextField: UITextField!
    
    @IBAction func getPromotioByUUID() {
        let uuid = self.uuidTextField.text ?? ""
        
        self.showLoading()
        Promotions.getPromotion(uuid: uuid, success: { (clientPromotion) in
            self.hideLoading()
            
            let debugInfoString = self.makeClientPromotionStringRepresentation(clientPromotion)
            self.pushDebugViewController(text: debugInfoString)
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    @IBAction func getPromotioByCode() {
        let code = self.codeTextField.text ?? ""
        
        self.showLoading()
        Promotions.getPromotion(code: code, success: { (clientPromotion) in
            self.hideLoading()
            
            let debugInfoString = self.makeClientPromotionStringRepresentation(clientPromotion)
            self.pushDebugViewController(text: debugInfoString)
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Get Promotion"
    }
    
    // MARK: - Private
    
    // swiftlint:disable:next function_body_length
    private func makeClientPromotionStringRepresentation(_ response: Promotion) -> String {
        let uuid = response.uuid
        let code = response.code
        let status = SNR_PromotionStatusToString(response.status)
        let type = SNR_PromotionTypeToString(response.type)
        
        let redeemLimitPerClient = response.redeemLimitPerClient?.stringValue ?? "-"
        let redeemQuantityPerActivation = response.redeemQuantityPerActivation?.stringValue ?? "-"
        let currentRedeemedQuantity = response.currentRedeemedQuantity.stringValue
        let currentRedeemLimit = response.currentRedeemLimit.stringValue
        let activationCounter = response.activationCounter.stringValue
        let possibleRedeems = response.possibleRedeems.stringValue
        let requireRedeemedPoints = response.requireRedeemedPoints.stringValue
        
        let discountType = SNR_PromotionDiscountTypeToString(response.discountType)
        let discountValue = response.discountValue
        let discountMode = SNR_PromotionDiscountModeToString(response.discountMode)
        
        let name = response.name
        let headline = response.headline ?? "-"
        let descriptionText = response.descriptionText ?? "-"
        
        let priority = response.priority.stringValue
        let price = response.price.stringValue
        let minBasketValue = response.minBasketValue?.stringValue ?? "-"
        let maxBasketValue = response.maxBasketValue?.stringValue ?? "-"
        
        let startAt = response.startAt?.description ?? "-"
        let expireIn = response.expireAt?.description ?? "-"
        let lastingTime = response.lastingAt?.description ?? "-"
        let displayFrom = response.displayFrom?.description ?? "-"
        let displayTo = response.displayTo?.description ?? "-"
        
        let images: Any = response.images?.description ?? "-"
        let catalogIndexItems: Any = response.catalogIndexItems ?? "-"
        let params: Any = response.params ?? "-"
        
        let promotionStringRepresentation = """
        UUID: \(uuid)
        code: \(code)
        status: \(status)
        type: \(type)
        
        redeemLimitPerClient: \(redeemLimitPerClient)
        redeemQuantityPerActivation: \(redeemQuantityPerActivation)
        currentRedeemedQuantity: \(currentRedeemedQuantity)
        currentRedeemLimit: \(currentRedeemLimit)
        activationCounter: \(activationCounter)
        possibleRedeems: \(possibleRedeems)
        requireRedeemedPoints: \(requireRedeemedPoints)
        
        discountType: \(discountType)
        discountValue: \(discountValue)
        discountMode: \(discountMode)
        
        name: \(name)
        headline: \(headline)
        descriptionText: \(descriptionText)
        
        priority: \(priority)
        price: \(price)
        minBasketValue: \(minBasketValue)
        maxBasketValue: \(maxBasketValue)
        
        startAt: \(startAt)
        expireIn: \(expireIn)
        lastingTime: \(lastingTime)
        displayFrom: \(displayFrom)
        displayTo: \(displayTo)
        
        images: \(images as AnyObject)
        catalogIndexItems: \(catalogIndexItems as AnyObject)
        params: \(params as AnyObject)
        """
        
        return promotionStringRepresentation
    }
}
