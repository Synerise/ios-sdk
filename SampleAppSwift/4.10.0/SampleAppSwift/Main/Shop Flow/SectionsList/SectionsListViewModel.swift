//
//  SectionsListViewModel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation

class SectionsListViewModel {
    
    var coordinator: ShopCoordinator?
    
    var sectionModels: [Section]
    var sectionItemCollectionViewModels: [SectionItemCollectionViewModel] = [SectionItemCollectionViewModel]()
    
    // MARK: - Init
    
    init() {
        self.sectionModels = SectionDataSource.getSections()
        populateSections()
    }
    
    // MARK: - Public
    
    func getItemViewModel(index: Int) -> SectionItemCollectionViewModel {
        let viewModel = sectionItemCollectionViewModels[index]
        return viewModel
    }
    
    func numberOfItems() -> Int {
        return sectionItemCollectionViewModels.count
    }
    
    func populateSections() {
        for section in sectionModels {
            sectionItemCollectionViewModels.append(SectionItemCollectionViewModel(section: section))
        }
    }
    
    func sectionWasSelected(index: Int) {
        let section = sectionModels[index]
        coordinator?.sectionWasSelected(section: section)
    }
}
