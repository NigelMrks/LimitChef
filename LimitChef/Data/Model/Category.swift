//
//  Category.swift
//  LimitChef
//
//  Created by Nigel Marks on 23.06.23.
//

import Foundation

struct CategoryResponse: Codable {
    var categories: [Category]
}

struct Category: Codable, Hashable {
    var idCategory: String = "1"
    var strCategory: String = "Beef"
    var strCategoryThumb: String = "https://www.themealdb.com/images/category/beef.png"
}
