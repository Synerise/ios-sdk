//
//  UserRegistrationFormView.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

protocol  UserRegistrationFormViewDelegate: class {
    func signUpButtonWasClicked(_ userRegistrationFormView: UserRegistrationFormView, _ sender: UIButton)
}

class UserRegistrationFormView: InputView {

    static let defaultHeight: CGFloat = 600

    override public var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: UserRegistrationFormView.defaultHeight)
    }

    weak var delegate: UserRegistrationFormViewDelegate?

    private weak var viewModel: UserRegistrationFormViewModel?

    @IBInspectable var textFieldsFontColor: UIColor = #colorLiteral(red: 0.2196078431, green: 0.262745098, blue: 0.3137254902, alpha: 1) {
        didSet {
            updateTextFieldsFontColor()
        }
    }

    @IBInspectable var backgroundButtonColor: UIColor = #colorLiteral(red: 0.3294117647, green: 0.7960784314, blue: 0.0431372549, alpha: 1) {
        didSet {
            updateBackgroundButtonColor()
        }
    }

    @IBInspectable var textLabelsFontColor: UIColor = #colorLiteral(red: 0.7098039216, green: 0.7411764706, blue: 0.7647058824, alpha: 1) {
        didSet {
            updateTextFieldsFontColor()
        }
    }

    @IBInspectable var strokeColor: UIColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1) {
        didSet {
            updateStrokesColor()
        }
    }

    @IBOutlet var textFields: [BindingTextField]!
    @IBOutlet var textLabels: [DefaultLabel]!
    @IBOutlet var strokes: [UIView]!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var firstNameTextField: BindingTextField!
    @IBOutlet weak var lastNameTextField: BindingTextField!
    @IBOutlet weak var loginLabel: DefaultLabel!
    @IBOutlet weak var loginTextField: BindingTextField!
    @IBOutlet weak var passwordTextField: BindingTextField!
    @IBOutlet weak var signButton: UIButton!

    // MARK: - IBAction

    @IBAction func signUpButtonWasClicked(_ sender: UIButton) {
        delegate?.signUpButtonWasClicked(self, sender)
    }

    @IBAction func segmentDidChange(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        loginLabel.text = sender.titleForSegment(at: selectedIndex)
        if selectedIndex == 0 {
            loginTextField.keyboardType = .default
        } else {
            loginTextField.keyboardType = .phonePad
        }
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

    func setViewModel(_ viewModel: UserRegistrationFormViewModel) {
        self.viewModel = viewModel

        firstNameTextField.text = viewModel.firstName.value
        lastNameTextField.text = viewModel.lastName.value
        loginTextField.text = viewModel.login.value
        passwordTextField.text = viewModel.password.value
        
        firstNameTextField.bind(to: viewModel.firstName)
        lastNameTextField.bind(to: viewModel.lastName)
        loginTextField.bind(to: viewModel.login)
        passwordTextField.bind(to: viewModel.password)

        viewModel.isProcessing.valueChanged = { isProcessing in
            self.toggleButton(isProcessing)
        }
    }

    // MARK: - Private

    private func baseInit() {
        loadFromXib()
        setup()
    }

    private func setup() {
        prepareForAppearance()
    }

    private func prepareForAppearance() {
        updateTextFieldsFontColor()
        updateTextLabelsFontColor()
        updateBackgroundButtonColor()
        updateStrokesColor()
    }

    private func updateTextFieldsFontColor() {
        for textField in textFields {
            textField.textColor = textFieldsFontColor
        }
    }

    private func updateTextLabelsFontColor() {
        for textLabel in textLabels {
            textLabel.textColor = textLabelsFontColor
        }

    }

    private func updateBackgroundButtonColor() {
        signButton.backgroundColor = backgroundButtonColor
    }

    private func updateStrokesColor() {
        for stroke in strokes {
            stroke.backgroundColor = strokeColor
        }
    }

    private func toggleButton(_ isProcessing: Bool) {
        if isProcessing {
            self.signButton.backgroundColor = #colorLiteral(red: 0.3294117647, green: 0.7960784314, blue: 0.0431372549, alpha: 0.5)
        } else {
            self.signButton.backgroundColor = #colorLiteral(red: 0.3294117647, green: 0.7960784314, blue: 0.0431372549, alpha: 1)
        }
    }
}
