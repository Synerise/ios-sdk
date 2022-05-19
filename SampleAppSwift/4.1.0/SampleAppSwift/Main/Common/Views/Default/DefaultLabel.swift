//
//  DefaultLabel.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

@IBDesignable
class DefaultLabel: UILabel {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            updateCornerRadius()
        }
    }
    
    // MARK: - Private
    
    private func updateCornerRadius() {
        self.layer.cornerRadius = self.cornerRadius
        self.layoutIfNeeded()
    }
}
