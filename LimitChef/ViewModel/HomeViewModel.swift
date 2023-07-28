//
//  HomeViewModel.swift
//  LimitChef
//
//  Created by Nigel Marks on 07.07.23.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var randomRecipes = [Recipe]()
    @Published var ingredients = [IngredientAPI]()
    @Published var categories = [Category]()
    
    var apiServer = RecipeApiService()
    
    func getRandomRecipes() {
        randomRecipes = [Recipe]()
        for _ in 1...10 {
            apiServer.fetchRandomRecipe() {response in
                self.randomRecipes.append(response)
            }
        }
    }
    
    func getIngredients() {
        apiServer.getIngredients() {response in
            self.ingredients = response
        }
    }
    
    func getCategories() {
        apiServer.getCategories() {response in
            self.categories = response
        }
    }
}
