//
//  InAppMessageViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2022 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class InAppMessageViewController: DefaultViewController {

    // MARK: - IBAction
    
    @IBAction func inAppMessageFulscreen() {
        let inAppMessageDictionary = InAppMessagesDictionaryData.getBasicFullscreen()
        let selector = NSSelectorFromString("showInAppMessageFromDictionary:")
        if Injector.responds(to: selector) {
            Injector.perform(selector, with: inAppMessageDictionary)
        } else {
            self.presentAlert(title: "Only DEBUG feature!", message: "This feature is available in DEBUG archive only.")
        }
    }
    
    @IBAction func inAppMessageModal() {
        let inAppMessageDictionary = InAppMessagesDictionaryData.getBasicModal()
        let selector = NSSelectorFromString("showInAppMessageFromDictionary:")
        if Injector.responds(to: selector) {
            Injector.perform(selector, with: inAppMessageDictionary)
        } else {
            self.presentAlert(title: "Only DEBUG feature!", message: "This feature is available in DEBUG archive only.")
        }
    }
    
    @IBAction func inAppMessageTopBar() {
        let inAppMessageDictionary = InAppMessagesDictionaryData.getBasicTopBar()
        let selector = NSSelectorFromString("showInAppMessageFromDictionary:")
        if Injector.responds(to: selector) {
            Injector.perform(selector, with: inAppMessageDictionary)
        } else {
            self.presentAlert(title: "Only DEBUG feature!", message: "This feature is available in DEBUG archive only.")
        }
    }
    
    @IBAction func inAppMessageBottomBar() {
        let inAppMessageDictionary = InAppMessagesDictionaryData.getBasicBottomBar()
        let selector = NSSelectorFromString("showInAppMessageFromDictionary:")
        if Injector.responds(to: selector) {
            Injector.perform(selector, with: inAppMessageDictionary)
        } else {
            self.presentAlert(title: "Only DEBUG feature!", message: "This feature is available in DEBUG archive only.")
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "In-App messages"
        
        prepareBackButton()
    }
}
