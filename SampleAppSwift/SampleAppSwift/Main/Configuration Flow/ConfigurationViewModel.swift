//
//  ConfigurationViewModel.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation

class ConfigurationViewModel {
    
    var coordinator: ConfigurationCoordinator?
    
    var businessAPIKey: BindingType<String>
    var clientAPIKey: BindingType<String>
    
    var onFinishButton: (() -> Void)?
    
    // MARK: - Init
    
    init() {
        self.businessAPIKey = BindingType<String>.init("")
        self.clientAPIKey = BindingType<String>.init("")
    }
    
    init(businessAPIKey: String, clientAPIKey: String) {
        self.businessAPIKey = BindingType<String>.init(businessAPIKey)
        self.clientAPIKey = BindingType<String>.init(clientAPIKey)
    }
    
    // MARK: - Public
    
    func isFormValid() -> Bool {
        if let businessAPIKey = businessAPIKey.value, let clientAPIKey = clientAPIKey.value, !businessAPIKey.isEmpty, !clientAPIKey.isEmpty {
           return true
        }
        
        return false
    }
   
    func saveAPIKeys() {
         let settingsService = coordinator?.applicationController.serviceProvider.getSettingsService()
        
        settingsService?.set(businessAPIKey.value, forKey: SettingsServiceKey.syneriseBusinessAPIKey)
        settingsService?.set(clientAPIKey.value, forKey: SettingsServiceKey.syneriseClientAPIKey)
    }
}
