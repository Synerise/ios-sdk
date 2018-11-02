//
//  CheckboxButton.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//
import UIKit

// swiftlint:disable identifier_name
@IBDesignable
open class CheckboxButton: UIControl {

    @IBInspectable open var checkLineWidth: CGFloat = 2.0 {
        didSet {
            layoutLayers()
        }
    }
    
    @IBInspectable open var checkColor: UIColor = UIColor.black {
        didSet {
            colorLayers()
        }
    }

    @IBInspectable open var containerLineWidth: CGFloat = 2.0 {
        didSet {
            layoutLayers()
        }
    }
    
    @IBInspectable open var containerColor: UIColor = UIColor.black {
        didSet {
            colorLayers()
        }
    }
    
    @IBInspectable open var circular: Bool = false {
        didSet {
            layoutLayers()
        }
    }
    
    @IBInspectable open var containerFillsOnToggleOn: Bool = false {
        didSet {
            colorLayers()
        }
    }
    
    @IBInspectable open var on: Bool = false {
        didSet {
            colorLayers()
        }
    }
    
    internal let containerLayer = CAShapeLayer()
    internal let checkLayer = CAShapeLayer()
    
    internal var containerFrame: CGRect {
        let width = bounds.width
        let height = bounds.height
        
        let x: CGFloat
        let y: CGFloat
        
        let sideLength: CGFloat
        if width > height {
            sideLength = height
            x = (width - sideLength) / 2
            y = 0
        } else {
            sideLength = width
            x = 0
            y = (height - sideLength) / 2
        }
        
        let halfLineWidth = containerLineWidth / 2
        return CGRect(x: x + halfLineWidth, y: y + halfLineWidth, width: sideLength - containerLineWidth, height: sideLength - containerLineWidth)
    }
    
    internal var containerPath: UIBezierPath {
        if circular {
            return UIBezierPath(ovalIn: containerFrame)
        } else {
            return UIBezierPath(rect: containerFrame)
        }
    }
    internal var checkPath: UIBezierPath {
        let containerFrame = self.containerFrame
        
        let inset = containerLineWidth / 2
        let innerRect = containerFrame.insetBy(dx: inset, dy: inset)

        let path = UIBezierPath()
        
        let unit = innerRect.width / 33
        let origin = innerRect.origin
        let x = origin.x
        let y = origin.y
        
        path.move(to: CGPoint(x: x + (7 * unit), y: y + (18 * unit)))
        path.addLine(to: CGPoint(x: x + (14 * unit), y: y + (25 * unit)))
        path.addLine(to: CGPoint(x: x + (27 * unit), y: y + (10 * unit)))
        
        return path
    }
    
    static internal let validBoundsOffset: CGFloat = 80
    
    // MARK: Init
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open override func awakeFromNib() {
        customInitialization()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        customInitialization()
    }

    convenience init(frame: CGRect, on: Bool) {
        self.init(frame: frame)
        self.on = on
    }
    
    // MARK: Inherited
    
    open override func layoutSubviews() {
        super.layoutSubviews()

        layoutLayers()
    }
    
    open override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.beginTracking(touch, with: event)
        
        return true
    }
    
    open override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.continueTracking(touch, with: event)
        
        return true
    }
    
    open override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        
        guard let touchLocationInView = touch?.location(in: self) else {
            return
        }
        
        let offset = type(of: self).validBoundsOffset
        let validBounds = CGRect(x: bounds.origin.x - offset, y: bounds.origin.y - offset, width: bounds.width + (2 * offset), height: bounds.height + (2 * offset))
        
        if validBounds.contains(touchLocationInView) {
            on = !on
            sendActions(for: [UIControl.Event.valueChanged])
        }
    }
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        customInitialization()
    }
    
    // MARK: Public
    
    func customInitialization() {
        checkLayer.fillColor = UIColor.clear.cgColor
        
        colorLayers()
        layoutLayers()
        
        layer.addSublayer(containerLayer)
        layer.addSublayer(checkLayer)
    }
    
    // MARK: Private
    
    fileprivate func layoutLayers() {
        // Set frames, line widths and paths for layers
        containerLayer.frame = bounds
        containerLayer.lineWidth = containerLineWidth
        containerLayer.path = containerPath.cgPath
        
        checkLayer.frame = bounds
        checkLayer.lineWidth = checkLineWidth
        checkLayer.path = checkPath.cgPath
    }
    
    fileprivate func colorLayers() {
        containerLayer.strokeColor = containerColor.cgColor
        
        if on {
            containerLayer.fillColor = containerFillsOnToggleOn ? containerColor.cgColor : UIColor.clear.cgColor
            checkLayer.strokeColor = checkColor.cgColor
        } else {
            containerLayer.fillColor = UIColor.clear.cgColor
            checkLayer.strokeColor = UIColor.clear.cgColor
        }
    }
}
