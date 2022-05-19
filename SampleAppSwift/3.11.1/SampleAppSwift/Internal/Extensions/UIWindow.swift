//
//  UIWindow.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import UIKit

extension UIWindow {
    
    static func mainWindow() -> UIWindow? {
        let windows = UIApplication.shared.windows
        return windows.first
    }
}
