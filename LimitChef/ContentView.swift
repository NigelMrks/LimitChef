//
//  ContentView.swift
//  LimitChef
//
//  Created by Nigel Marks on 22.06.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = MainViewModel()
    @State var bool = true
    var body: some View {
        RecipeDetailView(recID: "52918" )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
