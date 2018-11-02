//
//  CartManager.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import SyneriseSDK

class CartManager {
    
    static let shared = CartManager()
    
    var cartItems: [CartItem] = [CartItem]()
    
    // MARK: - Public
    
    func addCartItem(cartItem: CartItem) {
        if let cartItem = cartItems.first(where: {$0.product == cartItem.product}) {
            cartItem.quantity += 1
        } else {
            cartItems.append(cartItem)
        }
        sendAddedProductEvent(cartItem: cartItem)
    }
    
    func removeProduct(row: Int) {
        let cartItem = cartItems[row]
        sendRemovedProductEvent(cartItem: cartItem)
        cartItems.remove(at: row)
    }
    
    func removeAllProducts() {
        sendRemovedProductEventForEachItem()
        cartItems.removeAll()
    }
    
    func numberOfItemsInCart() -> Int {
        return cartItems.count
    }
    
    func productAtIndexPath(indexPath: IndexPath) -> CartItem {
        return cartItems[indexPath.row]
    }
    
    func getCartItems() -> [CartItem] {
        return cartItems
    }
    
    func isEmpty() -> Bool {
        return cartItems.isEmpty
    }
    
    // MARK: - Private
    
    private func sendAddedProductEvent(cartItem: CartItem) {
        let product = cartItem.product
        let finalPriceFloat = Float(cartItem.quantity) * Float(product.price)
        let finalPrice = UnitPrice(amount: finalPriceFloat)
        
        let addedProductToCartEvent = AddedProductToCartEvent.init(label: product.name, sku: product.sku, finalPrice: finalPrice, quantity: cartItem.quantity)
        addedProductToCartEvent.setCategory(product.categories)

        Tracker.send(addedProductToCartEvent)
    }
    
    private func sendRemovedProductEvent(cartItem: CartItem) {
        let product = cartItem.product
        let finalPriceFloat = Float(cartItem.quantity) * Float(product.price)
        let finalPrice = UnitPrice(amount: finalPriceFloat)
        
        let removedProductToCartEvent = RemovedProductFromCartEvent.init(label: product.name, sku: product.sku, finalPrice: finalPrice, quantity: cartItem.quantity)
        removedProductToCartEvent.setCategory(product.categories)
        
        Tracker.send(removedProductToCartEvent)
    }
    
    private func sendRemovedProductEventForEachItem() {
        for cartItem in cartItems {
            sendRemovedProductEvent(cartItem: cartItem)
        }
    }
}
