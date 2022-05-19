//
//  BindingTextField.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class BindingTextField: DefaultTextField, Bindable {
    
    typealias Element = String

    override public var text: String? {
        didSet {
            valueChanged()
        }
    }
    
    var changedClosure: (() -> Void)?

    // MARK: - Public
    
    func bind(to bindingObject: BindingType<String>) {
        addTarget(self, action: #selector(BindingTextField.valueChanged), for: .editingChanged)
        
        changedClosure = { [weak self] in
            bindingObject.bindingChanged(to: self?.text ?? "")
        }

        bindingObject.valueChanged = { [weak self] newValue in
            self?.text = newValue
        }
    }

    // MARK: - Private
    
    @objc func valueChanged() {
        changedClosure?()
    }
}
