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
    private var searchQuery: String = ""
    
    // MARK: - Delegate
    weak var delegate: FavouritesViewModelDelegate?

    // MARK: - Computed Properties
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

    // MARK: - Initialization
    init(database: Database) {
        self.database = database
        updateFavourites()
    }

    // MARK: - Public Methods
    func updateFavourites() {
        favourites = database.getFavourites()?.sorted { $0.rank ?? "0" < $1.rank ?? "0" }
        delegate?.filteredCryptoCurrenciesUpdated()
    }

    func updateFilteredCryptoCurrencies(with searchText: String) {
        let trimmedSearchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        searchQuery = trimmedSearchText
        delegate?.filteredCryptoCurrenciesUpdated()
        print("Filtered crypto currencies updated")
    }
    
    var favouriteCryptoCurrencies: [CryptoCurrencyEntity]? {
        return favourites
    }
}
