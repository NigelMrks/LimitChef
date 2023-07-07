//
//  RecipeApiService.swift
//  LimitChef
//
//  Created by Nigel Marks on 28.06.23.
//

import Foundation
import SwiftUI

class RecipeApiService: ObservableObject {
    
    @Published var recipes = [Recipe]()
    @Published var navPath = NavigationPath()
    
    let baseUrl: String = "https://www.themealdb.com/api/json/v1/"
    let apiKey = "1/"
    
    func fetchRecipeById(id: String,completion : @escaping (Recipe) -> Void){
        var recipeById: Recipe?
        //MARK: SCHRITT 1: URL DEFINIEREN
        let urlExt = "lookup.php?i="
        guard let url = URL(string: "\(baseUrl)\(apiKey)\(urlExt)\(id)") else {
            print("Error forming URL")
            return
        }
        //MARK: SCHRITT 2:  URL SESSION & DATA TASK ANLEGEN
        let task = URLSession.shared.dataTask(with: url) {  data, resCode, error in
            print(resCode)
            guard let data = data , error == nil else{
                print(error as Any)
                return
            }
            //MARK: SCHRITT 3: DATEN DECODEN
            do{
                let recipeResponse = try JSONDecoder().decode(RecipeResponse.self, from: data)
                DispatchQueue.main.async {
                    recipeById = recipeResponse.meals[0]
                    completion(recipeResponse.meals[0])
                    print("APISERVICE")
                    print(recipeById)
                }
            }catch{
                print(error)
            }
        }
        //MARK: SCHRITT 4: API CALL STARTEN
        task.resume()
    }
    
    func fetchRandomRecipe(completion : @escaping (Recipe) -> Void){
        var randomRecipe: Recipe?
        //MARK: SCHRITT 1: URL DEFINIEREN
        let urlExt = "random.php"
        guard let url = URL(string: "\(baseUrl)\(apiKey)\(urlExt)") else {
            print("Error forming URL")
            return
        }
        //MARK: SCHRITT 2:  URL SESSION & DATA TASK ANLEGEN
        let task = URLSession.shared.dataTask(with: url) {  data, resCode, error in
            print(resCode)
            guard let data = data , error == nil else{
                print(error as Any)
                return
            }
            //MARK: SCHRITT 3: DATEN DECODEN
            do{
                let recipeResponse = try JSONDecoder().decode(RecipeResponse.self, from: data)
                DispatchQueue.main.async {
                    randomRecipe = recipeResponse.meals[0]
                    completion(recipeResponse.meals[0])
                    print("APISERVICE")
                    print(randomRecipe)
                }
            }catch{
                print(error)
            }
        }
        //MARK: SCHRITT 4: API CALL STARTEN
        task.resume()
    }
    
    func getCategories(completion : @escaping ([Category]) -> Void){
        var categories = [Category]()
        //MARK: SCHRITT 1: URL DEFINIEREN
        let urlExt = "categories.php"
        guard let url = URL(string: "\(baseUrl)\(apiKey)\(urlExt)") else {
            print("Error forming URL")
            return
        }
        //MARK: SCHRITT 2:  URL SESSION & DATA TASK ANLEGEN
        let task = URLSession.shared.dataTask(with: url) {  data, resCode, error in
            print(resCode)
            guard let data = data , error == nil else{
                print(error as Any)
                return
            }
            //MARK: SCHRITT 3: DATEN DECODEN
            do{
                let categoryResponse = try JSONDecoder().decode(CategoryResponse.self, from: data)
                DispatchQueue.main.async {
                    categories = categoryResponse.categories
                    completion(categoryResponse.categories)
                    print("APISERVICE")
                    print(categories)
                }
            }catch{
                print(error)
            }
        }
        //MARK: SCHRITT 4: API CALL STARTEN
        task.resume()
    }
    
    func getIngredients(completion : @escaping ([IngredientAPI]) -> Void){
        var ingredients = [IngredientAPI]()
        //MARK: SCHRITT 1: URL DEFINIEREN
        let urlExt = "list.php?i=list"
        guard let url = URL(string: "\(baseUrl)\(apiKey)\(urlExt)") else {
            print("Error forming URL")
            return
        }
        //MARK: SCHRITT 2:  URL SESSION & DATA TASK ANLEGEN
        let task = URLSession.shared.dataTask(with: url) {  data, resCode, error in
            print(resCode)
            guard let data = data , error == nil else{
                print(error as Any)
                return
            }
            //MARK: SCHRITT 3: DATEN DECODEN
            do{
                let ingredientResponse = try JSONDecoder().decode(IngredientResponse.self, from: data)
                DispatchQueue.main.async {
                    ingredients = ingredientResponse.meals
                    completion(ingredientResponse.meals)
                    print("APISERVICE")
                    print(ingredients)
                }
            }catch{
                print(error)
            }
        }
        //MARK: SCHRITT 4: API CALL STARTEN
        task.resume()
    }
}
