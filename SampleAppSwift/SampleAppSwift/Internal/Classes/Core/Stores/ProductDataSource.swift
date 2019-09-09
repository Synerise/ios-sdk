//
//  ProductDataSource.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import SwiftyJSON

class ProductDataSource {
    
    // MARK: - Static
    
    static func getProducts(categoryId: Int) -> [Product]? {
        let filename = "Products_\(categoryId)"
        if let json: JSON = JSONHelper.readJson(filename: filename) {
            return parseJSON(json)
        }
        
        return nil
    }
    
    static func getProductBySku(sku: String, fromCategories categories: [Int]) -> Product? {
        var productBySku: Product?
        
        categories.forEach { (categoryId) in
            if let products = getProducts(categoryId: categoryId) {
                products.forEach({ (product) in
                    if product.sku == sku {
                        productBySku = product
                    }
                })
            }
        }
        
        return productBySku
    }
    
    private static func parseJSON(_ json: JSON) -> [Product]? {
            var products = [Product]()
            for (_, subJson):(String, JSON) in json {
                let brand = subJson["brand"].stringValue
                let name = subJson["name"].stringValue
                let sku = subJson["sku"].stringValue
                let description = subJson["description"].stringValue
                let imageURL = URL(string: subJson["image"].stringValue)
                let price = subJson["price"].doubleValue
                let rating = subJson["rating"].doubleValue
                let ratingCount = subJson["ratingCount"].intValue
                let categories = subJson["categories"].stringValue
                
                let product = Product(brand: brand, name: name, sku: sku, description: description, imageURL: imageURL!, price: price, rating: rating, ratingCount: ratingCount, categories: categories)
                products.append(product)
            }
        
            return products
    }
}
