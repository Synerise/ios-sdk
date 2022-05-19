//
//  JSONTemplates.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import SwiftyJSON

class JSONHelper {
    
    static func readJson(filename: String) -> JSON? {
        do {
            if let file = Bundle.main.url(forResource: filename, withExtension: "json") {
                let data = try Data(contentsOf: file)
                
                return JSON(data)
            } else {
                DebugUtils.print("File \(filename) not found")
                
                return nil
            }
        } catch {
            DebugUtils.print(error.localizedDescription)
            
            return nil
        }
    }
}
