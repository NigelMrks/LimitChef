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
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            LimitChefColors.secondary
                .edgesIgnoringSafeArea(.all)
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
                        HStack {
                            Text(detailViewModel.recipe.strMeal)
                                .foregroundColor(LimitChefColors.accents)
                                .fontWeight(.bold)
                            Button {
                                detailViewModel.toggleFavorite()
                            } label: {
                                Image(systemName: detailViewModel.isFavorite ? "heart.fill" : "heart")
                                    .font(.system(size: 32))
                                    .tint(.red)
                            }
                        }
                    }
                }
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Label("Back", systemImage: "chevron.left")
                    }
                    .padding(.leading, 32)
                    Spacer()
                }
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
            }
            .padding(2)
            .edgesIgnoringSafeArea(.top)
            .onAppear{
                print("APPEAR")
                detailViewModel.fetchRecipe(ID: recID)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(recID: "52772")
    }
}
