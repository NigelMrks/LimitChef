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
    
    //Services etc
    var apiServer = RecipeApiService()
    
    func fetchRecipe(ID : String){
        apiServer.fetchRecipeById(id: ID) { response in
            self.recipe = response
        }
    }
    
    
}
