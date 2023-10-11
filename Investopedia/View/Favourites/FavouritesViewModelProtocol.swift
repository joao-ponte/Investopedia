//
//  FavouritesViewModelProtocol.swift
//  Investopedia
//
//  Created by João Ponte on 04/10/2023.
//

import Foundation

protocol FavouritesViewModelProtocol {

    var favoriteCryptoCurrencies: [CryptoCurrencyEntity]? { get }
    var favouriteCryptoCurrencies: [CryptoCurrencyEntity]? { get }
    func updateFavourites()
}
