//
//  FavouritesViewModel.swift
//  Investopedia
//
//  Created by João Ponte on 04/10/2023.
//

import Foundation

class FavouritesViewModel: FavouritesViewModelProtocol {
    private let database: Database
    private var favourites: [CryptoCurrencyEntity]?
    private var searchQuery: String = ""
    
    weak var delegate: FavouritesViewModelDelegate?

    var filteredCryptoCurrencies: [CryptoCurrencyEntity]? {
        guard let favourites = favourites else {
            return nil
        }

        if searchQuery.isEmpty {
            return favourites
        } else {
            let lowercaseQuery = searchQuery.lowercased()
            return favourites.filter { crypto in
                if let name = crypto.name?.lowercased(), let symbol = crypto.symbol?.lowercased() {
                    let nameMatch = name.contains(lowercaseQuery)
                    let symbolMatch = symbol.contains(lowercaseQuery)
                    return nameMatch || symbolMatch
                }
                return false
            }
        }
    }

    func updateFavourites() {
        favourites = database.getFavourites()?.sorted { $0.rank ?? "0" < $1.rank ?? "0" }
        delegate?.filteredCryptoCurrenciesUpdated() // Notify delegate when favourites are updated
    }

    var favouriteCryptoCurrencies: [CryptoCurrencyEntity]? {
        return favourites
    }

    init(database: Database) {
        self.database = database
        updateFavourites()
    }
    
    func updateFilteredCryptoCurrencies(with searchText: String) {
        let trimmedSearchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        searchQuery = trimmedSearchText
        delegate?.filteredCryptoCurrenciesUpdated() // Notify delegate when the search query is updated
        print("Filtered crypto currencies updated")

    }
}

