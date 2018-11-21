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
    
    var clientAPIKey: BindingType<String>
    
    var onFinishButton: (() -> Void)?
    
    // MARK: - Init
    
    init() {
        self.clientAPIKey = BindingType<String>.init("")
    }
    
    init(clientAPIKey: String) {
        self.clientAPIKey = BindingType<String>.init(clientAPIKey)
    }
    
    // MARK: - Public
    
    func isFormValid() -> Bool {
        if let clientAPIKey = clientAPIKey.value, !clientAPIKey.isEmpty {
           return true
        }
        
        return false
    }
   
    func saveAPIKeys() {
         let settingsService = coordinator?.applicationController.serviceProvider.getSettingsService()
        settingsService?.set(clientAPIKey.value, forKey: SettingsServiceKey.syneriseClientAPIKey)
    }
}
