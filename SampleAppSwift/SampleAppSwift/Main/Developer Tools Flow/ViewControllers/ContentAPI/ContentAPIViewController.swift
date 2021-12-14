//
//  ContentAPIViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2019 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ContentAPIViewController: DefaultViewController {
    
    // MARK: IBAction
    
    @IBAction func getScreenView(_ sender: DefaultButton) {
        showLoading()
        Content.getScreenView(success: { (screenViewResponse) in
            self.hideLoading()
            
            self.pushDebugViewController(text: self.makeScreenView(screenViewResponse))
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
        
        sender.animateTapping()
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "VIEW_CONTROLLER_CONTENT_API_TITLE".localized()
        
        prepareBackButton()
    }
    
    // MARK: - Private
    
    private func makeScreenView(_ screenViewResponse: ScreenViewResponse) -> String {
        let identifier = screenViewResponse.identifier
        let hashString = screenViewResponse.hashString
        let path = screenViewResponse.path
        let name = screenViewResponse.name
        let priority = screenViewResponse.priority.stringValue
        let description = screenViewResponse.descriptionText ?? "-"
        
        let data = screenViewResponse.data
        
        let version = screenViewResponse.version
        let parentVersion = screenViewResponse.parentVersion ?? "-"
        
        let createdAt = screenViewResponse.createdAt
        let updatedAt = screenViewResponse.updatedAt
        
        let screenViewStringRepresentation = """
        ID: \(identifier)
        Hash: \(hashString)
        Path: \(path)
        Name: \(name)
        Priority: \(priority)
        Description: \(description)
        Data: \(data as AnyObject)
        Version: \(version)
        Parent Version: \(parentVersion)
        Created At: \(createdAt)
        Updated At: \(updatedAt)
        """
        
        return screenViewStringRepresentation
    }
}
