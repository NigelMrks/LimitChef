//
//  ListThumbnail.swift
//  LimitChef
//
//  Created by Nigel Marks on 26.06.23.
//

import SwiftUI

struct ListThumbnail: View {
    @State var URL = "small"
    
    var body: some View {
        AsyncImage(url: URL(string: "https://i.imgur.com/OnVSzkl.png"))
            .frame(width: <#T##CGFloat?#>, height: <#T##CGFloat?#>)
    }
}

struct ListThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        ListThumbnail()
    }
}
