//
//  RecipeSearch.swift
//  LimitChef
//
//  Created by Nigel Marks on 17.07.23.
//

import SwiftUI

struct RecipeSearch: View {
    @StateObject var searchViewModel: SearchViewModel
    
    var body: some View {
        ZStack {
            LimitChefColors.secondary
                .edgesIgnoringSafeArea(.all)
            VStack {
                HeaderView(headerText: "Search Recipes")
                List {
                    ForEach(searchViewModel.recipes, id: \.self) { recipe in
                        ListThumbnailMedium(url: recipe.strMealThumb, name: recipe.strMeal, ingredients: Util.getIngredientsAsList(recipe: recipe))
                    }
                    .listRowBackground(LimitChefColors.primary)
                }
                .background(LimitChefColors.secondary)
                .scrollContentBackground(.hidden)
            }
        }
    }
}

struct RecipeSearch_Previews: PreviewProvider {
    static var previews: some View {
        RecipeSearch(searchViewModel: SearchViewModel(searchBy: .ingredientList, category: "", ingredientSingle: ""))
    }
}
