//
//  HeaderView.swift
//  LimitChef
//
//  Created by Nigel Marks on 26.06.23.
//

import SwiftUI


struct HeaderView: View {
    @State var headerText = "header.example"
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 300, height: 50)
                .foregroundColor(LimitChefColors.primary)
            Text(headerText)
                .foregroundColor(LimitChefColors.accents)
                .fontWeight(.bold)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
