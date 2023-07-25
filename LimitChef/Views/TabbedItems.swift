//
//  TabbedItems.swift
//  LimitChef
//
//  Created by Nigel Marks on 25.07.23.
//

import Foundation

enum TabbedItems: Int, CaseIterable{
    case home = 0
    case ingredients
    case favorite
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .ingredients:
            return "Ingredients"
        case .favorite:
            return "Favorite"
        }
    }
    
    var iconName: String{
        switch self {
        case .home:
            return "home.fill"
        case .ingredients:
            return "list.triangle"
        case .favorite:
            return "star.fill"
        }
    }
}
