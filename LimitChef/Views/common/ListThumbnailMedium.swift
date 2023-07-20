//
//  ListThumbnailMedium.swift
//  LimitChef
//
//  Created by Nigel Marks on 26.06.23.
//

import SwiftUI

struct ListThumbnailMedium: View {
    @State var url: String = "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg"
    @State var name: String = "Teriyaki Chicken Casserole"
    @State var ingredients: [String] = ["Ingredient", "Ingredient", "Ingredient", "Ingredient", "Ingredient", "Ingredient", "Ingredient", "Ingredient", "Ingredient", "Ingredient"]
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: url))
            { image in image.resizable() } placeholder: { LimitChefColors.accents } .frame(width: 192, height: 192) .clipShape(RoundedRectangle(cornerRadius: 15))
            VStack {
                Text(name)
                    .frame(width: 184)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(LimitChefColors.accents)
                Text(Util.listAsString(list: ingredients))
                    .frame(width: 184)
                    .multilineTextAlignment(.center)
                    .foregroundColor(LimitChefColors.accents)
            }
            .frame(height: 192)
        }
    }
}

struct ListThumbnailMedium_Previews: PreviewProvider {
    static var previews: some View {
        ListThumbnailMedium()
    }
}
