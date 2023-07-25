//
//  IngredientsScreen.swift
//  LimitChef
//
//  Created by Nigel Marks on 11.07.23.
//

import SwiftUI

struct IngredientsScreen: View {
    @StateObject var ingredientsViewModel = IngredientsViewModel()
    @AppStorage(AppStorageKeys.VARIANCE) var varianceSlider: Double = 0.0
    @State var help: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    LimitChefColors.secondary
                        .ignoresSafeArea(.all)
                        .frame(height: 50)
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 320, height: 50)
                        .foregroundColor(LimitChefColors.primary)
                    HStack {
                        if (!ingredientsViewModel.ingredientsAll.isEmpty) {
                            Picker("Choose..", selection: $ingredientsViewModel.selectedIngredient) {
                                ForEach(ingredientsViewModel.ingredientsAll, id: \.self) { value in
                                    Text(value.strIngredient).tag(value)
                                }
                            }
                            .onChange(of: ingredientsViewModel.selectedIngredient) {value in
                                print("\(value)")
                            }
                            .frame(width: 200, alignment: .leading)
                            .tint(LimitChefColors.accents)
                            .padding()
                        }
                        else {
                            Text("Loading...")
                        }
                        Button{
                            ingredientsViewModel.addIngredient(ingredient: ingredientsViewModel.selectedIngredient)
                        } label: {
                            Text("ADD")
                                .font(.title)
                                .bold()
                        }
                        .frame(width: 100)
                        .foregroundColor(LimitChefColors.secondary)
                    }
                }
                List {
                    Section {
                        Text("Stocked Ingredients")
                            .bold()
                            .listRowBackground(LimitChefColors.primary)
                        ForEach($ingredientsViewModel.ingredients) { $ingredient in
                            HStack {
                                Text(ingredient.name ?? "error")
                                    .foregroundColor(LimitChefColors.accents)
                            }
                            .listRowBackground(LimitChefColors.primary)
                        }
                        .onDelete(perform: ingredientsViewModel.deleteIngredient)
                    }
                    Section {
                        Text("Search")
                            .bold()
                            .listRowBackground(LimitChefColors.primary)
                        HStack{
                            Text("Ingredient Variance")
                                .foregroundColor(LimitChefColors.accents)
                            Spacer()
                            Button(help ? "CLOSE":"HELP") {
                                help.toggle()
                            }
                            .foregroundColor(LimitChefColors.primary)
                        }
                        .listRowBackground(LimitChefColors.secondary)
                        .padding(.horizontal, -16)
                        if (help) {
                            Text("With the Variance setting you can set how many ingredients recipes are allowed to contain that you currently have not stocked.")
                                .foregroundColor(LimitChefColors.accents)
                                .listRowBackground(LimitChefColors.primary)
                        }
                        HStack {
                            Text("\(Int(varianceSlider))")
                                .foregroundColor(LimitChefColors.accents)
                            Slider(value: $varianceSlider, in: 0...10, step: 1)
                                .accentColor(LimitChefColors.secondary)
                                .listRowBackground(LimitChefColors.primary)
                                .frame(width: 250)
                            NavigationLink(destination: RecipeSearch(searchViewModel: SearchViewModel(searchBy: .ingredientList))) {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(LimitChefColors.secondary)
                            }
                        }
                        .listRowBackground(LimitChefColors.primary)
                    }
                }
                .background(LimitChefColors.secondary)
                .scrollContentBackground(.hidden)
            }
            .background(LimitChefColors.secondary)
        }
    }
}

struct IngredientsScreen_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsScreen()
    }
}
