//
//  RecommendationsWidgeAsSliderTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2019 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class RecommendationsWidgetAsSliderTableViewController: DefaultTableViewController {

    @IBOutlet weak var slugTextField: UITextField!
    @IBOutlet weak var productIDTextField: UITextField!
    
    @IBOutlet weak var widgetItemWidthTextField: UITextField!
    @IBOutlet weak var widgetItemHeightTextField: UITextField!
    @IBOutlet weak var widgetItemSpacingTextField: UITextField!
    
    @IBOutlet weak var widgetItemImageWidthFractionTextField: UITextField!
    @IBOutlet weak var widgetItemImageHeightFractionTextField: UITextField!
    @IBOutlet weak var widgetItemBorderWidthTextField: UITextField!
    @IBOutlet weak var widgetItemShadowSwitch: UISwitch!
    @IBOutlet weak var widgetItemCornersRoundedSwitch: UISwitch!
    
    @IBOutlet weak var widgetContainerView: UIView!
    
    var widget: ContentWidget!
    var widgetView: UIView!
    
    // MARK: - IBAction
    
    @IBAction func loadButtonWasPressed(_ sender: DefaultButton) {
        prepareWidget()
        widget.load()
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Horizontal Slider Layout"
        
        prepareBackButton()
        
        slugTextField.text = "recommend2"
        productIDTextField.text = "0000208030878-M"
        
        widgetItemWidthTextField.text = "150"
        widgetItemHeightTextField.text = "200"
        widgetItemSpacingTextField.text = "16"
        
        widgetItemImageWidthFractionTextField.text = "1"
        widgetItemImageHeightFractionTextField.text = "0.5"
        widgetItemBorderWidthTextField.text = "0.5"
        widgetItemShadowSwitch.isOn = true
        widgetItemCornersRoundedSwitch.isOn = false
    }
    
    private func prepareWidget() {
        if widget != nil && widgetView != nil {
            widgetView.removeFromSuperview()
            widget = nil
        }
        
        let widgetItemWidth: Int = Int(widgetItemWidthTextField.text!) ?? 0
        let widgetItemHeight: Int = Int(widgetItemHeightTextField.text!) ?? 0
        let widgetItemSpacing: CGFloat = CGFloat((Int(widgetItemSpacingTextField.text!) ?? 0))
        
        let widgetItemImageWidthFraction: CGFloat = CGFloat(Double(widgetItemImageWidthFractionTextField.text!) ?? 0)
        let widgetItemImageHeightFraction: CGFloat = CGFloat(Double(widgetItemImageHeightFractionTextField.text!) ?? 0)
        let widgetItemBorderWidth: CGFloat = CGFloat(Double(widgetItemBorderWidthTextField.text!) ?? 0)
        let widgetItemShadow: Bool = widgetItemShadowSwitch.isOn
        let widgetItemCornersRounded: Bool = widgetItemCornersRoundedSwitch.isOn
        
        let options = ContentWidgetRecommendationsOptions()
        options.slug = slugTextField.text!
        options.productID = productIDTextField.text!
        options.mapping = {
            model in
            guard let imageURLString = model.attributes["imageLink"] as? String,
                  let imageURL = URL(string: imageURLString),
                  let title = model.attributes["title"] as? String,
                  let priceDictionary = model.attributes["price"] as? [AnyHashable: Any],
                  let priceValue = priceDictionary["value"] as? Double else {
                      return nil
                  }
                  
        
            let dataModel = ContentWidgetRecommendationDataModel(imageURL: imageURL, title: title, priceCurrency: "PLN", price: NSNumber(value: priceValue), salePrice: nil)

            if let salePriceDictionary = model.attributes["salePrice"] as? [AnyHashable: Any],
               let salePriceValue = salePriceDictionary["value"] as? Double {
                dataModel.salePriceValue = NSNumber(floatLiteral: salePriceValue)
            }
            
            return dataModel
        }
        
        let horizontalSliderLayout = ContentWidgetHorizontalSliderLayout()
        horizontalSliderLayout.insets = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        horizontalSliderLayout.itemSize = CGSize(width: widgetItemWidth, height: widgetItemHeight)
        horizontalSliderLayout.itemSpacing = widgetItemSpacing
        
        let itemLayout = ContentWidgetBasicProductItemLayout()
        itemLayout.imageWidthRatio = widgetItemImageWidthFraction
        itemLayout.imageHeightRatio = widgetItemImageHeightFraction
        itemLayout.borderWidth = widgetItemBorderWidth
        itemLayout.borderColor = UIColor.black
        itemLayout.isSalePriceVisible = true
        itemLayout.salePriceOrientation = .horizontal
        itemLayout.priceGroupSeparator = "  "
        itemLayout.priceDecimalSeparator = ","
        itemLayout.regularPriceFont = UIFont.systemFont(ofSize: 12.0)
        itemLayout.regularPriceFontColor = UIColor.lightGray
        itemLayout.salePriceFont = UIFont.systemFont(ofSize: 14.0)
        itemLayout.salePriceFontColor = UIColor.red
        
        if widgetItemShadow {
            itemLayout.shadowColor = UIColor.black
        }
        
        if widgetItemCornersRounded {
            itemLayout.cornerRadius = 12
        }
        
        let appearance = ContentWidgetAppearance(widgetLayout: horizontalSliderLayout, itemLayout: itemLayout)
        
        widget = ContentWidget(options: options, appearance: appearance)
        widget.delegate = self
        
        widgetView = widget.getView()
        widgetContainerView.addSubview(widgetView)
        
        widgetView.translatesAutoresizingMaskIntoConstraints = false
        widgetView.topAnchor.constraint(equalTo: widgetContainerView.topAnchor).isActive = true
        widgetView.bottomAnchor.constraint(equalTo: widgetContainerView.bottomAnchor).isActive = true
        widgetView.leftAnchor.constraint(equalTo: widgetContainerView.leftAnchor).isActive = true
        widgetView.rightAnchor.constraint(equalTo: widgetContainerView.rightAnchor).isActive = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 11
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 10 {
            if widget != nil {
                guard let widgetHorizontalSliderLayout = widget.appearance.layout as? ContentWidgetHorizontalSliderLayout else {
                    return 0.0
                }
                
                if widget.isLoaded() {
                    let widgetSize = widgetHorizontalSliderLayout.getSize()
                    return  widgetSize.height + 16.0 + 16.0
                }
                
                return 100.0
            }
        }
        
        return 45
    }
}

extension RecommendationsWidgetAsSliderTableViewController: ContentWidgetDelegate {
    
    func snr_widgetIsLoading(widget: ContentWidget, isLoading: Bool) {
        
    }
    
    func snr_widgetDidLoad(widget: ContentWidget) {
        tableView.beginUpdates()
        tableView.reloadSections(IndexSet(integer: 10), with: .none)
        tableView.endUpdates()
    }
    
    func snr_widgetDidNotLoad(widget: ContentWidget, error: Error) {
        showErrorInfo(error as NSError)
    }
    
    func snr_widgetDidChangeSize(widget: ContentWidget, size: CGSize) {
        tableView.beginUpdates()
        tableView.reloadSections(IndexSet(integer: 10), with: .none)
        tableView.endUpdates()
    }
    
    func snr_widgetDidReceiveClickAction(widget: ContentWidget, model: BaseModel) {
        if let recommendationModel = model as? Recommendation {
            presentAlert(title: "Clicked!", message: "\(recommendationModel.itemID) clicked!")
        }
    }
}
