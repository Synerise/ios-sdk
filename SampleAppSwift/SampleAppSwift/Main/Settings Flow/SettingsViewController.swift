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
    
    @IBOutlet weak var disableInAppAlertsSwitch: UISwitch!
    
    // MARK: - IBAction
    
    @IBAction func disableInAppAlertsTapped() {
        Synerise.settings.notifications.disableInAppAlerts = self.disableInAppAlertsSwitch.isOn
        settingsService.set(self.disableInAppAlertsSwitch.isOn, forKey: .syneriseDisableInAppAlertsKey)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareLeftMenuButton()
        loadSettings()
    }
    
    // MARK: - Private
    
    func loadSettings() {
        self.disableInAppAlertsSwitch.isOn = Synerise.settings.notifications.disableInAppAlerts
    }
}
