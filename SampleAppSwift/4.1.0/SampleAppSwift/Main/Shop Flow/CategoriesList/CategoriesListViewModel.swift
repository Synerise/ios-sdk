//
//  CategoriesListViewModel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation

class CategoriesListViewModel {
    
    var coordinator: ShopCoordinator?
    
     var sectionModel: Section
    
    var categoryModels: [Category]?
    var categoryItemTableViewModels: [CategoryItemTableViewModel] = [CategoryItemTableViewModel]()
    
    // MARK: - Init
    
    init(section: Section) {
        self.sectionModel = section
        populateCategories()
    }
    
    // MARK: - Public
    
    func getItemViewModel(index: Int) -> CategoryItemTableViewModel {
        return categoryItemTableViewModels[index]
    }
    
    func numberOfItems() -> Int {
        return categoryItemTableViewModels.count
    }
    
    func categoryWasSelected(index: Int) {
        guard let categoryModels = categoryModels else { return }
        coordinator?.categoryWasSelected(category: categoryModels[index])
    }
    
    // MARK: - Private
    
    private func populateCategories() {
        let identificator = sectionModel.identificator
        categoryModels = CategoryDataSource.getCategory(sectionId: identificator)
        
        guard let categoryModels = categoryModels else {
            return
        }
        
        for category in categoryModels {
            let categoryItemTableViewModel = CategoryItemTableViewModel(caregory: category)
            categoryItemTableViewModels.append(categoryItemTableViewModel)
        }
    }
}
