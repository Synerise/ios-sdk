//
//  CartItem.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation

class CartItem {
    
    let product: Product
    var quantity: Int
    
    // MARK: - Init
    
    init(product: Product, quantity: Int) {
        self.product = product
        self.quantity = quantity
    }

}
