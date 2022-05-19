//
//  BindedSegmentedControl.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class BindingSegmentedControl: DefaultSegmentedControl, Bindable {
    
    typealias Element = Int

    var changedClosure: (() -> Void)?
    
    // MARK: - Public
    
    func bind(to bindingObject: BindingType<Int>) {
        addTarget(self, action: #selector(BindingSegmentedControl.valueChanged), for: .valueChanged)

        changedClosure = { [weak self] in
            bindingObject.bindingChanged(to: self?.selectedSegmentIndex ?? 0)
        }

        bindingObject.valueChanged = { [weak self] newValue in
            if let newValue = newValue {
                self?.selectedSegmentIndex = newValue
            }
        }
    }

    // MARK: - Private
    
    @objc func valueChanged() {
        changedClosure?()
    }
}
