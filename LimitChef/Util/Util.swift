//
//  Util.swift
//  LimitChef
//
//  Created by Nigel Marks on 07.07.23.
//

import Foundation

struct Util {
    static func getIngredientsAsList(recipe: Recipe) -> [String]{
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
    
    static func getIngredientThumb(ingredient: String) -> String{
        let formattedString = ingredient.replacingOccurrences(of: " ", with: "%20")
        return "https://www.themealdb.com/images/ingredients/\(formattedString).png"
        
    }
}
