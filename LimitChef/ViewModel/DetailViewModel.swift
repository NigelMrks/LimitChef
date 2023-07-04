//
//  DetailViewModel.swift
//  LimitChef
//
//  Created by Till Hemmerich on 04.07.23.
//

import Foundation


class DetailViewModel: ObservableObject {
    
  
    
    //Variables
    @Published var recipe = Recipe(){
        didSet{
            print("hello")
        }
    }
    
    //Services etc
    var apiServer = RecipeApiService()
    
    func fetchRecipe(ID : String){
        apiServer.fetchRecipeById(id: ID) { response in
            self.recipe = response
        }
    }
    
    func getIngredientsAsList() -> [String]{
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
}
