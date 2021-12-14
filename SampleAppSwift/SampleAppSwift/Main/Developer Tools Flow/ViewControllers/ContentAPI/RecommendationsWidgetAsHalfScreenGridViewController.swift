//
//  RecommendationsWidgetAsHalfScreenGridViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2019 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class RecommendationsWidgetAsHalfScreenGridViewController: DefaultViewController {

    @IBOutlet weak var widgetContainerView: UIView!
    
    var widgetOptions: ContentWidgetRecommendationsOptions!
    var widgetAppearance: ContentWidgetAppearance!
    
    private var widget: ContentWidget!
    private var widgetView: UIView!
    
    // MARK: - IBAction
    
    @IBAction func closeButtonWasPressed(_ sender: DefaultButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareWidget()
        widget.load()
    }
    
    // MARK: - Private
    
    private func prepareWidget() {
        if widget != nil && widgetView != nil {
            widgetView.removeFromSuperview()
            widget = nil
        }
        
        widget = ContentWidget(options: widgetOptions, appearance: widgetAppearance)
        widget.delegate = self
        
        widgetView = widget.getView()
        widgetContainerView.addSubview(widgetView)
        
        widgetView.translatesAutoresizingMaskIntoConstraints = false
        widgetView.topAnchor.constraint(equalTo: widgetContainerView.topAnchor).isActive = true
        widgetView.bottomAnchor.constraint(equalTo: widgetContainerView.bottomAnchor).isActive = true
        widgetView.leftAnchor.constraint(equalTo: widgetContainerView.leftAnchor).isActive = true
        widgetView.rightAnchor.constraint(equalTo: widgetContainerView.rightAnchor).isActive = true
    }
}

extension RecommendationsWidgetAsHalfScreenGridViewController: ContentWidgetDelegate {

    func snr_widgetIsLoading(widget: ContentWidget, isLoading: Bool) {
        
    }
    
    func snr_widgetDidLoad(widget: ContentWidget) {
        
    }
    
    func snr_widgetDidNotLoad(widget: ContentWidget, error: Error) {
        showErrorInfo(error as NSError)
    }
    
    func snr_widgetDidChangeSize(widget: ContentWidget, size: CGSize) {
        
    }
    
    func snr_widgetDidReceiveClickAction(widget: ContentWidget, model: BaseModel) {
        if let recommendationModel = model as? Recommendation {
            //presentAlert(title: "Clicked!", message: "\(recommendationModel.title) clicked!")
        }
    }
}
