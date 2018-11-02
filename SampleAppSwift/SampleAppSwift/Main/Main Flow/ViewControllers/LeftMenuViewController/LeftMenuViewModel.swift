//
//  LeftMenuViewModel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import UIKit
import SyneriseSDK

class LeftMenuItemViewModel {

    let identity: Int
    let iconImageView: UIImageView
    let title: String

    // MARK: - Init

    init(_ model: LeftMenuItem) {
        self.identity = model.identity
        self.iconImageView = UIImageView(image: model.icon)
        self.title = model.title
    }
}

class LeftMenuViewModel {

    var coordinator: MainCoordinator?
    
    var settingsService: SettingsService!
    
    var state: LeftMenuState = LeftMenuState.userNotLogged {
        didSet {
            self.updateNeeded = true
        }
    }
    
    var updateNeeded: Bool = false {
        didSet {
            if updateNeeded == true {
                update()
            }
            
            updateNeeded = false
        }
    }
    var onUpdate: (() -> Void)?
    
    var profileInfoViewModel: ProfileInfoViewModel = {
        let profileInfoViewModel = ProfileInfoViewModel()
        
        return profileInfoViewModel
    }()
    
    lazy var syneriseSDKConfigurationInfoString: String = {
        guard let businessApiKey: String = self.settingsService.get(SettingsServiceKey.syneriseBusinessAPIKey) else {
            fatalError()
        }
        
        guard let clientApiKey: String = self.settingsService.get(SettingsServiceKey.syneriseClientAPIKey) else {
            fatalError()
        }
        
        return """
        SyneriseSDK Business API Key:
        \(businessApiKey)
        
        SyneriseSDK Client API Key:
        \(clientApiKey)
        """
    }()
    
    lazy var applicationBuildVersionString: String = {
        guard let sampleBuild = Bundle.main.infoDictionary?["CFBundleVersion"] as? String else {
            return ""
        }
        
        guard let sdkVersion = Bundle(identifier: "com.synerise.SyneriseSDK")?.infoDictionary?["CFBundleShortVersionString"] as? String else {
            return ""
        }
        
        return """
        Sample App | build: \(sampleBuild)
        SyneriseSDK | version: \(sdkVersion)
        """
    }()

    private var leftMenuItemViewModels: [LeftMenuItemViewModel] = [LeftMenuItemViewModel]()
    
    // MARK: - Init

    init() {
        prepareLeftMenuItems()
    }

    // MARK: - Public

    func numberOfItems() -> Int {
        return leftMenuItemViewModels.count
    }

    func itemForIndex(_ index: Int) -> LeftMenuItemViewModel {
        return leftMenuItemViewModels[index]
    }

    func itemSelected(_ index: Int) {
        let selectedItemViewModel: LeftMenuItemViewModel = itemForIndex(index)

        if let selectedItemIdentity: LeftMenuItemIdentity = LeftMenuItemIdentity(rawValue: selectedItemViewModel.identity) {
            coordinator?.leftMenuItemDidSelect(selectedItemIdentity)
        }
    }
    
    func loginSelected() {
        coordinator?.leftMenuItemDidSelect(LeftMenuItemIdentity.login)
    }

    // MARK: - Private
    private func update() {
        prepareLeftMenuItems()
        
        onUpdate?()
    }
    
    private func prepareLeftMenuItems() {
        let leftMenuState: LeftMenuState = self.state
        let leftMenuItems: [LeftMenuItem] = LeftMenuDataSource.getLeftMenuItems(leftMenuState)

        self.leftMenuItemViewModels.removeAll()
        
        leftMenuItems.forEach { (item) in
            let itemViewModel = LeftMenuItemViewModel(item)
            self.leftMenuItemViewModels.append(itemViewModel)
        }
    }
}
