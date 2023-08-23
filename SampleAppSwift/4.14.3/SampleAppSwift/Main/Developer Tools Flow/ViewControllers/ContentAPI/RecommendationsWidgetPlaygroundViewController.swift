//
//  RecommendationsWidgetPlaygroundViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2022 Synerise. All rights reserved.
//

import Foundation
import SyneriseSDK

class RecommendationsWidgetPlaygroundViewController: DefaultViewController {

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
        
        let widgetOptions = prepareWidgetOptions()
        let widgetAppearance = prepareWidgetAppearance()
        
        widget = ContentWidget(options: widgetOptions, appearance: widgetAppearance)
        widget.delegate = self
        
        widgetView = widget.getView()
        view.addSubview(widgetView)
        
        widgetView.translatesAutoresizingMaskIntoConstraints = false
        widgetView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        widgetView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        widgetView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        widgetView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    private func prepareWidgetOptions() -> ContentWidgetRecommendationsOptions {
        let widgetOptions = ContentWidgetRecommendationsOptions()
        widgetOptions.slug = "recommend2"
        widgetOptions.productID = "0000206438331-XS"

        var i = 0
        widgetOptions.mapping = {
            model in
            
            guard let imageURLString = model.attributes["imageLink"] as? String,
                  let imageURL = URL(string: imageURLString),
                  let title = model.attributes["title"] as? String,
                  let priceDictionary = model.attributes["price"] as? [AnyHashable: Any],
                  let priceValue = priceDictionary["value"] as? Double else {
                      return nil
                  }
                  
            let dataModel = ContentWidgetRecommendationDataModel(imageURL: imageURL, title: title, priceCurrency: "PLN", price: NSNumber(value: priceValue), salePrice: nil)
            
            dataModel.subtitle = "SUBTITLE"
            dataModel.identifier = "11-22-XS-002"
            dataModel.loyaltyPointsNumber = 100
            
            i += 1
            
            return dataModel
        }
        
        return widgetOptions
    }
    
    private func prepareWidgetAppearance() -> ContentWidgetAppearance {
        let widgetItemWidth: Int = 400
        let widgetItemHeight: Int = 800
        let widgetItemHorizontalSpacing: CGFloat = 20
        let widgetItemVerticalSpacing: CGFloat = 20
        
        let widgetItemImageWidthFraction: CGFloat = 1
        let widgetItemImageHeightFraction: CGFloat = 0.5
        let widgetItemBorderWidth: CGFloat = 1
        
        let gridLayout = ContentWidgetGridLayout()
        gridLayout.insets = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        gridLayout.itemSize = CGSize(width: widgetItemWidth, height: widgetItemHeight)
        gridLayout.itemHorizontalSpacing = widgetItemHorizontalSpacing
        gridLayout.itemVerticalSpacing = widgetItemVerticalSpacing
        
        let itemLayout = ContentWidgetBasicProductItemLayout()
        
        itemLayout.titleInsets = UIEdgeInsets(top: 80, left: 32, bottom: 0, right: 32)
        itemLayout.titleFont = UIFont.boldSystemFont(ofSize: 22.0)
        itemLayout.titleFontColor = UIColor.black
        itemLayout.titleAlignment = .left
        
        itemLayout.subtitleInsets = UIEdgeInsets(top: 8, left: 32, bottom: 0, right: 32)
        itemLayout.subtitleFont = UIFont.systemFont(ofSize: 16.0)
        itemLayout.subtitleFontColor = UIColor.darkGray
        itemLayout.subtitleAlignment = .left
        
        itemLayout.identifierInsets = UIEdgeInsets(top: 8, left: 32, bottom: 0, right: 32)
        itemLayout.identifierFont = UIFont.systemFont(ofSize: 16.0)
        itemLayout.identifierFontColor = UIColor.lightGray
        itemLayout.identifierAlignment = .left
        
        itemLayout.imageWidthRatio = widgetItemImageWidthFraction
        itemLayout.imageHeightRatio = widgetItemImageHeightFraction
        itemLayout.borderWidth = widgetItemBorderWidth
        itemLayout.borderColor = UIColor.black
        
        itemLayout.priceInsets = UIEdgeInsets(top: 40, left: 32, bottom: 0, right: 32)
        itemLayout.priceAlignment = .left
        itemLayout.priceGroupSeparator = "  "
        itemLayout.priceDecimalSeparator = ","
        itemLayout.priceCurrencyPosition = .left
        itemLayout.priceFont = UIFont.systemFont(ofSize: 24.0)
        itemLayout.priceFontColor = UIColor.black
        
        itemLayout.loyaltyPointsInsets = UIEdgeInsets(top: 8, left: 32, bottom: 0, right: 32)
        itemLayout.loyaltyPointsNumberFont = UIFont.boldSystemFont(ofSize: 16.0)
        itemLayout.loyaltyPointsNumberFontColor = UIColor(red: 60 / 255, green: 125 / 255, blue: 200 / 255, alpha: 1)
        itemLayout.loyaltyPointsTextFont = UIFont.systemFont(ofSize: 16)
        itemLayout.loyaltyPointsTextFontColor = UIColor(red: 60 / 255, green: 125 / 255, blue: 200 / 255, alpha: 1)
        itemLayout.loyaltyPointsText = "Loyalty Points!"
        
        let widgetAppearance = ContentWidgetAppearance(widgetLayout: gridLayout, itemLayout: itemLayout)
        
        return widgetAppearance
    }    
}

extension RecommendationsWidgetPlaygroundViewController: ContentWidgetDelegate {
    
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
            presentAlert(title: "Clicked!", message: "\(recommendationModel.itemID) clicked!")
        }
    }
}
