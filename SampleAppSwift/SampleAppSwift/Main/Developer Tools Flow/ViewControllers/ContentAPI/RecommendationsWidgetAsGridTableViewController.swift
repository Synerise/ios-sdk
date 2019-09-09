//
//  RecommendationsWidgeAsGridTableViewController.swift
//  SampleAppSwift
//
// Created by Synerise
// Copyright (c) 2019 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class RecommendationsWidgetAsGridTableViewController: DefaultTableViewController {
    
    @IBOutlet weak var slugTextField: UITextField!
    @IBOutlet weak var productIDTextField: UITextField!
    
    @IBOutlet weak var widgetItemWidthTextField: UITextField!
    @IBOutlet weak var widgetItemHeightTextField: UITextField!
    @IBOutlet weak var widgetItemHorizontalSpacingTextField: UITextField!
    @IBOutlet weak var widgetItemVerticalSpacingTextField: UITextField!
    
    @IBOutlet weak var widgetItemImageWidthFractionTextField: UITextField!
    @IBOutlet weak var widgetItemImageHeightFractionTextField: UITextField!
    @IBOutlet weak var widgetItemBorderWidthTextField: UITextField!
    @IBOutlet weak var widgetItemShadowSwitch: UISwitch!
    @IBOutlet weak var widgetItemCornersRoundedSwitch: UISwitch!
    
    @IBOutlet weak var widgetItemSalePriceVisibleSwitch: UISwitch!
    @IBOutlet weak var widgetItemSalePriceOrientationSegmentedControl: UISegmentedControl!
    
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
        
        self.navigationItem.title = "Grid Layout"
       
        prepareBackButton()
        
        slugTextField.text = "similar"
        productIDTextField.text = "10214"
        
        widgetItemWidthTextField.text = "150"
        widgetItemHeightTextField.text = "400"
        widgetItemHorizontalSpacingTextField.text = "16"
        widgetItemVerticalSpacingTextField.text = "16"
        
        widgetItemImageWidthFractionTextField.text = "1"
        widgetItemImageHeightFractionTextField.text = "0.5"
        widgetItemBorderWidthTextField.text = "0.5"
        widgetItemShadowSwitch.isOn = true
        widgetItemCornersRoundedSwitch.isOn = false
        
        widgetItemSalePriceVisibleSwitch.isOn = true
        widgetItemSalePriceOrientationSegmentedControl.selectedSegmentIndex = 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let recommendationsWidgetAsFullScreenGridViewController = segue.destination as? RecommendationsWidgetAsFullScreenGridViewController {
            recommendationsWidgetAsFullScreenGridViewController.widgetOptions = prepareWidgetOptions()
            recommendationsWidgetAsFullScreenGridViewController.widgetAppearance = prepareWidgetAppearance()
        }
        
        if let recommendationsWidgetAsHalfScreenGridViewController = segue.destination as? RecommendationsWidgetAsHalfScreenGridViewController {
            recommendationsWidgetAsHalfScreenGridViewController.widgetOptions = prepareWidgetOptions()
            recommendationsWidgetAsHalfScreenGridViewController.widgetAppearance = prepareWidgetAppearance()
        }
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
        widgetContainerView.addSubview(widgetView)
        
        widgetView.translatesAutoresizingMaskIntoConstraints = false
        widgetView.topAnchor.constraint(equalTo: widgetContainerView.topAnchor).isActive = true
        widgetView.bottomAnchor.constraint(equalTo: widgetContainerView.bottomAnchor).isActive = true
        widgetView.leftAnchor.constraint(equalTo: widgetContainerView.leftAnchor).isActive = true
        widgetView.rightAnchor.constraint(equalTo: widgetContainerView.rightAnchor).isActive = true
        
        tableView.reloadData()
    }
    
    private func prepareWidgetOptions() -> ContentWidgetOptions {
        let widgetOptions = ContentWidgetOptions()
        widgetOptions.slug = slugTextField.text!
        widgetOptions.attributes[SNRContentWidgetOptionsAttributeKeyProductID] = productIDTextField.text!
        
        return widgetOptions
    }
    
    private func prepareWidgetAppearance() -> ContentWidgetAppearance {
        let widgetItemWidth: Int = Int(widgetItemWidthTextField.text!) ?? 0
        let widgetItemHeight: Int = Int(widgetItemHeightTextField.text!) ?? 0
        let widgetItemHorizontalSpacing: CGFloat = CGFloat((Int(widgetItemHorizontalSpacingTextField.text!) ?? 0))
        let widgetItemVerticalSpacing: CGFloat = CGFloat((Int(widgetItemVerticalSpacingTextField.text!) ?? 0))
        
        let widgetItemImageWidthFraction: CGFloat = CGFloat(Double(widgetItemImageWidthFractionTextField.text!) ?? 0)
        let widgetItemImageHeightFraction: CGFloat = CGFloat(Double(widgetItemImageHeightFractionTextField.text!) ?? 0)
        let widgetItemBorderWidth: CGFloat = CGFloat(Double(widgetItemBorderWidthTextField.text!) ?? 0)
        let widgetItemShadow: Bool = widgetItemShadowSwitch.isOn
        let widgetItemCornersRounded: Bool = widgetItemCornersRoundedSwitch.isOn
        
        let widgetItemSalePriceVisible: Bool = widgetItemSalePriceVisibleSwitch.isOn
        let widgetItemSalePriceOrientation: NSLayoutConstraint.Axis = NSLayoutConstraint.Axis(rawValue: widgetItemSalePriceOrientationSegmentedControl.selectedSegmentIndex)!
        
        let gridLayout = ContentWidgetGridLayout()
        gridLayout.insets = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        gridLayout.itemSize = CGSize(width: widgetItemWidth, height: widgetItemHeight)
        gridLayout.itemHorizontalSpacing = widgetItemHorizontalSpacing
        gridLayout.itemVerticalSpacing = widgetItemVerticalSpacing
        
        let itemLayout = ContentWidgetBasicProductItemLayout()
        itemLayout.imageWidthRatio = widgetItemImageWidthFraction
        itemLayout.imageHeightRatio = widgetItemImageHeightFraction
        itemLayout.borderWidth = widgetItemBorderWidth
        itemLayout.borderColor = UIColor.black
        itemLayout.isSalePriceVisible = widgetItemSalePriceVisible
        itemLayout.salePriceOrientation = widgetItemSalePriceOrientation
        
        let actionButton = ContentWidgetImageButtonCustomAction()
        actionButton.backgroundColor = UIColor.clear
        actionButton.tintColor = UIColor.black
        actionButton.image = UIImage(imageLiteralResourceName: "Shop Flow/icon_favorite_add")
        actionButton.isSelectable = true
        actionButton.selectedImage = UIImage(imageLiteralResourceName: "Shop Flow/icon_favorite_remove")
        actionButton.size = CGSize(width: 40, height: 40)
        actionButton.predefinedActionType = .sendLikeEvent
        actionButton.onReceiveClickAction = {
            model, isSelected in
            
        }
        actionButton.isSelected = {
            model in
            return false
        }
        
        itemLayout.actionButton = actionButton
        itemLayout.actionButtonPosition = CGPoint(x: (widgetItemWidth - 40 - 8), y: 8)
        
        if widgetItemShadow {
            itemLayout.shadowColor = UIColor.black
        }
        
        if widgetItemCornersRounded {
            itemLayout.cornerRadius = 12
        }
        
        let widgetAppearance = ContentWidgetAppearance(widgetLayout: gridLayout, itemLayout: itemLayout)
        
        return widgetAppearance
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 13
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 12 {
            if widget != nil {
                guard let widgetGridLayout = widget.appearance.layout as? ContentWidgetGridLayout else {
                    return 0.0
                }
                
                if widget.isLoaded() {
                    let widgetSize = widgetGridLayout.getSize(preferredWidth: widgetContainerView.bounds.size.width)
                    return  widgetSize.height + 16.0 + 16.0
                }
                
                return 100.0
            }
        }
        
        return 45
    }
}
    
extension RecommendationsWidgetAsGridTableViewController: ContentWidgetDelegate {
    
    func snr_widgetIsLoading(widget: ContentWidget, isLoading: Bool) {
        
    }
    
    func snr_widgetDidLoad(widget: ContentWidget) {
        tableView.beginUpdates()
        tableView.reloadSections(IndexSet(integer: 12), with: .none)
        tableView.endUpdates()
    }
    
    func snr_widgetDidNotLoad(widget: ContentWidget, error: Error) {
        showErrorInfo(error as NSError)
    }
    
    func snr_widgetDidChangeSize(widget: ContentWidget, size: CGSize) {
        tableView.beginUpdates()
        tableView.reloadSections(IndexSet(integer: 12), with: .none)
        tableView.endUpdates()
    }
    
    func snr_widgetDidReceiveClickAction(widget: ContentWidget, model: BaseModel) {
        if let recommendationModel = model as? Recommendation {
            presentAlert(title: "Clicked!", message: "\(recommendationModel.title) clicked!")
        }
    }
}
