//
//  UserLoginFormView.swift
//  SampleAppSwift
//
//  Created by BPOL0397 on 13/06/2018.
//

import UIKit

protocol UserLoginFormViewDelegate: class {
    func signInButtonWasClicked(_ userLoginFormView: UserLoginFormView, _ sender: UIButton)
}

class UserLoginFormView: InputView {

    static let defaultHeight: CGFloat = 400

    override public var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: UserLoginFormView.defaultHeight)
    }

    weak var delegate: UserLoginFormViewDelegate?

    private weak var viewModel: UserLoginFormViewModel?

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

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var loginLabel: DefaultLabel!
    @IBOutlet var textLabels: [DefaultLabel]!
    @IBOutlet var textFields: [BindingTextField]!
    @IBOutlet weak var loginField: BindingTextField!
    @IBOutlet weak var passwordField: BindingTextField!
    @IBOutlet var strokes: [UIView]!
    @IBOutlet weak var signInButton: DefaultButton!

    // MARK: - IBAction

    @IBAction func signInButtonWasClicked(_ sender: UIButton) {
        delegate?.signInButtonWasClicked(self, sender)
    }

    @IBAction func segmentDidChange(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        loginLabel.text = sender.titleForSegment(at: selectedIndex)
        if selectedIndex == 0 {
            loginField.keyboardType = .default
        } else {
            loginField.keyboardType = .phonePad
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

    func setViewModel(_ viewModel: UserLoginFormViewModel) {
        self.viewModel = viewModel

        loginField.text = viewModel.login.value
        passwordField.text = viewModel.password.value
        
        loginField.bind(to: viewModel.login)
        passwordField.bind(to: viewModel.password)

        viewModel.isProcessing.valueChanged = { isProcessing in
            self.toggleButton(isProcessing)
        }
    }

    // MARK: - Private

    private func baseInit() {
        loadFromXib()
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
        signInButton.backgroundColor = backgroundButtonColor
    }

    private func updateStrokesColor() {
        for stroke in strokes {
            stroke.backgroundColor = strokeColor
        }
    }

    private func toggleButton(_ isProcessing: Bool) {
        if isProcessing {
            self.signInButton.backgroundColor = #colorLiteral(red: 0.3294117647, green: 0.7960784314, blue: 0.0431372549, alpha: 0.5)
        } else {
            self.signInButton.backgroundColor = #colorLiteral(red: 0.3294117647, green: 0.7960784314, blue: 0.0431372549, alpha: 1)
        }
    }
}
