//
//  ObservingType.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation

class ObservingType<T> {

    var value: T? {
        get {
            return _value
        }
        set {
            _value = newValue
            notify()
        }
    }

    var valueChanged: ((T) -> Void)? {
        didSet {
            guard let guardedValueChanged = valueChanged else {
                return
            }

            self.observe(guardedValueChanged)
        }
    }

    private var _value: T?
    private var onValueChangeClosures: [((T) -> Void)] = [((T) -> Void)]()

    // MARK: - Init

    init() {
        
    }
    
    init(_ value: T) {
        _value = value
    }

    // MARK: - Public

    func observe(_ closure: @escaping (T) -> Void) {
        onValueChangeClosures.append(closure)
    }

    // MARK: - Private

    private func notify() {
        guard let value = _value else {
            return
        }

        guard !onValueChangeClosures.isEmpty else {
            return
        }

        onValueChangeClosures.forEach { closure in
            closure(value)
        }
    }
}
