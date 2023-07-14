//
//  IngredientsScreen.swift
//  LimitChef
//
//  Created by Nigel Marks on 11.07.23.
//

import SwiftUI

struct IngredientsScreen: View {
    @StateObject var ingredientsViewModel = IngredientsViewModel()
    
    var body: some View {
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
                    Text("Ingredients")
                        .bold()
                        .listRowBackground(LimitChefColors.primary)
                }
                Section {
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
                }
                Section {
                    
                }
            }
            .background(LimitChefColors.secondary)
            .scrollContentBackground(.hidden)
        }
        .background(LimitChefColors.secondary)
    }
}

struct IngredientsScreen_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsScreen()
    }
}
