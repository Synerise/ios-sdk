//
//  Storyboards.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import UIKit

struct Storyboards {
    private static let developerToolsFlow: String = "DeveloperToolsFlow"

    static func getDeveloperToolsFlow() -> UIStoryboard {
        return UIStoryboard.init(name: developerToolsFlow, bundle: Bundle.main)
    }
}
