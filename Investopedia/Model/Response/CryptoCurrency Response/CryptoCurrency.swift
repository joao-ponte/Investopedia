//
//  CryptoCurrency.swift
//  Investopedia
//
//  Created by João Ponte on 02/09/2023.
//

import Foundation

struct CryptoCurrency: Codable {
    let id: String
    let rank: String
    let symbol: String
    let name: String
    let supply: String?
    let maxSupply: String?
    let marketCapUsd: String?
    let volumeUsd24Hr: String?
    let priceUsd: String
    let changePercent24Hr: String?
    let vwap24Hr: String?
    let explorer: String?
    
    init?(entity: CryptoCurrencyEntity) {
        guard let id = entity.id,
              let rank = entity.rank,
              let symbol = entity.symbol,
              let name = entity.name,
              let priceUsd = entity.priceUsd else {
            return nil
        }

        self.id = id
        self.rank = rank
        self.symbol = symbol
        self.name = name
        self.supply = entity.supply
        self.maxSupply = entity.maxSupply
        self.marketCapUsd = entity.marketCapUsd
        self.volumeUsd24Hr = entity.volumeUsd24Hr
        self.priceUsd = priceUsd
        self.changePercent24Hr = entity.changePercent24Hr
        self.vwap24Hr = entity.vwap24Hr
        self.explorer = entity.explorer
    }
}

struct ResponseCryptos: Codable {
    let data: [CryptoCurrency]
}
