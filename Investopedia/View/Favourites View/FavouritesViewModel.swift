//
//  FavouritesViewModel.swift
//  Investopedia
//
//  Created by João Ponte on 04/10/2023.
//

import Foundation

class FavouritesViewModel: FavouritesViewModelProtocol {
    
    private let database: Database
    
    var favouriteCryptoCurrencies: [CryptoCurrencyEntity]? {
        return database.getFavourites()
    }
    
    init(database: Database) {
            self.database = database
        }
}
