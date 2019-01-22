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
    var voucherCode: String?
    
    // MARK: - Public
    
    func placeOrder() {
        removeAllProducts()
        sendCompleteTransactionEvent()
        sendEndHitTimerEvent()
    }
    
    func addCartItem(cartItem: CartItem) {
        if cartItems.isEmpty {
            sendStartHitTimerEvent()
        }
        
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
        
        let productDeepLink = URL(string: "syne://product?sku=" + product.sku)!
        
        let finalPriceFloat = Float(cartItem.quantity) * Float(product.price)
        let finalPrice = UnitPrice(amount: finalPriceFloat)
        
        //swiftlint:disable:next force_cast
        let regularPrice = finalPrice.copy() as! UnitPrice
        
        //swiftlint:disable:next force_cast
        let discountedPrice = finalPrice.copy() as! UnitPrice
        
        let addedProductToCartEvent = AddedProductToCartEvent.init(label: "added " + product.name + " to cart",
                                                                   sku: product.sku,
                                                                   finalPrice: finalPrice,
                                                                   quantity: cartItem.quantity)
        
        addedProductToCartEvent.setCategory(product.categories)
        addedProductToCartEvent.setCategories([
            product.categories
        ])
        addedProductToCartEvent.setProducer(product.brand)
        addedProductToCartEvent.setURL(productDeepLink)
        addedProductToCartEvent.setOffline(false)
        addedProductToCartEvent.setRegularPrice(regularPrice)
        addedProductToCartEvent.setDiscountedPrice(discountedPrice)

        Tracker.send(addedProductToCartEvent)
    }
    
    private func sendRemovedProductEvent(cartItem: CartItem) {
        let product = cartItem.product
        
        let productDeepLink = URL(string: "syne://product?sku=" + product.sku)!
        
        let finalPriceFloat = Float(cartItem.quantity) * Float(product.price)
        let finalPrice = UnitPrice(amount: finalPriceFloat)
        
        //swiftlint:disable:next force_cast
        let regularPrice = finalPrice.copy() as! UnitPrice
        
        //swiftlint:disable:next force_cast
        let discountedPrice = finalPrice.copy() as! UnitPrice
        
        
        let removedProductToCartEvent = RemovedProductFromCartEvent.init(label: "removed " + product.name + " from cart",
                                                                         sku: product.sku,
                                                                         finalPrice: finalPrice,
                                                                         quantity: cartItem.quantity)
        removedProductToCartEvent.setCategory(product.categories)
        removedProductToCartEvent.setCategories([
            product.categories
            ])
        removedProductToCartEvent.setProducer(product.brand)
        removedProductToCartEvent.setURL(productDeepLink)
        removedProductToCartEvent.setOffline(false)
        removedProductToCartEvent.setRegularPrice(regularPrice)
        removedProductToCartEvent.setDiscountedPrice(discountedPrice)
        
        Tracker.send(removedProductToCartEvent)
    }
    
    private func sendRemovedProductEventForEachItem() {
        for cartItem in cartItems {
            sendRemovedProductEvent(cartItem: cartItem)
        }
    }
    
    private func sendCompleteTransactionEvent() {
        var cartFinalUnitPrice: Float = 0
        var eventProducts = [EventProduct]()
        
        for cartItem in self.cartItems {
            let product: Product = cartItem.product
            
            let eventProduct = EventProduct()
            eventProduct.name = product.name
            eventProduct.sku = product.sku
            eventProduct.categories = [product.categories]
            eventProduct.imageURL = product.imageURL
            
            let regularPrice = UnitPrice(amount: Float(cartItem.product.price))
            eventProduct.regularPrice = regularPrice
            
            let finalPriceAmount = Float(cartItem.quantity) * Float(product.price)
            let finalPrice = UnitPrice(amount: finalPriceAmount)
            eventProduct.finalPrice = finalPrice
            
            eventProduct.quantity = cartItem.quantity
            
            cartFinalUnitPrice += finalPriceAmount
            eventProducts.append(eventProduct)
        }
        
        let revenue = UnitPrice(amount: 10)
        let value = UnitPrice(amount: cartFinalUnitPrice)
        
        let completedTransactionEvent = CompletedTransactionEvent(label: "")
        completedTransactionEvent.setProducts(eventProducts)
        completedTransactionEvent.setValue(value)
        completedTransactionEvent.setRevenue(revenue)
        completedTransactionEvent.setOrderId("1234")
        completedTransactionEvent.setOrderStatus("PAYMENT_FINISHED")
        completedTransactionEvent.setPaymentInfo([
            "paymentType": "",
            "paymentAmount": "",
            "paymentCurrency": "",
            "paymentTransactionNumber": ""
        ])
        
        completedTransactionEvent.setRecordedAt(Date())
        
        if let voucherCode = self.voucherCode {
            completedTransactionEvent.setDiscountCode(voucherCode)
        }
        
        Tracker.send(completedTransactionEvent)
    }
    
    func sendStartHitTimerEvent() {
        let hitTimerEvent = HitTimerEvent(label: "Shopping Cart process - start")
        Tracker.send(hitTimerEvent)
    }
    
    func sendEndHitTimerEvent() {
        let hitTimerEvent = HitTimerEvent(label: "Shopping Cart process - end")
        Tracker.send(hitTimerEvent)
    }
}
