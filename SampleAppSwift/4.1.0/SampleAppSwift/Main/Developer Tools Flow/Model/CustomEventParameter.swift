//
//  CustomEventParameter.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation

enum ParameterType: String {
    case int = "Integer"
    case string = "String"
    case double = "Double"
}

class CustomEventParameter {
    
    let value: String
    let key: String
    let type: ParameterType
    
    // MARK: - Init
    
    init(value: String, key: String, type: ParameterType) {
        self.value = value
        self.key = key
        self.type = type
    }
    
}
