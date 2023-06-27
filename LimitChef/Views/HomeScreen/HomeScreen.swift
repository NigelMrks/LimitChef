//
//  HomeScreen.swift
//  LimitChef
//
//  Created by Nigel Marks on 26.06.23.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var vm: MainViewModel = MainViewModel()
    var body: some View {
        ZStack {
            Color(UIColor(LimitChefColors.secondary))
                .ignoresSafeArea()
            VStack {
                HeaderView(headerText: "Recommended for you")
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(vm.recipeDummyList, id: \.self) {recipe in
                            ListThumbnailSmall(url: recipe.strMealtThumb, name: recipe.strMeal)
                        }
                    }
                }
                .padding(8)
                HeaderView(headerText: "Categories")
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(vm.categoryDummyList, id: \.self) {category in
                            ListThumbnailSmall(url: category.strCategoryThumb, name: category.strCategory)
                        }
                    }
                }
                .padding(8)
                HeaderView(headerText: "Ingredients")
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(vm.recipeDummyList, id: \.self) {recipe in
                            ListThumbnailSmall(url: recipe.strMealtThumb, name: recipe.strMeal)
                        }
                    }
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
