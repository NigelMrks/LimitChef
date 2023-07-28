//
//  ContentView.swift
//  LimitChef
//
//  Created by Nigel Marks on 22.06.23.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            IngredientsScreen()
                .tabItem {
                    Label("Ingredients", systemImage: "list.triangle")
                }
            FavoriteListView()
                .tabItem {
                    Label("Favorites", systemImage: "star.fill")
                }
        }
        .tint(.red)
        .onAppear {
            let tabBarApperance = UITabBarAppearance()
                tabBarApperance.configureWithOpaqueBackground()
                tabBarApperance.backgroundColor = UIColor(LimitChefColors.primary)
                UITabBar.appearance().scrollEdgeAppearance = tabBarApperance
                UITabBar.appearance().standardAppearance = tabBarApperance
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
