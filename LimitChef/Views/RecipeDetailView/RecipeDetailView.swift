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
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 300, height: 50)
                        .foregroundColor(LimitChefColors.primary)
                    Text(detailViewModel.recipe.strMeal)
                        .foregroundColor(LimitChefColors.accents)
                        .fontWeight(.bold)
                }
            }.edgesIgnoringSafeArea(.top)
            ScrollView(.horizontal) {
                HStack {
                    ForEach( Util.getIngredientsAsList(recipe: detailViewModel.recipe), id: \.self) {ingredient in
                        ListThumbnailSmall(url: Util.getIngredientThumb(ingredient: ingredient), name: ingredient)
                    }
                }
            }
            HeaderView(headerText: "Instructions")
            ScrollView {
                Text(detailViewModel.recipe.strInstructions ?? "No Instructions found..")
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
