//
//  Updatable.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation

protocol Updatable {
    func update<T: AnyObject>(_ object: T)
}
