//
//  FavoriteListView.swift
//  LimitChef
//
//  Created by Nigel Marks on 21.07.23.
//

import SwiftUI

struct FavoriteListView: View {
    @StateObject var favoritesViewModel = FavoritesViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                LimitChefColors.secondary
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    HeaderView(headerText: "Favorites")
                    List {
                        ForEach(favoritesViewModel.favorites, id: \.self) { favorite in
                            NavigationLink(value: favorite) {
                                ListThumbnailMedium(url: favorite.thumbnail ?? "error", name: favorite.name ?? "error", ingredients: favorite.ingredients ?? [String]())
                            }
                        }
                        .onDelete(perform: favoritesViewModel.crud.deleteFavorite)
                        .listRowBackground(LimitChefColors.primary)
                    }
                    .scrollContentBackground(.hidden)
                    .navigationDestination(for: Favorite.self) { favorite in
                        RecipeDetailView(recID: favorite.id ?? "error")
                    }
                }
            }
        }
    }
}

struct FavoriteListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteListView()
    }
}
