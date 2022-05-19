//
//  CategoryItemTableViewModel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class CategoryItemTableViewModel {
    
    let identificator: Int
    let title: String
    let backgroundColor: UIColor
    let icon: UIImage
    
    // MARK: - Init
    
    init(caregory: Category) {
        self.identificator = caregory.identificator
        self.title = caregory.title
        self.backgroundColor = caregory.backgroundColor
        self.icon = caregory.icon
    }
}
