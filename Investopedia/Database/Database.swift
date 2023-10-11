//
//  Database.swift
//  Investopedia
//
//  Created by João Ponte on 15/09/2023.
//

import Foundation

protocol Database {
    func addCryptoToFavorites(crypto: CryptoCurrency)
    func getFavourites() -> [CryptoCurrencyEntity]?
    func removeCryptoFromFavorites(crypto: CryptoCurrencyEntity)
    func updateCoreData(with cryptoData: CryptoCurrency)
}
