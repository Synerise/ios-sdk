//
//  CategoryDataSource.swift
//  SampleAppSwift
//
//  Created by Synerise
//  Copyright (c) 2018 Synerise. All rights reserved.
//

import UIKit

class CategoryDataSource {
    
    enum CategoryIdentity: Int {
        case hdTV = 1
        case laptopsAndTablets = 2
        case phones =  3
        case householdGoods = 4
        
        case vegetables = 5
        case fruits  = 6
        case liquids = 7
        case dailyPoducts = 8
        
        case shoes = 9
        case trousers = 10
        case runningAccessories = 11
        case jackets = 12
        
        case music = 13
        case books = 14
        case movies = 15
        case games = 16
        
        case promotions = 17
    }
    
    // MARK: - Static
    
    static func getAllCategoriesIdentifiers() -> [Int] {
        return [
            CategoryIdentity.shoes.rawValue,
            CategoryIdentity.trousers.rawValue,
            CategoryIdentity.runningAccessories.rawValue,
            CategoryIdentity.jackets.rawValue,
            CategoryIdentity.hdTV.rawValue,
            CategoryIdentity.laptopsAndTablets.rawValue,
            CategoryIdentity.phones.rawValue,
            CategoryIdentity.householdGoods.rawValue,
            CategoryIdentity.vegetables.rawValue,
            CategoryIdentity.fruits.rawValue,
            CategoryIdentity.liquids.rawValue,
            CategoryIdentity.dailyPoducts.rawValue,
            CategoryIdentity.music.rawValue,
            CategoryIdentity.books.rawValue,
            CategoryIdentity.movies.rawValue,
            CategoryIdentity.games.rawValue
        ]
    }
    
    static func getCategory(sectionId: Int) -> [Category]? {
        switch sectionId {
        case 1: return electronicsAndAGDCategory()
        case 2: return foodAndLiquidsCategory()
        case 3: return getSportCategory()
        case 4: return cultureAndMediaCategory()
        default: return nil
        }
    }
    
    static func getPromotionCategory() -> Category {
        return Category(identificator: CategoryIdentity.promotions.rawValue, title: "Promotions", backgroundColor: #colorLiteral(red: 0.9176470588, green: 0.3176470588, blue: 0.2235294118, alpha: 1), icon: #imageLiteral(resourceName: "Categories/Sport/banner_shoes"))
    }
    
    private static func getSportCategory() -> [Category] {
        return [
            Category(identificator: CategoryIdentity.shoes.rawValue, title: "Shoes", backgroundColor: #colorLiteral(red: 0.9176470588, green: 0.3176470588, blue: 0.2235294118, alpha: 1), icon: #imageLiteral(resourceName: "Categories/Sport/banner_shoes")),
            Category(identificator: CategoryIdentity.trousers.rawValue, title: "Trousers", backgroundColor: #colorLiteral(red: 0.7764705882, green: 0.2509803922, blue: 0.3764705882, alpha: 1), icon: #imageLiteral(resourceName: "Categories/Sport/banner_trousers")),
            Category(identificator: CategoryIdentity.runningAccessories.rawValue, title: "Running accessories", backgroundColor: #colorLiteral(red: 0.5411764706, green: 0.2352941176, blue: 0.6156862745, alpha: 1), icon: #imageLiteral(resourceName: "Categories/Sport/banner_acc")),
            Category(identificator: CategoryIdentity.jackets.rawValue, title: "Jackets", backgroundColor: #colorLiteral(red: 0.431372549, green: 0.2352941176, blue: 0.6156862745, alpha: 1), icon: #imageLiteral(resourceName: "Categories/Sport/banner_jacket"))
        ]
    }
    
    private static func electronicsAndAGDCategory() -> [Category] {
        return [
            Category(identificator: CategoryIdentity.hdTV.rawValue, title: "HD TV", backgroundColor: #colorLiteral(red: 0.2196078431, green: 0.1137254902, blue: 0.6862745098, alpha: 1), icon: UIImage(named: "Categories/AGD/banner_tv")!),
            Category(identificator: CategoryIdentity.laptopsAndTablets.rawValue, title: "Laptops & tablets", backgroundColor: #colorLiteral(red: 0, green: 0.3607843137, blue: 0.6980392157, alpha: 1), icon: UIImage(named: "Categories/AGD/banner_phone")!),
            Category(identificator: CategoryIdentity.phones.rawValue, title: "Phones", backgroundColor: #colorLiteral(red: 0, green: 0.6156862745, blue: 0.768627451, alpha: 1), icon: UIImage(named: "Categories/AGD/banner_laptop")!),
            Category(identificator: CategoryIdentity.householdGoods.rawValue, title: "Household goods", backgroundColor: #colorLiteral(red: 0.1529411765, green: 0.7843137255, blue: 0.768627451, alpha: 1), icon: UIImage(named: "Categories/AGD/banner_agd")!)
        ]
    }
    
    private static func foodAndLiquidsCategory() -> [Category] {
        return [
            Category(identificator: CategoryIdentity.vegetables.rawValue, title: "Vegetables", backgroundColor: #colorLiteral(red: 0.3294117647, green: 0.7294117647, blue: 0.03921568627, alpha: 1), icon: UIImage(named: "Categories/FoodAndLiquids/banner_vegetables")!),
            Category(identificator: CategoryIdentity.fruits.rawValue, title: "Fruits", backgroundColor: #colorLiteral(red: 0.537254902, green: 0.7215686275, blue: 0.03137254902, alpha: 1), icon: UIImage(named: "Categories/FoodAndLiquids/banner_fruits")!),
            Category(identificator: CategoryIdentity.liquids.rawValue, title: "Liquids", backgroundColor: #colorLiteral(red: 0.768627451, green: 0.7607843137, blue: 0, alpha: 1), icon: UIImage(named: "Categories/FoodAndLiquids/banner_liquids")!),
            Category(identificator: CategoryIdentity.dailyPoducts.rawValue, title: "Dairy products", backgroundColor: #colorLiteral(red: 0.9333333333, green: 0.7058823529, blue: 0.01960784314, alpha: 1), icon: UIImage(named: "Categories/FoodAndLiquids/banner_dairy")!)
        ]
    }
    
    private static func cultureAndMediaCategory() -> [Category] {
        return [
            Category(identificator: CategoryIdentity.music.rawValue, title: "Music", backgroundColor: #colorLiteral(red: 0.9294117647, green: 0.2117647059, blue: 0.3098039216, alpha: 1), icon: UIImage(named: "Categories/CultureAndMedia/banner_music")!),
            Category(identificator: CategoryIdentity.books.rawValue, title: "Books", backgroundColor: #colorLiteral(red: 0.6352941176, green: 0.01960784314, blue: 0.2823529412, alpha: 1), icon: UIImage(named: "Categories/CultureAndMedia/banner_books")!),
            Category(identificator: CategoryIdentity.movies.rawValue, title: "Movies", backgroundColor: #colorLiteral(red: 0.5058823529, green: 0.06666666667, blue: 0.2745098039, alpha: 1), icon: UIImage(named: "Categories/CultureAndMedia/banner_movies")!),
            Category(identificator: CategoryIdentity.games.rawValue, title: "Games", backgroundColor: #colorLiteral(red: 0.4, green: 0.08235294118, blue: 0.2862745098, alpha: 1), icon: UIImage(named: "Categories/CultureAndMedia/banner_games")!)
        ]
    }
}
