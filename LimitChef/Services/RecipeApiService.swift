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
    
    let baseUrl: String = "www.themealdb.com/api/json/v1/"
    let apiKey = "1/"
    
    func fetchRecipeById(id: String) -> Recipe? {
        
        var recipeById: Recipe? = nil
        
        //MARK: SCHRITT 1: URL DEFINIEREN
        let urlExt = "lookup.php?i="
        guard let url = URL(string: "\(baseUrl)\(urlExt)\(id)") else {
            print("Error forming URL")
            return nil
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
                    print(recipeById)
                }
            }catch{
                print(error)
            }
            
        }
        //MARK: SCHRITT 4: API CALL STARTEN
        task.resume()
        
        return recipeById
    }
}
