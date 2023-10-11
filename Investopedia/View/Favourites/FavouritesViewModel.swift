//
//  FavouritesViewModel.swift
//  Investopedia
//
//  Created by João Ponte on 04/10/2023.
//

import Foundation

class FavouritesViewModel: FavouritesViewModelProtocol {
    
    // MARK: - Properties
    private let database: Database
    private var favourites: [CryptoCurrencyEntity]?
    
    // MARK: - Computed Properties
    var favoriteCryptoCurrencies: [CryptoCurrencyEntity]? {
        return favourites
    }

    // MARK: - Initialization
    init(database: Database) {
        self.database = database
        updateFavourites()
    }

    // MARK: - Public Methods
    func updateFavourites() {
        favourites = database.getFavourites()?.sorted { $0.rank ?? "0" < $1.rank ?? "0" }
    }
    
    var favouriteCryptoCurrencies: [CryptoCurrencyEntity]? {
        return favourites
    }
}
