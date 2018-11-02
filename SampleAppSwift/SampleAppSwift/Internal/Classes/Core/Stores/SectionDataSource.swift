//
//  SectionDataSource.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class SectionDataSource {
    
    // MARK: - Static
    
    static func getSections() -> [Section] {
        return [
            Section(identificator: 1, sectionName: "Electronics", productImage: #imageLiteral(resourceName: "Shop Flow/Sections/Electronic/electronic_card_image"), backgroundImage: #imageLiteral(resourceName: "Shop Flow/Sections/Electronic/electronic_card_bg"), backgroundColor: #colorLiteral(red: 0.1568627451, green: 0.05882352941, blue: 0.5882352941, alpha: 1), patternImage: #imageLiteral(resourceName: "Shop Flow/Sections/Electronic/electronic_card_pattern"), textImage: #imageLiteral(resourceName: "Shop Flow/Sections/Electronic/electronic_card_text"), arrowImage: #imageLiteral(resourceName: "Shop Flow/Sections/Electronic/electronic_card_arrow"), bottomText: "View products", bottomTextColor: #colorLiteral(red: 0.1450980392, green: 1, blue: 0.7019607843, alpha: 1)),
            Section(identificator: 2, sectionName: "Food", productImage: #imageLiteral(resourceName: "Shop Flow/Sections/Food/food_card_image"), backgroundImage: #imageLiteral(resourceName: "Shop Flow/Sections/Food/food_card_bg"), backgroundColor: #colorLiteral(red: 0.168627451, green: 0.4470588235, blue: 0.01568627451, alpha: 1), patternImage: #imageLiteral(resourceName: "Shop Flow/Sections/Food/food_card_pattern"), textImage: #imageLiteral(resourceName: "Shop Flow/Sections/Food/food_card_text"), arrowImage: #imageLiteral(resourceName: "Shop Flow/Sections/Food/food_card_arrow"), bottomText: "View products", bottomTextColor: #colorLiteral(red: 1, green: 0.8549019608, blue: 0.2745098039, alpha: 1)),
            Section(identificator: 3, sectionName: "Fashion", productImage: #imageLiteral(resourceName: "Shop Flow/Sections/Fashion/fashion_card_image"), backgroundImage: #imageLiteral(resourceName: "Shop Flow/Sections/Fashion/fashion_card_bg"), backgroundColor: #colorLiteral(red: 0.3137254902, green: 0.03137254902, blue: 0.631372549, alpha: 1), patternImage: #imageLiteral(resourceName: "Shop Flow/Sections/Fashion/fashion_card_pattern"), textImage: #imageLiteral(resourceName: "Shop Flow/Sections/Fashion/fashion_card_text"), arrowImage: #imageLiteral(resourceName: "Shop Flow/Sections/Fashion/fashion_card_arrow"), bottomText: "View products", bottomTextColor: #colorLiteral(red: 1, green: 0.6274509804, blue: 0.5882352941, alpha: 1)),
            Section(identificator: 4, sectionName: "Culture", productImage: #imageLiteral(resourceName: "Shop Flow/Sections/Culture/culture_card_image"), backgroundImage: #imageLiteral(resourceName: "Shop Flow/Sections/Culture/culture_card_bg"), backgroundColor: #colorLiteral(red: 0.007843137255, green: 0.4666666667, blue: 0.4274509804, alpha: 1), patternImage: #imageLiteral(resourceName: "Shop Flow/Sections/Culture/culture_card_pattern"), textImage: #imageLiteral(resourceName: "Shop Flow/Sections/Culture/culture_card_text"), arrowImage: #imageLiteral(resourceName: "Shop Flow/Sections/Culture/culture_card_arrow"), bottomText: "View products", bottomTextColor: #colorLiteral(red: 0.9843137255, green: 0.5960784314, blue: 0.7764705882, alpha: 1))
        ]
    }
    
}
