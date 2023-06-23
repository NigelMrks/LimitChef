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

struct Category: Codable {
    var idCategory: String
    var strCategory: String
    var strCategoryThumb: String
}
