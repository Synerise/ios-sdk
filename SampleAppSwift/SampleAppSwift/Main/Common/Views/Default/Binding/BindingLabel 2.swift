//
//  BindingLabel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class BindingLabel: DefaultLabel {
    
    typealias Element = String
    
    var changedClosure: (() -> Void)?
    
    // MARK: - Public
    
    func bind(to bindingObject: BindingType<String>) {
        bindingObject.valueChanged = { [weak self] newValue in
            self?.text = newValue
        }
    }
}
