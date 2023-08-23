//
//  SettingsViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class SettingsViewController: DefaultViewController {

    var settingsService: SettingsService!
    
    @IBOutlet weak var sdkEnabledSwitch: UISwitch!
    
    @IBOutlet weak var notificationsEnabledSwitch: UISwitch!
    @IBOutlet weak var notificationsDisableInAppAlertsSwitch: UISwitch!
    @IBOutlet weak var notificationsEncryptionSwitch: UISwitch!
    
    @IBOutlet weak var autoTrackingEnabledSwitch: UISwitch!
    @IBOutlet weak var trackinghEnabledSwitch: UISwitch!
    
    // MARK: - IBAction
    
    @IBAction func sdkEnabledTapped() {
        Synerise.settings.sdk.enabled = self.sdkEnabledSwitch.isOn
        settingsService.set(self.sdkEnabledSwitch.isOn, forKey: .sdkEnabledKey)
    }
    
    @IBAction func notificationsEnabledTapped() {
        Synerise.settings.notifications.enabled = self.notificationsEnabledSwitch.isOn
        settingsService.set(self.notificationsEnabledSwitch.isOn, forKey: .notificationsEnabledKey)
    }
    
    @IBAction func notificationsDisableInAppAlertsTapped() {
        Synerise.settings.notifications.disableInAppAlerts = self.notificationsDisableInAppAlertsSwitch.isOn
        settingsService.set(self.notificationsDisableInAppAlertsSwitch.isOn, forKey: .notificationsDisableInAppAlertsKey)
    }
    
    @IBAction func notificationsEncryptionTapped() {
        Synerise.settings.notifications.encryption = self.notificationsEncryptionSwitch.isOn
        settingsService.set(self.notificationsEncryptionSwitch.isOn, forKey: .notificationsEncryptionKey)
    }
    
    @IBAction func autoTrackingEnabledTapped() {
        Synerise.settings.tracker.autoTracking.enabled = self.autoTrackingEnabledSwitch.isOn
        settingsService.set(self.autoTrackingEnabledSwitch.isOn, forKey: .autoTrackingEnabledKey)
    }
    
    @IBAction func trackingEnabledTapped() {
        Synerise.settings.tracker.tracking.enabled = self.trackinghEnabledSwitch.isOn
        settingsService.set(self.trackinghEnabledSwitch.isOn, forKey: .trackingEnabledKey)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareLeftMenuButton()
        loadSettings()
    }
    
    // MARK: - Private
    
    func loadSettings() {
        self.sdkEnabledSwitch.isOn = Synerise.settings.sdk.enabled
        self.notificationsEnabledSwitch.isOn = Synerise.settings.notifications.enabled
        self.notificationsDisableInAppAlertsSwitch.isOn = Synerise.settings.notifications.disableInAppAlerts
        self.notificationsEncryptionSwitch.isOn = Synerise.settings.notifications.encryption
        self.autoTrackingEnabledSwitch.isOn = Synerise.settings.tracker.autoTracking.enabled
        self.trackinghEnabledSwitch.isOn = Synerise.settings.tracker.tracking.enabled
    }
}
