//
//  TextField.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

extension UITextField {
    
    func animateEmpty(withDuration: Double) {
        UIView.animate(withDuration: withDuration,
                            animations: {
                                self.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                                self.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 0.1537617723)
        },
                            completion: { _ in
                                UIView.animate(withDuration: withDuration, animations: {
                                    self.transform = CGAffineTransform.identity
                                    self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                                })
        })
    }
   
}
