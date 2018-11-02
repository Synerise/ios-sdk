//
//  ProductsListViewModel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation

class ProductsListViewModel {
    
    var coordinator: ShopCoordinator?
    
    var category: Category?
    
    var productModels: [Product]?
    var productItemCollectionViewModels: [ProductItemCollectionViewModel] = [ProductItemCollectionViewModel]()
    
    // MARK: - Init
    
    init(category: Category) {
        self.category = category
        populateProducts()
    }
    
    // MARK: - Public
    
    func getItemViewModel(index: Int) -> ProductItemCollectionViewModel {
        return productItemCollectionViewModels[index]
    }
    
    func numberOfItems() -> Int {
        return productItemCollectionViewModels.count
    }
    
    func productWasSelected(index: Int) {
        guard let productModels = productModels else { return }
        print(productModels)
        coordinator?.productWasSelected(product: productModels[index])
    }
    
    // MARK: - Private
    
    private func populateProducts() {
        guard let category = category, let productModels = ProductDataSource.getProducts(categoryId: category.identificator) else { return }
        self.productModels = productModels
        for product in productModels {
            let productItemCollectionViewModel = ProductItemCollectionViewModel(product: product)
            productItemCollectionViewModels.append(productItemCollectionViewModel)
        }
    }
}
