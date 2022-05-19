//
//  ProductDetailsViewModel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ProductDetailsViewModel {
    
    let brand: String
    let name: String
    let sku: String
    let description: String
    let imageURL: URL
    let price: Double
    let rating: Double
    let ratingCount: Int
    let categories: String
    
    var isPriceVisible: Bool = true
    var isFavorite: ObservingType<Bool> = ObservingType.init(false)
    
    // MARK: - Init
    
    init(product: Product) {
        self.brand = product.brand
        self.name = product.name
        self.sku = product.sku
        self.description = product.description
        self.imageURL = product.imageURL
        self.price = product.price
        self.rating = product.rating
        self.ratingCount = product.ratingCount
        self.categories = product.categories
        
        if product.isPromotion {
            self.isPriceVisible = false
        }
    }
    
    // MARK: - Public
    
    func productWasAdded() {
        addProductToCart()
        UserInfoMessageManager.shared.success("Product was added to cart", nil)
    }
    
    func manageProductAsFavorite() {
        guard let isFavorite = isFavorite.value else {
            return
        }
        
        if !isFavorite {
            addProductToFavorites()
            UserInfoMessageManager.shared.success("Product added to favorites", nil)
        } else {
            removeProductFromFavorites()
            UserInfoMessageManager.shared.info("Product removed from favorites", nil)
        }
    }
    
    func sendRatingEvent(rating: Double) {
        let params = TrackerParams.make { (builder) in
            builder.setString(self.name, forKey: "productName")
            builder.setString(self.sku, forKey: "SKU")
            builder.setDouble(self.price, forKey: "price")
            builder.setInt(Int(rating), forKey: "rating")
        }
        
        let customEvent = CustomEvent.init(label: self.name, action: "\(rating)", params: params)
        Tracker.send(customEvent)
    }
    
    // MARK: - Private
    
    private func addProductToCart() {
        let product = Product(brand: self.brand, name: self.name, sku: self.sku, description: self.description, imageURL: self.imageURL, price: self.price, rating: self.rating, ratingCount: self.ratingCount, categories: self.categories)
        product.isPromotion = !self.isPriceVisible
        
        let cartItem = CartItem(product: product, quantity: 1)
        CartManager.shared.addCartItem(cartItem: cartItem)
    }
    
    private func addProductToFavorites() {
        self.isFavorite.value = true
        
        let params = TrackerParams.make { (builder) in
            builder.setString(self.name, forKey: "productName")
            builder.setString(self.sku, forKey: "sku")
            builder.setDouble(self.price, forKey: "price")
        }
        
        let event = ProductAddedToFavoritesEvent(label: self.name, params: params)
        Tracker.send(event)
    }
    
    private func removeProductFromFavorites() {
        self.isFavorite.value = false
    }
}

extension ProductDetailsViewModel: ProductDetailsViewDelegate {
    func addProductButtonWasTapped(_ productDetailsView: ProductDetailsView) {
        productWasAdded()
    }
    
    func setFavoriteButtonWasTapped(_ productDetailsView: ProductDetailsView) {
        manageProductAsFavorite()
    }
}
