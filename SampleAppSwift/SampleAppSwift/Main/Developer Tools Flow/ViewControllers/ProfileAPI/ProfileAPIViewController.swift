//
//  ProfileAPI.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ProfileAPIViewController: DefaultViewController {
    
    // MARK: - IBAction
    
    @IBAction func getTokenButtonWasPressed(_ sender: DefaultButton) {
        
        Profile.getToken(success: { (token) in
            DispatchQueue.main.async {
                self.pushToDebugTextViewController(token: token)
            }
        }, failure: { (error) in
            self.showErrorInfo(error as NSError)
        })
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "VIEW_CONTROLLER_PROFILE_API_TITLE".localized()
    }
    
    // MARK: - Private
    
    private func pushToDebugTextViewController(token: String) {
        let debugTextViewController = DebugTextViewController(text: token, copyEnabled: true)
        
        self.navigationController?.pushViewController(debugTextViewController, animated: true)
    }
}
