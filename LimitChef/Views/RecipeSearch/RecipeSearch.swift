//
//  RecipeSearch.swift
//  LimitChef
//
//  Created by Nigel Marks on 17.07.23.
//

import SwiftUI

struct RecipeSearch: View {
    @StateObject var searchViewModel: SearchViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            ZStack {
                LimitChefColors.secondary
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HeaderView(headerText: "Search Recipes")
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Label("Back", systemImage: "chevron.left")
                        }
                        .padding(.leading, 32)
                        Spacer()
                    }
                    List {
                        ForEach(searchViewModel.recipes, id: \.self) { recipe in
                            NavigationLink(value: recipe) {
                                ListThumbnailMedium(url: recipe.strMealThumb, name: recipe.strMeal, ingredients: Util.getIngredientsAsList(recipe: recipe))
                            }
                        }
                        .listRowBackground(LimitChefColors.primary)
                    }
                    .scrollContentBackground(.hidden)
                    .navigationDestination(for: Recipe.self) { recipe in
                        RecipeDetailView(recID: recipe.idMeal)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct RecipeSearch_Previews: PreviewProvider {
    static var previews: some View {
        RecipeSearch(searchViewModel: SearchViewModel(searchBy: .ingredientList, category: "", ingredientSingle: ""))
    }
}
