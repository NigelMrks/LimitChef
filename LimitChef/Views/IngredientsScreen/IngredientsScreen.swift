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
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 300, height: 50)
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
                        .frame(width: 180, alignment: .leading)
                        .tint(LimitChefColors.accents)
                        .padding()
                    }
                    else {
                        Text("Loading...")
                    }
                    Button{
                        ingredientsViewModel.crud.addIngredient(ingredient: ingredientsViewModel.selectedIngredient)
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
                ForEach($ingredientsViewModel.crud.ingredients) { $ingredient in
                    HStack {
                        Text(ingredient.name ?? "error")
                    }
                }
                .onDelete(perform: ingredientsViewModel.crud.deleteIngredient)
                
            }
            
        }
        
        
    }
}

struct IngredientsScreen_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsScreen()
    }
}
