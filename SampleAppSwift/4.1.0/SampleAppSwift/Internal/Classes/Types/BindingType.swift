//
//  Observable.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation

class BindingType<T> {

    var value: T? {
        get {
            return _value
        }
        set {
            _value = newValue
            valueChanged?(_value)
        } }

    var valueChanged: ((T?) -> Void)?

    private var _value: T?

    init(_ value: T) {
        _value = value
    }

    func bindingChanged(to newValue: T) {
        _value = newValue
    }
}
