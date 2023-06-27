//
//  ListThumbnailSmall.swift
//  LimitChef
//
//  Created by Nigel Marks on 26.06.23.
//

import SwiftUI

struct ListThumbnailSmall: View {
    @State var url = "https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg"
    @State var name = "Teriyaki Chicken Casserole"
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: url))
            { image in image.resizable() } placeholder: { LimitChefColors.accents } .frame(width: 100, height: 100) .clipShape(RoundedRectangle(cornerRadius: 15))
            Text(name)
                .frame(width: 100)
                .multilineTextAlignment(.center)
                .foregroundColor(LimitChefColors.accents)
        }
    }
}

struct ListThumbnailSmall_Previews: PreviewProvider {
    static var previews: some View {
        ListThumbnailSmall()
    }
}
