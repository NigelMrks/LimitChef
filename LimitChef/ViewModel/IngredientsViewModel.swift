// IngredientsViewModel.swift
// LimitChef
//
// Created by Nigel Marks on 11.07.23.
//
import Foundation
class IngredientsViewModel: ObservableObject {
  var apiServer = RecipeApiService()
  @Published var crud = CRUDService()
  @Published var ingredientsAll = [IngredientAPI]()
  @Published var selectedIngredient: IngredientAPI = IngredientAPI(idIngredient: "1", strIngredient: "Chicken")
  @Published var ingredients : [Ingredient] = []
  init() {
    apiServer.getIngredients{ response in
      self.ingredientsAll = response
    }
    self.ingredients = crud.getIngredients()
  }
  func addIngredient(ingredient: IngredientAPI) {
    crud.addIngredient(ingredient: ingredient)
    self.ingredients = crud.getIngredients()
  }
  func deleteIngredient(at indexSet: IndexSet) {
    crud.deleteIngredient(at: indexSet)
    self.ingredients = crud.getIngredients()
  }
}
