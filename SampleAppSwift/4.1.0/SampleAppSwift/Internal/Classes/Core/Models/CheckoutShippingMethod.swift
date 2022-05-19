//
//  CheckoutShipping.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation

class CheckoutShippingMethod {
    
    let providerName: String
    let deliveryTime: String
    let price: String
    var state: Bool = false
    
    // MARK: - Init
    
    init(providerName: String, deliveryTime: String, price: String) {
        self.providerName = providerName
        self.deliveryTime = deliveryTime
        self.price = price
    }
}
