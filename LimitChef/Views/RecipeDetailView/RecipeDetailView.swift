//
//  RecipeDetailView.swift
//  LimitChef
//
//  Created by Nigel Marks on 03.07.23.
//

import SwiftUI

struct RecipeDetailView: View {
    var selectedRecipe: Recipe
    var viewModel = MainViewModel()
    var body: some View {
        VStack {
            ZStack {
                AsyncImage(url: URL(string: selectedRecipe.strMealThumb))
                { image in image.resizable() } placeholder: { LimitChefColors.accents }
                    .frame(height: 200)
                    .scaledToFit()
                HeaderView(headerText: selectedRecipe.strMeal)
            }.edgesIgnoringSafeArea(.top)
            ScrollView(.horizontal) {
                HStack {
                    ForEach( viewModel.getIngredientsAsList(recipe: selectedRecipe), id: \.self) {ingredient in
                        ListThumbnailSmall(url: viewModel.getIngredientThumb(ingredient: ingredient), name: ingredient)
                    }
                }
            }
            HeaderView(headerText: "Instructions")
            ScrollView {
                Text(selectedRecipe.strInstructions)
                    .padding()
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(selectedRecipe: Recipe())
    }
}
