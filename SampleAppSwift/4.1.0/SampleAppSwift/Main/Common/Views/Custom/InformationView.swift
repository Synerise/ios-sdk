//
//  InformationView.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//
import UIKit

class InformationView: UIView {
    
    var overlayColor: UIColor = UIColor.lightGray {
        didSet {
            overlayView.backgroundColor = overlayColor
        }
    }
    
    var overlayOpacity: CGFloat = 1.0 {
        didSet {
            overlayView.alpha = overlayOpacity
        }
    }
    
    var fontSize: CGFloat = 22.0
    
    var text: String? = "Information View" {
        didSet {
            guard self.textLabel == nil else {
                if let newValue = text {
                    self.textLabel?.text = newValue
                } else {
                    self.textLabel?.text = ""
                }
                
                return
            }
            addTextLabel()
        }
    }
    
    var textColor: UIColor = UIColor.black {
        didSet {
            textLabel?.textColor = textColor
        }
    }
    
    lazy private var overlayView: UIView = {
        let overlayView = UIView(frame: self.bounds)
        overlayView.backgroundColor = self.overlayColor
        overlayView.alpha = self.overlayOpacity
        return overlayView
    }()
    
    private var textLabel: UILabel?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        baseInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        baseInit()
    }
    
    // MARK: - Private
    
    private func baseInit() {
        addOverlayView()
    }
    
    private func addOverlayView() {
        addSubview(overlayView)
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            overlayView.topAnchor.constraint(equalTo: self.topAnchor),
            overlayView.leftAnchor.constraint(equalTo: self.leftAnchor),
            overlayView.widthAnchor.constraint(equalTo: self.widthAnchor),
            overlayView.heightAnchor.constraint(equalTo: self.heightAnchor)
            ])
    }
    
    private func addTextLabel() {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = UIFont.systemFont(ofSize: fontSize)
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
        self.textLabel = label
    }
}
