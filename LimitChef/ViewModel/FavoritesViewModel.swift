//
//  FavoritesViewModel.swift
//  LimitChef
//
//  Created by Nigel Marks on 21.07.23.
//

import Foundation

class FavoritesViewModel : ObservableObject {
    var crud = CRUDService()
    var favorites: [Favorite]
    
    init() {
        self.favorites = crud.favorites
    }
}
