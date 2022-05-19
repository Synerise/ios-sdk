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
    
    private var dataDownloaded: Bool = false
    
    // MARK: - Init
    
    init() {
        self.avatarURL = ObservingType<URL>.init()
        self.name = BindingType<String>.init("")
        self.email = BindingType<String>.init("")
    }
    
    // MARK: - Public
    
    func downloadDataIfNeeded() {
        if dataDownloaded {
            return
        }
        
        self.isProcessing.value = true
        
        Client.getAccount(success: { (clientAccountInformation) in
            self.isProcessing.value = false
            self.profileDataDownloaded(clientAccountInformation)
            
            Content.getDocument(slug: "points", success: { document in
                self.pointsDataDownloaded(document)
                
                self.isProcessing.value = false
                self.isDownloaded.value = true
            }) { error in
                DebugUtils.print(error.localizedDescription)
                
                self.isProcessing.value = false
            }
        }, failure: { (error) in
            self.isProcessing.value = false
            
            DebugUtils.print(error.localizedDescription)
        })
    }
    
    // MARK: - Private
    
    private func profileDataDownloaded(_ data: ClientAccountInformation) {
        self.name.value = "\(data.firstName ?? "") \(data.lastName ?? "")"
        self.email.value = data.email
    }
    
    private func pointsDataDownloaded(_ data: [AnyHashable: Any]) {
        if let email = self.email.value,
            let content = data["content"] as? [AnyHashable: Any],
            let points = content["points"] as? String {
            self.email.value = "\(email)\n\nAvailable points: \(points)"
        }
    }
}
