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
    let supply: String
    let maxSupply: String?
    let marketCapUsd: String
    let volumeUsd24Hr: String
    let priceUsd: String
    let changePercent24Hr: String
    let vwap24Hr: String
    let explorer: String?
}

struct ResponseCryptos: Codable {
    let data: [CryptoCurrency]
}
