//
//  LoginWithExternalClientTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class LoginWithExternalClientTableViewController: DefaultTableViewController {

    @IBOutlet weak var clientUuidTextField: UITextField!
    @IBOutlet weak var clientEmailTextField: UITextField!
    @IBOutlet weak var clientCustomIdTextField: UITextField!
    
    // MARK: - IBAction
    
    @IBAction func loginWithUuid() {
        guard let uuid = clientUuidTextField.text else {
            return
        }
        
        do {
            self.showLoading()
            try SNRExceptionHandler.catchException {
                Client.createAuthToken(uuid: uuid, success: { (success) in
                    if success {
                        self.hideLoading()
                        self.showSuccessInfo()
                    }
                }) { (error) in
                    self.hideLoading()
                    self.showErrorInfo(error as NSError)
                }
            }
        } catch let error as NSError {
            self.hideLoading()
            self.showErrorInfo(error)
        }
    }
    
    @IBAction func loginWithEmail() {
        guard let email = clientEmailTextField.text else {
            return
        }
        
        do {
            self.showLoading()
            try SNRExceptionHandler.catchException {
                Client.createAuthToken(email: email, success: { (success) in
                    if success {
                        self.hideLoading()
                        self.showSuccessInfo()
                    }
                }) { (error) in
                    self.hideLoading()
                    self.showErrorInfo(error as NSError)
                }
            }
        } catch let error as NSError {
            self.hideLoading()
            self.showErrorInfo(error)
        }
    }
    
    @IBAction func loginWithCustomId() {
        guard let customId = clientCustomIdTextField.text else {
            return
        }

        do {
            self.showLoading()
            try SNRExceptionHandler.catchException {
                Client.createAuthToken(customId: customId, success: { (success) in
                    if success {
                        self.hideLoading()
                        self.showSuccessInfo()
                    }
                }) { (error) in
                    self.hideLoading()
                    self.showErrorInfo(error as NSError)
                }
            }
        } catch let error as NSError {
            self.hideLoading()
            self.showErrorInfo(error)
        }
        
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Login for external client"
    }
}
