//
//  ProfileFormView.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

protocol ProfileFormViewDelegate: class {
    func saveChangesButtonWasPressed(_ profileFormView: ProfileFormView, _ sender: UIButton )
}

class ProfileFormView: InputView {
    
    static let defaultHeight: CGFloat = 750
    
    override public var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: ProfileFormView.defaultHeight)
    }
    
    weak var delegate: ProfileFormViewDelegate?
    
    private weak var viewModel: ProfileFormViewModel?
    
    @IBOutlet weak var firstNameTextField: BindingTextField!
    @IBOutlet weak var lastNameTextField: BindingTextField!
    @IBOutlet weak var emailTextField: BindingTextField!
    @IBOutlet weak var birthdateTextField: BindingTextField!
    @IBOutlet weak var companyTextField: BindingTextField!
    @IBOutlet weak var phoneTextField: BindingTextField!
    @IBOutlet weak var addressTextField: BindingTextField!
    @IBOutlet weak var zipCodeTextField: BindingTextField!
    @IBOutlet weak var cityTextField: BindingTextField!
    @IBOutlet weak var countryCodeTextField: BindingTextField!
    
    @IBOutlet weak var saveChangesButton: DefaultButton!
    
    // MARK: - IBAction
    
    @IBAction func saveChangesButtonWasPressed(_ sender: UIButton) {
        delegate?.saveChangesButtonWasPressed(self, sender)
    }
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        baseInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        baseInit()
    }
    
    // MARK: - Public
    
    func setViewModel(_ viewModel: ProfileFormViewModel) {
        self.viewModel = viewModel
        
        firstNameTextField.text = viewModel.firstName.value
        lastNameTextField.text = viewModel.lastName.value
        emailTextField.text = viewModel.email.value
        phoneTextField.text = viewModel.phone.value
        birthdateTextField.text = viewModel.birthdate.value
        companyTextField.text = viewModel.company.value
        addressTextField.text = viewModel.address.value
        zipCodeTextField.text = viewModel.zipCode.value
        cityTextField.text = viewModel.city.value
        countryCodeTextField.text = viewModel.countryCode.value
        
        firstNameTextField.bind(to: viewModel.firstName)
        lastNameTextField.bind(to: viewModel.lastName)
        emailTextField.bind(to: viewModel.email)
        phoneTextField.bind(to: viewModel.phone)
        birthdateTextField.bind(to: viewModel.birthdate)
        companyTextField.bind(to: viewModel.company)
        addressTextField.bind(to: viewModel.address)
        zipCodeTextField.bind(to: viewModel.zipCode)
        cityTextField.bind(to: viewModel.city)
        countryCodeTextField.bind(to: viewModel.countryCode)
    }
    
    // MARK: - Private
    
    private func baseInit() {
        loadFromXib()
    }
}
