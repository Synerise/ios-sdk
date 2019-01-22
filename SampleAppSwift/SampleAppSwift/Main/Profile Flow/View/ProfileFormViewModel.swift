//
//  ProfileFormViewModel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

typealias ClientUpdatingSuccess = ((_ response: Any) -> Void)
typealias ClientUpdatingError = ((_ error: Error) -> Void)

class ProfileFormViewModel {
    
    var isProcessing: ObservingType<Bool> = ObservingType.init(false)
    
    var firstName: BindingType<String>
    var lastName: BindingType<String>
    var email: BindingType<String>
    var phone: BindingType<String>
    var birthdate: BindingType<String>
    var company: BindingType<String>
    var address: BindingType<String>
    var zipCode: BindingType<String>
    var city: BindingType<String>
    var countryCode: BindingType<String>
    
    private var onSuccessClosures: [ClientUpdatingSuccess] = [ClientUpdatingSuccess]()
    private var onErrorClosures: [ClientUpdatingError] = [ClientUpdatingError]()
    
    // MARK: - Init
    
    init() {
        self.firstName = BindingType<String>.init("")
        self.lastName = BindingType<String>.init("")
        self.email = BindingType<String>.init("")
        self.phone = BindingType<String>.init("")
        self.birthdate = BindingType<String>.init("")
        self.company = BindingType<String>.init("")
        self.address = BindingType<String>.init("")
        self.zipCode = BindingType<String>.init("")
        self.city = BindingType<String>.init("")
        self.countryCode = BindingType<String>.init("")
        
        updateForm()
    }
    
    // MARK: - Public
    
    func invokeOnSuccess(_ closure: @escaping ClientUpdatingSuccess) {
        onSuccessClosures.append(closure)
    }
    
    func invokeOnError(_ closure: @escaping ClientUpdatingError) {
        onErrorClosures.append(closure)
    }
    
    // MARK: - Private
    
    private func updateForm() {
        self.isProcessing(true)
        Client.getAccount(success: { (clientAccountInformation) in
            self.firstName.value = clientAccountInformation.firstName
            self.lastName.value = clientAccountInformation.lastName
            self.email.value = clientAccountInformation.email
            self.phone.value = clientAccountInformation.phone
            self.birthdate.value = clientAccountInformation.birthDate
            self.company.value = clientAccountInformation.company
            self.address.value = clientAccountInformation.address
            self.zipCode.value = clientAccountInformation.zipCode
            self.city.value = clientAccountInformation.city
            self.countryCode.value = clientAccountInformation.countryCode
            
            self.isProcessing(false)
        }, failure: { (error) in
            if let clientAccountInformation = CacheManager.get(ClientAccountInformation.self) as? ClientAccountInformation {
                self.firstName.value = clientAccountInformation.firstName
                self.lastName.value = clientAccountInformation.lastName
                self.email.value = clientAccountInformation.email
                self.phone.value = clientAccountInformation.phone
                self.birthdate.value = clientAccountInformation.birthDate
                self.company.value = clientAccountInformation.company
                self.address.value = clientAccountInformation.address
                self.zipCode.value = clientAccountInformation.zipCode
                self.city.value = clientAccountInformation.city
                self.countryCode.value = clientAccountInformation.countryCode
                
                self.isProcessing(false)
                
                return
            }
            
            let errorMessage: String? = "\((error as NSError).code) \((error as NSError).localizedDescription)"
            UserInfoMessageManager.shared.error("Error", errorMessage)
        
            self.isProcessing(false)
        })
    }
    
    private func executeUpdatingClientData() {
        isProcessing(true)
        
        do {
            if let clientUpdateAccountContext = try self.makeClientUpdateAccountContext() {
                Client.updateAccount(context: clientUpdateAccountContext, success: { (success) in
                    self.updatingSuccess(success: success)
                }, failure: { (error) in
                    self.updatingError(error: error)
                })
            }
        } catch {
            self.updatingError(error: error)
        }
    }
    
    private func isProcessing(_ boolean: Bool) {
        self.isProcessing.value = boolean
    }
    
    private func makeClientUpdateAccountContext() throws -> ClientUpdateAccountContext? {
        
        if email.value == "" || firstName.value == "" || lastName.value == "" {
            isProcessing(false)
            UserInfoMessageManager.shared.error("Error", "Unvalid data")
            return nil
        }
        
        var clientUpdateAccountContext: ClientUpdateAccountContext!
        
        clientUpdateAccountContext = ClientUpdateAccountContext.init()
        
        if let firstname = self.firstName.value, firstname.count > 1 {
            clientUpdateAccountContext.firstName = firstname
        }
        
        if let lastName = self.lastName.value, lastName.count > 1 {
            clientUpdateAccountContext.lastName = lastName
        }
        
        if let email = self.email.value, email.count > 1 {
            clientUpdateAccountContext.email = email
        }
        
        if let phone = self.phone.value, phone.count > 1 {
            clientUpdateAccountContext.phone = phone
        }
        
        if let birthdate = self.birthdate.value, birthdate.count > 1 {
            clientUpdateAccountContext.birthDate = birthdate
        }
        
        if let company = self.company.value, company.count > 1 {
            clientUpdateAccountContext.company = company
        }
        
        if let address = self.address.value, address.count > 1 {
            clientUpdateAccountContext.address = address
        }
        
        if let zipCode = self.zipCode.value, zipCode.count > 1 {
            clientUpdateAccountContext.zipCode = zipCode
        }
        
        if let city = self.city.value, city.count > 1 {
            clientUpdateAccountContext.city = city
        }
        
        if let countryCode = self.countryCode.value, countryCode.count > 1 {
            clientUpdateAccountContext.countryCode = countryCode
        }
        
        return clientUpdateAccountContext
    }
    
    private func updatingSuccess(success: Any) {
        isProcessing(false)
        
        guard !onSuccessClosures.isEmpty else {
            return
        }
        
        onSuccessClosures.forEach { closure in
            closure(success)
        }
    }
    
    private func updatingError(error: Error) {
        isProcessing(false)
        
        guard !onErrorClosures.isEmpty else {
            return
        }
        
        onErrorClosures.forEach { closure in
            closure(error)
        }
    }
}

extension ProfileFormViewModel: ProfileFormViewDelegate {
    func saveChangesButtonWasPressed(_ profileFormView: ProfileFormView, _ sender: UIButton) {
        executeUpdatingClientData()
    }
}
