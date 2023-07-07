//
//  IngredientAPI.swift
//  LimitChef
//
//  Created by Nigel Marks on 07.07.23.
//

import Foundation

struct IngredientResponse: Codable {
    var meals: [IngredientAPI]
}

struct IngredientAPI: Codable, Hashable {
    var idIngredient: String = "1"
    var strIngredient: String = "Chicken"
}
