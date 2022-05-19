//
//  CustomEventTableViewCell.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class CustomEventTableViewCell: UITableViewCell {

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    // MARK: - Public
    
    func update(_ key: String, _ value: String, _ type: ParameterType) {
        keyLabel.text = key
        valueLabel.text = value
        setTypeLabel(type: type)
    }
    
    // MARK: - Private
    
    func setTypeLabel(type: ParameterType) {
        switch type {
        case .string:
            typeLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        case .double:
            typeLabel.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        case .int:
            typeLabel.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        }
        typeLabel.text = type.rawValue
    }
    
}
