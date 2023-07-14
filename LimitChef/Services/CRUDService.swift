//
// CRUDService.swift
// LimitChef
//
// Created by Nigel Marks on 11.07.23.
//
import Foundation
import CoreData
class CRUDService: ObservableObject {
  private var container : NSPersistentContainer
  @Published var favorites = [Favorite]()
  @Published var ingredients = [Ingredient]()
  init(){
    container = NSPersistentContainer(name: "RecipeModel")
    container.loadPersistentStores { description, error in
      if let error = error {
        fatalError("failed to load container from CoreData :\(error.localizedDescription)")
      }
    }
    getFavorites()
    self.ingredients = getIngredients()
  }
  func getFavorites(){
    let favoritesRequest = NSFetchRequest<Favorite>(entityName: "Favorite")
    do{
      favorites = try container.viewContext.fetch(favoritesRequest)
    } catch {
      print("error fetching favorite recipes :\(error.localizedDescription)")
    }
  }
  func getIngredients() -> [Ingredient]{
    let ingredientsRequest = NSFetchRequest<Ingredient>(entityName: "Ingredient")
    do{
      return try container.viewContext.fetch(ingredientsRequest)
    }catch {
      print("error fetching ingredient list :\(error.localizedDescription)")
    }
    return []
  }
  func saveData(){
    do {
      try container.viewContext.save()
    }catch{
      print("failed to save Data :\(error.localizedDescription)")
    }
  }
  func addIngredient(ingredient: IngredientAPI){
    var isUnique: Bool = true
    ingredients.forEach { ingr in
      if (ingr.id == ingredient.idIngredient) {
        isUnique = false
      }
    }
    if (isUnique) {
      let newIngredient = Ingredient(context: container.viewContext)
      newIngredient.id = ingredient.idIngredient
      newIngredient.name = ingredient.strIngredient
      newIngredient.thumbnail = Util.getIngredientThumb(ingredient: ingredient.strIngredient)
      saveData()
    }
    self.ingredients = getIngredients()
  }
  func addFavorite(recipe: Recipe){
    let newFavorite = Favorite(context: container.viewContext)
    newFavorite.id = recipe.idMeal
    newFavorite.name = recipe.strMeal
    newFavorite.thumbnail = recipe.strMealThumb
    newFavorite.ingredients = Util.getIngredientsAsList(recipe: recipe)
    saveData()
    getFavorites()
  }
  func deleteFavorite(indexSet: IndexSet){
    guard let index = indexSet.first else {
      print("Missing index.")
      return
    }
    let deleteItem = favorites[index]
    container.viewContext.delete(deleteItem)
    do{
      try container.viewContext.save()
      getFavorites()
      self.objectWillChange.send()
    } catch {
      print("Failed to delete & update Favorites: \(error.localizedDescription)")
    }
  }
  func deleteIngredient(at indexSet: IndexSet){
    self.ingredients = getIngredients()
    guard let index = indexSet.first else {
      print("Missing index.")
      return
    }
    let deleteItem = ingredients[index]
    container.viewContext.delete(deleteItem)
    do{
      try container.viewContext.save()
      self.objectWillChange.send()
    } catch {
      print("Failed to delete & update Ingredients: \(error.localizedDescription)")
    }
  }
}






