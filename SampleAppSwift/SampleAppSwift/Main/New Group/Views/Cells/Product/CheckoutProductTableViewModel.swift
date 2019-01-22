//
//  CheckoutProductTableViewModel.swift
//  SampleAppSwift
//
//  Created by BPOL0397 on 06/08/2018.
//

import Foundation

class CheckoutProductTableViewModel {
    
    let name: String
    let brand: String
    let imageURL: URL
    let price: Double
    var amount: Int
    
    var isPriceVisible: Bool = true
    
    // MARK: - Init
    
    init(cartItem: CartItem) {
        self.name = cartItem.product.name
        self.brand = cartItem.product.brand
        self.imageURL = cartItem.product.imageURL
        self.price = cartItem.product.price
        self.amount = cartItem.quantity
        
        if cartItem.product.isPromotion == true {
            self.isPriceVisible = false
        }
    }
}
