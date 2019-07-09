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
        UIView.animate(withDuration: 0.1,
                       animations: {
                        self.transform = CGAffineTransform(scaleX: 0.975, y: 0.975)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.2, animations: {
                            self.transform = CGAffineTransform.identity
                        })
        })
    }

    // MARK: - private

    private func updateCornerRadius() {
        self.layoutIfNeeded()
        self.layer.cornerRadius = self.cornerRadius
        self.layoutIfNeeded()
    }
    
    private func configureButton() {
        self.layoutIfNeeded()
        self.layer.cornerRadius = self.frame.size.width / 2
        self.layer.masksToBounds = true
        self.layoutIfNeeded()
    }
}
