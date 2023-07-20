//
//  SearchViewModel.swift
//  LimitChef
//
//  Created by Nigel Marks on 17.07.23.
//

import Foundation

enum SearchBy {
    case category
    case ingredientSingle
    case ingredientList
}

class SearchViewModel: ObservableObject {
    var apiServer = RecipeApiService()
    var crud = CRUDService()
    @Published var recipes = [Recipe]()
    var searchBy: SearchBy
    var category: String
    var ingredientSingle: String
    var ingredientList: [Ingredient]
    
    init(searchBy: SearchBy = .ingredientList, category: String = "", ingredientSingle: String = "") {
        self.searchBy = searchBy
        self.category = category
        self.ingredientSingle = ingredientSingle
        
        self.ingredientList = crud.ingredients
        
        startRecipeSearch()
    }
    
    func startRecipeSearch() {
        switch searchBy {
        case .category:
            apiServer.fetchRecipesByCategory(category: self.category) { response in
                self.recipes = response
            }
        case .ingredientSingle:
            apiServer.fetchRecipeByIngredient(ingredient: self.ingredientSingle) { response in
                self.recipes = response
            }
        case .ingredientList:
            if (!self.ingredientList.isEmpty) {
                ingredientList.forEach { ingredient in
                    apiServer.fetchRecipeByIngredient(ingredient: ingredient.name ?? "error") { response in
                        self.recipes = response
                    }
                }
            }
        }
    }
    
    func filterWithVariance(unfilteredRecipes: [Recipe]) -> [Recipe] {
        var variance: Int = Int(UserDefaults.standard.double(forKey: AppStorageKeys.VARIANCE))
        var filteredRecipes = [Recipe]()
        unfilteredRecipes.forEach { recipe in
            var unstocked = 0
            var ingrList = Util.getIngredientsAsList(recipe: recipe)
            ingrList.forEach { ingredient in
                var isStocked: Bool = false
                crud.ingredients.forEach { stocked in
                    if (stocked.name == ingredient) {
                        isStocked = true
                    }
                }
                if (!isStocked) {
                    unstocked += 1
                }
            }
            if (unstocked <= variance) {
                filteredRecipes.append(recipe)
            }
        }
        return filteredRecipes
    }
}


