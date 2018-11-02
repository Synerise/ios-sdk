//
//  ProfileInfoViewModel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ProfileInfoViewModel {

    var isProcessing: ObservingType<Bool> = ObservingType.init(false)
    var isDownloaded: ObservingType<Bool> = ObservingType.init(false)
    
    var avatarURL: ObservingType<URL>
    var name: BindingType<String>
    var email: BindingType<String>
    
    // MARK: - Init
    
    init() {
        self.avatarURL = ObservingType<URL>.init()
        self.name = BindingType<String>.init("")
        self.email = BindingType<String>.init("")
    }
    
    // MARK: - Public
    
    func downloadDataIfNeeded() {
        self.isProcessing.value = true
        
        Client.getAccount(success: { (clientAccountInformation) in
            DispatchQueue.main.async {
                self.isProcessing.value = false
                self.dataDownloaded(clientAccountInformation)
            }
        }, failure: { (error) in
            DispatchQueue.main.async {
                self.isProcessing.value = false
                DebugUtils.print(error.localizedDescription)
            }
        })
    }
    
    // MARK: - Private
    
    private func dataDownloaded(_ data: ClientAccountInformation) {
        //self.avatarURL.value = URL(string: "")
        self.name.value = "\(data.firstName ?? "") \(data.lastName ?? "")"
        self.email.value = data.email
        
        self.isDownloaded.value = true
    }
}
