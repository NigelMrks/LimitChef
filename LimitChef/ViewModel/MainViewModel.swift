//
//  MainViewModel.swift
//  LimitChef
//
//  Created by Nigel Marks on 23.06.23.
//

import Foundation

class MainViewModel: ObservableObject {
    
    //Dummy Variables for testing
    var recipeDummyList = [Recipe(),Recipe(),Recipe(),Recipe(),Recipe(),Recipe(),Recipe(),Recipe(),Recipe(),Recipe()]
    var categoryDummyList = [Category(),Category(),Category(),Category(),Category(),Category(),Category(),Category()]
    
    //Variables
    @Published var recipeList = [Recipe]()
    @Published var categoryList = [Recipe]()
    
    //Services etc
    var apiServer = RecipeApiService()
    
    
    
    //Functions
    //General
    func getIngredientsAsList(recipe: Recipe) -> [String]{
        var ingredients = [String]()
        func addToList(Ing: String?) {
            if (Ing != nil && Ing != "") {
                ingredients.append(Ing!)
            }
        }
        addToList(Ing: recipe.strIngredient1)
        addToList(Ing: recipe.strIngredient2)
        addToList(Ing: recipe.strIngredient3)
        addToList(Ing: recipe.strIngredient4)
        addToList(Ing: recipe.strIngredient5)
        addToList(Ing: recipe.strIngredient6)
        addToList(Ing: recipe.strIngredient7)
        addToList(Ing: recipe.strIngredient8)
        addToList(Ing: recipe.strIngredient9)
        addToList(Ing: recipe.strIngredient10)
        addToList(Ing: recipe.strIngredient11)
        addToList(Ing: recipe.strIngredient12)
        addToList(Ing: recipe.strIngredient13)
        addToList(Ing: recipe.strIngredient14)
        addToList(Ing: recipe.strIngredient15)
        addToList(Ing: recipe.strIngredient16)
        addToList(Ing: recipe.strIngredient17)
        addToList(Ing: recipe.strIngredient18)
        addToList(Ing: recipe.strIngredient19)
        addToList(Ing: recipe.strIngredient20)
        return ingredients
    }
    
    func getIngredientThumb(ingredient: String) -> String{
        let formattedString = ingredient.replacingOccurrences(of: " ", with: "%20")
        return "https://www.themealdb.com/images/ingredients/\(formattedString).png"
        
    }
    
    //API
    func fetchRecipeById(id: String = "52772") -> Recipe? {
        var recipe = apiServer.fetchRecipeById(id: id)
        //do {
        //    try await var recipe = apiServer.idWithAsync(id: id)
        //} catch {
        //    print("Error", error)
        //}
        print("VIEWMODEL")
        print (recipe)
        return recipe
        
    }
}
