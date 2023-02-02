//
//  CheckoutShippingTableViewModel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation

class CheckoutShippingMethodTableViewModel {
    
    let providerName: String
    let deliveryTime: String
    let price: String
    var state: Bool
    
    // MARK: - Init
    
    init(model: CheckoutShippingMethod) {
        self.providerName = model.providerName
        self.deliveryTime = model.deliveryTime
        self.price = model.price
        self.state = model.state
    }
    
}
