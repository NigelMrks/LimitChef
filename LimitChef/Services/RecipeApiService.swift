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
    
    func idWithAsync(id: String) async throws -> Recipe? {
        
        var recipeById: Recipe
        let urlExt = "lookup.php?i="
        guard let url = URL(string: "\(baseUrl)\(apiKey)\(urlExt)\(id)") else {
            print("Error forming URL")
            return nil
        }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
        let decodedRecipe = try JSONDecoder().decode(RecipeResponse.self, from: data)
            print("Async decodedFood", decodedRecipe)
        recipeById = decodedRecipe.meals[0]
        return recipeById
    }
}
