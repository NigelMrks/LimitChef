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
            print("recipe was set")
        }
    }
    @Published var isFavorite = false
    
    //Services etc
    var apiServer = RecipeApiService()
    var crud = CRUDService()
    
    func fetchRecipe(ID : String){
        apiServer.fetchRecipeById(id: ID) { response in
            self.recipe = response
        }
        
        if crud.favorites.contains(where: { $0.id == recipe.idMeal }) {
            isFavorite = true
        } else {
            isFavorite = false
        }
    }
    
    func toggleFavorite() {
        if (isFavorite) {
            crud.deleteFavoriteById(id: recipe.idMeal)
        } else {
            crud.addFavorite(recipe: recipe)
        }
        
        if crud.favorites.contains(where: { $0.id == recipe.idMeal }) {
            isFavorite = true
        } else {
            isFavorite = false
        }
    }
    
    
}
