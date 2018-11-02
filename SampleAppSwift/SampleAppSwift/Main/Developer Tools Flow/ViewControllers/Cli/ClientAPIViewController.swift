//
//  ClientAPI.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ClientAPIViewController: DefaultViewController {
    
    // MARK: - IBAction
    
    @IBAction func getTokenButtonWasPressed(_ sender: DefaultButton) {
        showLoading()
        Client.getToken(success: { (token) in
            self.hideLoading()
            
            DispatchQueue.main.async {
                self.pushToShowToken(token: token)
            }
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
        
        sender.animateTapping()
    }
    
    @IBAction func getAccountButtonWasPressed(_ sender: DefaultButton) {
        showLoading()
        Client.getAccount(success: { (clientAccountInformation) in
            self.hideLoading()
            
            DispatchQueue.main.async {
                let accountInformation = self.makeAccountInformation(clientAccountInformation)
                self.pushToShowClientAccountInformation(accountInformation: accountInformation)
            }
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
        
        sender.animateTapping()
    }
    
    @IBAction func getAnalyticsButtonWasPressed(_ sender: DefaultButton) {
        showLoading()
        Client.getAnalytics(success: { (array) in
            self.hideLoading()
            
            guard let analyticsMetrics = array as? [AnalyticsMetrics] else { return }
            guard let stringRepresentation = AnalyticsMetricsUtils(analyticsMetrics: analyticsMetrics).getStringRepresentation() else { return }
            
            DispatchQueue.main.async {
                self.pushToShowClientAnalytics(accountInformation: stringRepresentation)
            }
            
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
        
        sender.animateTapping()
    }
    
    @IBAction func deleteAccountWithSuccess(_ sender: DefaultButton) {
        self.showLoading()
        
        Client.deleteAccount(success: { (_) in
            Client.logout()
            
            self.hideLoading()
            self.showSuccessInfo()
            
            DispatchQueue.main.async {
                self.navigationController?.popToRootViewController(animated: true)
            }
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
        sender.animateTapping()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "VIEW_CONTROLLER_CLIENT_API_TITLE".localized()
    }
    
    // MARK: - Private
    
    private func pushToShowToken(token: String) {
        let debugTextViewController = makeDebugTextViewController(labelText: token, barTitle: "Get Client Token")
        
        self.navigationController?.pushViewController(debugTextViewController, animated: true)
    }
    
    private func pushToShowClientAccountInformation(accountInformation: String) {
        let debugTextViewController = makeDebugTextViewController(labelText: accountInformation, barTitle: "Show Client Account Information")
        
        self.navigationController?.pushViewController(debugTextViewController, animated: true)
    }
    
    private func pushToShowClientAnalytics(accountInformation: String) {
        let debugTextViewController = makeDebugTextViewController(labelText: accountInformation, barTitle: "Show Client Analytics Info", copyEnable: false)
        
        self.navigationController?.pushViewController(debugTextViewController, animated: true)
    }
    
    private func makeDebugTextViewController(labelText: String, barTitle: String, copyEnable: Bool = true) -> DebugTextViewController {
        let debugTextViewController = DebugTextViewController(text: labelText, copyEnabled: copyEnable)
        
        return debugTextViewController
    }
    
    private func makeAccountInformation(_ clientAccountInformation: ClientAccountInformation) -> String {
        let firstName = clientAccountInformation.firstName ?? "nil"
        let lastName = clientAccountInformation.lastName ?? "nil"
        let adress = clientAccountInformation.address ?? "nil"
        let birthDate = clientAccountInformation.birthDate ?? "nil"
        let phoneNumber = clientAccountInformation.phone ?? "nil"
        let displayName = clientAccountInformation.displayName ?? "nil"
        
        let accountStringRepresintation = """
        First Name: \(firstName)
        Last Name: \(lastName)
        Address: \(adress)
        BirthDate: \(birthDate)
        Phone Number: \(phoneNumber)
        Display Name: \(displayName)
        """
        
        return accountStringRepresintation
    }
}
