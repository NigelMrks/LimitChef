//
//  IngredientsViewModel.swift
//  LimitChef
//
//  Created by Nigel Marks on 11.07.23.
//

import Foundation

class IngredientsViewModel: ObservableObject {
    var apiServer = RecipeApiService()
    @Published var crud = CRUDService()
    @Published var ingredientsAll = [IngredientAPI]()
    @Published var selectedIngredient: IngredientAPI = IngredientAPI(idIngredient: "1", strIngredient: "Chicken")
    
    init() {
        apiServer.getIngredients{ response in
            self.ingredientsAll = response
        }
        
    }
}
