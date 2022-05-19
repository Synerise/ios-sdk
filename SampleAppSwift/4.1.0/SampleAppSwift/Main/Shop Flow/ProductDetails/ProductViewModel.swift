//
//  ProductDetailsViewModel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation

class ProductViewModel {
    
    var coordinator: ShopCoordinator?
    
    var product: Product?
    
    var productDetailsViewModel: ProductDetailsViewModel?
    
    // MARK: - Init
    
    init(product: Product) {
        self.product = product
        populateProductDetailsViewModel()
    }
    
    // MARK: - Public
    
    func populateProductDetailsViewModel() {
        guard let product = product else { return }
        productDetailsViewModel = ProductDetailsViewModel(product: product)
    }
}
