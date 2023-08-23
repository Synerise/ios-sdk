//
//  SectionItemCollectionViewModel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class SectionItemCollectionViewModel {
    
    let identificator: Int
    let sectionName: String
    let productImage: UIImage
    let backgroundImage: UIImage
    let backgroundColor: UIColor
    let patternImage: UIImage
    let textImage: UIImage
    let arrowImage: UIImage
    let bottomText: String
    let bottomTextColor: UIColor
    
    // MARK: - Init
    
    init(section: Section) {
        self.identificator = section.identificator
        self.sectionName = section.sectionName
        self.productImage = section.productImage
        self.backgroundImage = section.backgroundImage
        self.backgroundColor = section.backgroundColor
        self.patternImage = section.patternImage
        self.textImage = section.textImage
        self.arrowImage = section.arrowImage
        self.bottomText = section.bottomText
        self.bottomTextColor = section.bottomTextColor
    }
}
