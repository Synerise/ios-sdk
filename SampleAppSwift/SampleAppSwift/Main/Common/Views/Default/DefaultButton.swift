//
//  DefaultButton.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

@IBDesignable
class DefaultButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            updateCornerRadius()
        }
    }
    
    @IBInspectable var circularButton: Bool = false {
        didSet {
            if circularButton {
                configureButton()
            }
        }
    }
    
    // MARK: - Public
    
    public func animateTapping() {
        UIView.animate(withDuration: 0.2,
                       animations: {
                        self.transform = CGAffineTransform(scaleX: 0.975, y: 0.96)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.2, animations: {
                            self.transform = CGAffineTransform.identity
                        })
        })
    }

    // MARK: - private

    private func updateCornerRadius() {
        self.layer.cornerRadius = self.cornerRadius
        self.layoutIfNeeded()
    }
    
    private func configureButton() {
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        self.layoutIfNeeded()
    }
}
