//
//  ClientAccountViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class ClientAccountViewController: DefaultViewController {

    // MARK: - IBAction
    
    @IBAction func getAccountButtonWasPressed(_ sender: DefaultButton) {
        showLoading()
        Client.getAccount(success: { (clientAccountInformation) in
            self.hideLoading()
            
            let accountInformation = self.makeAccountInformation(clientAccountInformation)
            self.pushDebugViewController(text: accountInformation)
        }, failure: { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        })
        
        sender.animateTapping()
    }
    
    @IBAction func getEventsButtonWasPressed(_ sender: DefaultButton) {
        showLoading()
        Client.getEvents(apiQuery: ClientEventsApiQuery(), success: { events in
            self.hideLoading()
            
            let clientEventsInformation = self.makeClientEventsInformation(events)
            self.pushDebugViewController(text: clientEventsInformation)
        }) { (error) in
            self.hideLoading()
            self.showErrorInfo(error as NSError)
        }
        
        sender.animateTapping()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Client Account"
    }
    
    // MARK: - Private
    
    private func makeAccountInformation(_ clientAccountInformation: ClientAccountInformation) -> String {
        let clientID = String(clientAccountInformation.clientId)
        let email = clientAccountInformation.email
        let firstName = clientAccountInformation.firstName ?? "nil"
        let lastName = clientAccountInformation.lastName ?? "nil"
        let adress = clientAccountInformation.address ?? "nil"
        let birthDate = clientAccountInformation.birthDate ?? "nil"
        let phoneNumber = clientAccountInformation.phone ?? "nil"
        let displayName = clientAccountInformation.displayName ?? "nil"
        
        let accountStringRepresintation = """
        Client ID: \(clientID)
        Email: \(email)
        First Name: \(firstName)
        Last Name: \(lastName)
        Address: \(adress)
        BirthDate: \(birthDate)
        Phone Number: \(phoneNumber)
        Display Name: \(displayName)
        """
        
        return accountStringRepresintation
    }
    
    private func makeClientEventsInformation(_ clientEvents: [ClientEventData]) -> String {
        var clientEventsRepresentation: String = ""
        
        for clientEvent in clientEvents {
            let time = clientEvent.time
            let label = clientEvent.label
            let action = clientEvent.action
            let client = clientEvent.client as AnyObject
            let params = clientEvent.params as AnyObject
            
            clientEventsRepresentation += """
            
            Time: \(time)
            Label: \(label)
            Action: \(action)
            Client: \(client)
            Params: \(params)
            
            """
        }
        
        return clientEventsRepresentation
    }
}
