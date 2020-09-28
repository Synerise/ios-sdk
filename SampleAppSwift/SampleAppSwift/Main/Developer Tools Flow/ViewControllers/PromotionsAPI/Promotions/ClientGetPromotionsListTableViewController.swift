//
//  ClientGetPromotionsListTableViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

// swiftlint:disable:next type_name
class ClientGetPromotionsListTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var statusActiveSwitch: UISwitch!
    @IBOutlet weak var statusAssignedSwitch: UISwitch!
    @IBOutlet weak var statusRedemeedSwitch: UISwitch!
    
    @IBOutlet weak var typeMembersOnlySwitch: UISwitch!
    @IBOutlet weak var typeCustomSwitch: UISwitch!
    @IBOutlet weak var typeGeneralSwitch: UISwitch!
    
    @IBOutlet weak var includeMetaSwitch: UISwitch!
    
    // MARK: - IBAction
    
    @IBAction func getPromotionsList() {
        self.showLoading()
        Promotions.getPromotions(success: { (promotionsList) in
            self.hideLoading()
            
            let debugInfoString = self.makePromotionsListStringRepresentation(promotionsList)
            self.pushDebugViewController(text: debugInfoString)
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    @IBAction func getPromotionsListWithOptions() {
        var statuses: [String] = [String]()
        
        if statusActiveSwitch.isOn {
            statuses.append(SNR_PromotionStatusToString(PromotionStatus.active))
        }

        if statusAssignedSwitch.isOn {
            statuses.append(SNR_PromotionStatusToString(PromotionStatus.assigned))
        }

        if statusRedemeedSwitch.isOn {
            statuses.append(SNR_PromotionStatusToString(PromotionStatus.redeemed))
        }
        
        var types: [String] = [String]()
        
        if typeMembersOnlySwitch.isOn {
            types.append(SNR_PromotionTypeToString(PromotionType.membersOnly))
        }
        
        if typeCustomSwitch.isOn {
            types.append(SNR_PromotionTypeToString(PromotionType.custom))
        }
        
        if typeGeneralSwitch.isOn {
            types.append(SNR_PromotionTypeToString(PromotionType.general))
        }
        
        let includeMeta: Bool = includeMetaSwitch.isOn
        
        let apiQuery = PromotionsApiQuery()
        apiQuery.types = types
        apiQuery.statuses = statuses
        apiQuery.limit = 50
        apiQuery.page = 1
        apiQuery.includeMeta = includeMeta
        
        self.showLoading()
        Promotions.getPromotions(apiQuery: apiQuery, success: { (promotionsList) in
            self.hideLoading()
            
            let debugInfoString = self.makePromotionsListStringRepresentation(promotionsList)
            self.pushDebugViewController(text: debugInfoString)
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Promotions List"
    }
    
    // MARK: - Private
    
    private func makePromotionsListStringRepresentation(_ response: PromotionResponse) -> String {
        var promotionsListStringRepresentation = ""
        
        response.items.forEach { (promotion) in
            let promotionStringRepresentation = makePromotionStringRepresentation(promotion)
            promotionsListStringRepresentation.append("\n- - - - - - - - - - - - - - - - - - - - -\n")
            promotionsListStringRepresentation.append(promotionStringRepresentation)
        }
        
        return promotionsListStringRepresentation
    }
    
    private func makePromotionStringRepresentation(_ response: Promotion) -> String {
        let uuid = response.uuid
        let code = response.code
        let status = SNR_PromotionStatusToString(response.status)
        let type = SNR_PromotionTypeToString(response.type)
        
        let redeemLimitPerClient = response.redeemLimitPerClient?.stringValue ?? "-"
        let currentRedeemedQuantity = response.currentRedeemedQuantity.stringValue
        let requireRedeemedPoints = response.requireRedeemedPoints?.stringValue ?? "-"
        
        let discountType = SNR_PromotionDiscountTypeToString(response.discountType)
        let discountValue = response.discountValue
        
        let name = response.name ?? "-"
        let headline = response.headline ?? "-"
        let descriptionText = response.descriptionText ?? "-"
        
        let startAt = response.startAt?.description ?? "-"
        let expireIn = response.expireAt?.description ?? "-"
        let lastingAt = response.lastingAt?.description ?? "-"
        
        let images: Any = response.images?.description ?? "-"
        let catalogIndexItems: Any = response.catalogIndexItems ?? "-"
        let params: Any = response.params ?? "-"
        let price = response.price.stringValue
        
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
