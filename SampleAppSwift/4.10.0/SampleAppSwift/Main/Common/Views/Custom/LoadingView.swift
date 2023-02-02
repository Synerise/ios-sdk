//
//  LoadingView.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class LoadingView: UIView {

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

    var loaderStyle: UIActivityIndicatorView.Style = UIActivityIndicatorView.Style.whiteLarge {
        didSet {
            loaderView.style = loaderStyle
        }
    }

    var text: String? {
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

    lazy private var loaderView: UIActivityIndicatorView = {
        let loaderView = UIActivityIndicatorView(style: self.loaderStyle)

        return loaderView
    }()

    private var textLabel: UILabel?

    // MARK: - Deinit

    deinit {
        stopAnimating()
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

    // MARK: - Inherited

    override func didMoveToSuperview() {
        startAnimating()
    }

    // MARK: - Private

    private func baseInit() {
        addOverlayView()
        addLoaderView()
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

    private func addLoaderView() {
        addSubview(loaderView)

        loaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loaderView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loaderView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }

    private func addTextLabel() {
        let label = UILabel()
        label.text = text
        label.textColor = textColor

        addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: loaderView.bottomAnchor, constant: 16.0)
        ])

        self.textLabel = label
    }

    private func startAnimating() {
        loaderView.startAnimating()
    }

    private func stopAnimating() {
        loaderView.stopAnimating()
    }
}
