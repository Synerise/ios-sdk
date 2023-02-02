//
//  SettingsService.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

enum SettingsServiceKey: String {
    case syneriseClientAPIKey = "kClientAPIKey"
    case syneriseFirstInitializationLaunchKey = "kSyneriseFirstInitializationLaunchKey"
    
    case sdkEnabledKey = "kSdkEnabledKey"
    case notificationsEnabledKey = "kNotificationsEnabledKey"
    case notificationsDisableInAppAlertsKey = "kNotificationsDisableInAppAlertsKey"
    case notificationsEncryptionKey = "kNotificationsEncryptionKey"
    case autoTrackingEnabledKey = "kAutoTrackingEnabledKey"
    case trackingEnabledKey = "ktrackingEnabledKey"
}

private let kSettingsDefaultsKey = "kSettingsDefaultsKey"

protocol SettingsServiceType {
    func needsDefaultSettingsForKey(_ key: SettingsServiceKey) -> Bool
    func set<T>(_ value: T, forKey: SettingsServiceKey)
    func get<T>(_ key: SettingsServiceKey) -> T?
}

final class SettingsService: BaseService, SettingsServiceType {

    private var userDefaults = UserDefaults.standard
    private lazy var settings: [String: Any] = {
        () -> [String: Any] in
        var settings: [String: Any]? = UserDefaults.standard.dictionary(forKey: kSettingsDefaultsKey)

        if settings != nil {
            return settings!
        }

        return [String: Any]()
    }()

    func needsDefaultSettingsForKey(_ key: SettingsServiceKey) -> Bool {
        if let _: AnyObject = get(key) {
            return false
        }

        return true
    }

    func set<T>(_ value: T, forKey key: SettingsServiceKey) {
        settings[key.rawValue] = value
        saveSettings()
    }

    func get<T>(_ key: SettingsServiceKey) -> T? {
        return settings[key.rawValue] as? T
    }
    
    func remove(forKey key: SettingsServiceKey) {
        settings.removeValue(forKey: key.rawValue)
        saveSettings()
    }
    
    func removeAll() {
        settings.removeAll()
        saveSettings()
    }

    private func getSettings() -> [String: Any] {
        return settings
    }

    private func saveSettings() {
        userDefaults.set(settings, forKey: kSettingsDefaultsKey)
        userDefaults.synchronize()
    }
}
