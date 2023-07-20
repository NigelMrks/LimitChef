//
//  HomeScreen.swift
//  LimitChef
//
//  Created by Nigel Marks on 26.06.23.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var homeViewModel: HomeViewModel = HomeViewModel()
    @StateObject var ingredientsViewModel: IngredientsViewModel = IngredientsViewModel()
    var body: some View {
        ZStack {
            Color(UIColor(LimitChefColors.secondary))
                .ignoresSafeArea()
            VStack {
                HeaderView(headerText: "Recommended for you")
                ScrollView(.horizontal) {
                    HStack(alignment: .top) {
                        ForEach(homeViewModel.randomRecipes, id: \.self) {recipe in
                            ListThumbnailSmall(url: recipe.strMealThumb, name: recipe.strMeal)
                        }
                    }
                }
                .padding(8)
                HeaderView(headerText: "Categories")
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(homeViewModel.categories, id: \.self) {category in
                            ListThumbnailSmall(url: category.strCategoryThumb, name: category.strCategory)
                        }
                    }
                }
                .padding(8)
                HeaderView(headerText: "Ingredients")
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(ingredientsViewModel.ingredients, id: \.self) {ingredient in
                            ListThumbnailSmall(url: ingredient.thumbnail ?? "error", name: ingredient.name ?? "error")
                        }
                    }
                }.onAppear{
                    print("APPEAR")
                    homeViewModel.getRandomRecipes()
                    homeViewModel.getCategories()
                    homeViewModel.getIngredients()
                }
                .padding(8)
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
