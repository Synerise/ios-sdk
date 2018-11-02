//
//  CartSection.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class CartSection {
    
    let title: String
    var rows: [AnyObject]
    
    // MARK: - Init
    
    init(title: String, rows: [AnyObject]) {
        self.title = title
        self.rows = rows
    }
}
