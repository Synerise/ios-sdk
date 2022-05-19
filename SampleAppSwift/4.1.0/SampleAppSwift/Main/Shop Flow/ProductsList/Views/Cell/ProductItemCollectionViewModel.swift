//
//  ProductsItemCollectionViewModel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation

class ProductItemCollectionViewModel {
    
    let brand: String
    let name: String
    let sku: String
    let description: String
    let imageURL: URL?
    let price: Double
    let rating: Double
    let ratingCount: Int
    
    var isPriceVisible: Bool = true
    
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
    }
    
    // MARK: - Public
    
    func priceWithCurrency() -> String {
        return "$ \(price)"
    }
}
