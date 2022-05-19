//
//  DebugUtils.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation

class DebugUtils: NSObject {

    static func print(_ message: String, filePath: String = #file, line: Int = #line) {
        #if DEBUG
        let components = filePath.components(separatedBy: "/")
        let file = components.isEmpty ? "" : components.last!

        Swift.print("[LOG][\(file)][\(line)] \(message)")
        #endif
    }
}
