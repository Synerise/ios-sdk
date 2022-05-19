//
//  Bindable.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation

protocol Bindable {
    associatedtype Element

    func bind(to bindingObject: BindingType<Element>)
}
