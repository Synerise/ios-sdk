//
//  CommonEventsViewController.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit
import SyneriseSDK

class CommonEventsViewController: UITableViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Force Send", style: .done, target: self, action: #selector(forceSendEvents))
        navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        self.navigationItem.title = "VIEW_CONTROLLER_COMMON_EVENTS_TITLE".localized()
    }
    
    // MARK: - Inherited
    
    //swiftlint:disable:next cyclomatic_complexity
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 && indexPath.row == 0 { sendAddedToCartEvent() }
        if indexPath.section == 1 && indexPath.row == 0 { sendRemovedFromCartEvent() }
        if indexPath.section == 2 && indexPath.row == 0 { sendAddedToFavoritesEvent() }
        if indexPath.section == 3 && indexPath.row == 0 { sendLoggedInEvent() }
        if indexPath.section == 4 && indexPath.row == 0 { sendLoggedOutEvent() }
        if indexPath.section == 5 && indexPath.row == 0 { sendRegisteredEvent() }
        if indexPath.section == 6 && indexPath.row == 0 { sendPushClickedEvent() }
        if indexPath.section == 7 && indexPath.row == 0 { sendPushViewedEvent() }
        if indexPath.section == 8 && indexPath.row == 0 { sendPushCancelledEvent() }
        if indexPath.section == 9 && indexPath.row == 0 { sendAppearedInLocationEvent() }
        if indexPath.section == 10 && indexPath.row == 0 { sendHitTimerEvent() }
        if indexPath.section == 11 && indexPath.row == 0 { sendSearchedEvent() }
        if indexPath.section == 12 && indexPath.row == 0 { sendSharedEvent() }
        if indexPath.section == 13 && indexPath.row == 0 { sendVisitedScreenEvent() }
        if indexPath.section == 14 && indexPath.row == 0 { sendProductViewEvent() }
        if indexPath.section == 15 && indexPath.row == 0 { sendRecommendationSeenEvent() }
        if indexPath.section == 16 && indexPath.row == 0 { sendRecommendationClickEvent() }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Private
    
    private func sendAddedToCartEvent() {
        let price = UnitPrice(amount: 10.99)
        let event = AddedProductToCartEvent(label: "AddedToCartEventLabel", sku: "sku", finalPrice: price, quantity: 12)
        event.setProducer("Producer")
        event.setName("Name")
        let unitPrice = UnitPrice(amount: 9.99)
        event.setRegularPrice(unitPrice)
        Tracker.send(event)
    }
    
    private func sendRemovedFromCartEvent() {
        let price = UnitPrice(amount: 10.99)
        let event = RemovedProductFromCartEvent(label: "RemovedFromCartEvent", sku: "sku", finalPrice: price, quantity: 12)
        event.setProducer("Producer")
        event.setName("Name")
        let unitPrice = UnitPrice(amount: 9.99)
        event.setRegularPrice(unitPrice)
        Tracker.send(event)
    }
    
    private func sendAddedToFavoritesEvent() {
        let event = AddedProductToFavoritesEvent(label: "AddedToFavoritesEventLabel")
        Tracker.send(event)
    }
    
    private func sendLoggedInEvent() {
        let params = TrackerParams.make { (builder) in
            builder.setDouble(1.023, forKey: "SomeKey")
            builder.setObject(["SomeKey": "SomeValue"], forKey: "AnotherKey")
            builder.setString("SomeString", forKey: "StringKey")
            builder.setInt(42, forKey: "IntKey")
        }
        let event = LoggedInEvent(label: "label", params: params)
        Tracker.send(event)
    }
    
    private func sendLoggedOutEvent() {
        let event = LoggedOutEvent(label: "label", params: nil)
        Tracker.send(event)
    }
    
    private func sendRegisteredEvent() {
        let event = RegisteredEvent(label: "label")
        Tracker.send(event)
    }
    
    private func sendPushClickedEvent() {
        let event = PushClickedEvent(label: "label")
        Tracker.send(event)
    }
    
    private func sendPushViewedEvent() {
        let event = PushViewedEvent(label: "label")
        Tracker.send(event)
    }
    
    private func sendPushCancelledEvent() {
        let event = CancelledPushEvent(label: "label")
        Tracker.send(event)
    }
    
    private func sendAppearedInLocationEvent() {
        let loc = CLLocation(latitude: CLLocationDegrees(10.032), longitude: CLLocationDegrees(10.523))
        let event = AppearedInLocationEvent(label: "label", location: loc)
        Tracker.send(event)
    }
    
    private func sendHitTimerEvent() {
        let params = TrackerParams.make { (builder) in
            builder.setDouble(1.023, forKey: "SomeKey")
            builder.setObject(["SomeKey": "SomeValue"], forKey: "AnotherKey")
            builder.setString("SomeString", forKey: "StringKey")
            builder.setInt(42, forKey: "IntKey")
        }
        let event = HitTimerEvent(label: "label", params: params)
        Tracker.send(event)
    }
    
    private func sendSearchedEvent() {
        let event = SearchedEvent(label: "label")
        Tracker.send(event)
    }
    
    private func sendSharedEvent() {
        let params = TrackerParams.make { (builder) in
            builder.setDouble(1.023, forKey: "DoubleKey")
            builder.setObject(["SomeKey": "SomeValue"], forKey: "ObjectKey")
            builder.setString("SomeString", forKey: "StringKey")
            builder.setInt(42, forKey: "IntKey")
        }
        let event = SharedEvent(label: "label", params: params)
        Tracker.send(event)
    }
    
    private func sendVisitedScreenEvent() {
        let event = VisitedScreenEvent(label: "label")
        Tracker.send(event)
    }
    
    private func sendProductViewEvent() {
        let event = ProductViewEvent(label: "label", productName: "product name", productId: "product id", params: nil)
        event.setIsRecommended(true)
        event.setCategory("product category")
        event.setURL(URL(string: "myapp://category/1234")!)
        
        Tracker.send(event)
    }
    
    private func sendRecommendationSeenEvent() {
        let event = RecommendationSeenEvent(label: "label", productName: "product name", productId: "product id", campaignID: "1234", campaignHash: "1234", params: nil)
        event.setCategory("product category")
        event.setURL(URL(string: "myapp://category/1234")!)
        
        Tracker.send(event)
    }
    
    private func sendRecommendationClickEvent() {
        let event = RecommendationClickEvent(label: "label", productName: "product name", productId: "product id", campaignID: "1234", campaignHash: "1234", params: nil)
        event.setCategory("product category")
        event.setURL(URL(string: "myapp://category/1234")!)
        
        Tracker.send(event)
    }
    
    @objc private func forceSendEvents() {
        Tracker.flushEvents {
            
        }
    }
}
