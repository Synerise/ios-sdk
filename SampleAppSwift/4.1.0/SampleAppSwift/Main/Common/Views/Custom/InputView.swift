//
//  BaseInputView.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import UIKit

protocol InputViewDelegate: class {

}

class InputView: DefaultView {

    weak var inputDelegate: InputViewDelegate?

    func inputTextFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
    }
}

extension InputView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return inputTextFieldShouldReturn(textField)
    }
}
