//
//  DatabaseMock.swift
//  InvestopediaTests
//
//  Created by João Ponte on 28/10/2023.
//

import Foundation
@testable import Investopedia

class DatabaseMock: Database {
    var favorites: [CryptoCurrency]?
    
    func addCryptoToFavorites(crypto: CryptoCurrency) {
        if favorites == nil {
            favorites = [crypto]
        } else {
            favorites?.append(crypto)
        }
    }
    
    func getFavourites() -> [CryptoCurrencyEntity]? {
        if let favorites = favorites {
            let entities = favorites.map { crypto in
                let entity = CryptoCurrencyEntity()
                entity.id = crypto.id
                entity.rank = crypto.rank
                entity.symbol = crypto.symbol
                entity.name = crypto.name

                return entity
            }
            return entities
        }
        return nil
    }
    
    func removeCryptoFromFavorites(crypto: CryptoCurrencyEntity) {
        if let index = favorites?.firstIndex(where: { $0.id == crypto.id }) {
            favorites?.remove(at: index)
        }
    }
    
    func updateCoreData(with cryptoData: CryptoCurrency) {

    }
}
