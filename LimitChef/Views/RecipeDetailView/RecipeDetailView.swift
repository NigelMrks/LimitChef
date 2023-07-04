//
//  RecipeDetailView.swift
//  LimitChef
//
//  Created by Nigel Marks on 03.07.23.
//

import SwiftUI

struct RecipeDetailView: View {
    var recID : String
    @ObservedObject var detailViewModel = DetailViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                AsyncImage(url: URL(string: detailViewModel.recipe.strMealThumb))
                { image in image.resizable() } placeholder: { LimitChefColors.accents }
                    .frame(height: 200)
                    .scaledToFit()
                HeaderView(headerText: detailViewModel.recipe.strMeal)
            }.edgesIgnoringSafeArea(.top)
            ScrollView(.horizontal) {
                HStack {
                    ForEach( detailViewModel.getIngredientsAsList(), id: \.self) {ingredient in
                        ListThumbnailSmall(url: detailViewModel.getIngredientThumb(ingredient: ingredient), name: ingredient)
                    }
                }
            }
            HeaderView(headerText: "Instructions")
            ScrollView {
                Text(detailViewModel.recipe.strInstructions)
                    .padding()
            }
        }.onAppear{
            print("APPEAR")
            detailViewModel.fetchRecipe(ID: recID)
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recID: "52772")
    }
}
