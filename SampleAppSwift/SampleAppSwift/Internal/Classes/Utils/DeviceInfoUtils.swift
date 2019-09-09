//
//  DeviceInfoUtils.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2019 Synerise. All rights reserved.
//

import UIKit

class DeviceInfoUtils {

    static func isIpad() -> Bool {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone: return false
        case .pad: return true
        default: return false
        }
    }
}
