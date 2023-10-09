//
//  FavouritesViewModelProtocol.swift
//  Investopedia
//
//  Created by João Ponte on 04/10/2023.
//

import Foundation

protocol FavouritesViewModelDelegate: AnyObject {
    func filteredCryptoCurrenciesUpdated()
}

protocol FavouritesViewModelProtocol {
    var delegate: FavouritesViewModelDelegate? { get set }
    var filteredCryptoCurrencies: [CryptoCurrencyEntity]? { get }
    var favouriteCryptoCurrencies: [CryptoCurrencyEntity]? { get }
    func updateFavourites()
    func updateFilteredCryptoCurrencies(with searchText: String)
}
