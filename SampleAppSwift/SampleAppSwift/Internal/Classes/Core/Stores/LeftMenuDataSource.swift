//
//  LeftMenuDataSource.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import Foundation
import UIKit

enum LeftMenuState {
    case userNotLogged
    case userLogged
}

enum LeftMenuItemIdentity: Int {
    case dashboard
    case profile
    case shop
    case promotions
    case vouchers
    case cart
    case developerTools
    case registration
    case login
    case logout
    case settings
    case test
}

class LeftMenuDataSource {

    // MARK: - Static

    static func getLeftMenuItems(_ state: LeftMenuState) -> [LeftMenuItem] {
        switch state {
        case .userNotLogged: return getItemsForNotLoggedUser()
        case .userLogged: return getItemsForLoggedUser()
        }
    }
    
    private static func getItemsForNotLoggedUser() -> [LeftMenuItem] {
        return [
            LeftMenuItem(identity: LeftMenuItemIdentity.developerTools.rawValue, icon: UIImage(named: "LeftMenu/icon_settings")!, title: "LEFT_MENU_DEVELOPER_TOOLS".localized()),
            LeftMenuItem(identity: LeftMenuItemIdentity.registration.rawValue, icon: UIImage(named: "LeftMenu/icon_profile")!, title: "LEFT_MENU_REGISTRATION".localized()),
            LeftMenuItem(identity: LeftMenuItemIdentity.login.rawValue, icon: UIImage(named: "LeftMenu/icon_signout")!, title: "LEFT_MENU_LOGIN".localized()),
            LeftMenuItem(identity: LeftMenuItemIdentity.settings.rawValue, icon: UIImage(named: "LeftMenu/icon_settings")!, title: "LEFT_MENU_SETTINGS".localized())
        ]
    }

    private static func getItemsForLoggedUser() -> [LeftMenuItem] {
        return [
            LeftMenuItem(identity: LeftMenuItemIdentity.shop.rawValue, icon: UIImage(named: "LeftMenu/icon_shop")!, title: "LEFT_MENU_SHOP".localized()),
            LeftMenuItem(identity: LeftMenuItemIdentity.promotions.rawValue, icon: UIImage(named: "LeftMenu/icon_promotions")!, title: "LEFT_MENU_PROMOTIONS".localized()),
            LeftMenuItem(identity: LeftMenuItemIdentity.vouchers.rawValue, icon: UIImage(named: "LeftMenu/icon_vouchers")!, title: "LEFT_MENU_VOUCHERS".localized()),
            LeftMenuItem(identity: LeftMenuItemIdentity.cart.rawValue, icon: UIImage(named: "LeftMenu/icon_cart")!, title: "LEFT_MENU_CART".localized()),
            LeftMenuItem(identity: LeftMenuItemIdentity.developerTools.rawValue, icon: UIImage(named: "LeftMenu/icon_developer_tools")!, title: "LEFT_MENU_DEVELOPER_TOOLS".localized()),
            LeftMenuItem(identity: LeftMenuItemIdentity.profile.rawValue, icon: UIImage(named: "LeftMenu/icon_profile")!, title: "LEFT_MENU_PROFILE".localized()),
            LeftMenuItem(identity: LeftMenuItemIdentity.logout.rawValue, icon: UIImage(named: "LeftMenu/icon_signout")!, title: "LEFT_MENU_LOGOUT".localized()),
            LeftMenuItem(identity: LeftMenuItemIdentity.settings.rawValue, icon: UIImage(named: "LeftMenu/icon_settings")!, title: "LEFT_MENU_SETTINGS".localized())
        ]
    }
}
