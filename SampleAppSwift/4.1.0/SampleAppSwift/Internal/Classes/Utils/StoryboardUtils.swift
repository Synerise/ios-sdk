//
//  StoryboardUtils.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import UIKit

class StoryboardUtils {

    // MARK: - Static

    static func instantiateInitialViewController(storyboard: UIStoryboard) -> UIViewController {
        guard let viewController = storyboard.instantiateInitialViewController() else {
            fatalError()
        }

        return viewController
    }

    static func instantiateViewController(_ identifier: String, storyboard: UIStoryboard) -> UIViewController {
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
}
