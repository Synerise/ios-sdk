//
//  Product.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation

class Product {
    
    let brand: String
    let name: String
    let sku: String
    let description: String
    let imageURL: URL
    let price: Double
    let rating: Double
    let ratingCount: Int
    let categories: String
    
    var isPromotion: Bool = false
    
    // MARK: - Init
    
    init(brand: String, name: String, sku: String, description: String, imageURL: URL, price: Double, rating: Double, ratingCount: Int, categories: String) {
        self.brand = brand
        self.name = name
        self.sku = sku
        self.description = description
        self.imageURL = imageURL
        self.price = price
        self.rating = rating
        self.ratingCount = ratingCount
        self.categories = categories
    }
}

extension Product: Equatable {
    static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.brand == rhs.brand && lhs.name == rhs.name
    }
}
