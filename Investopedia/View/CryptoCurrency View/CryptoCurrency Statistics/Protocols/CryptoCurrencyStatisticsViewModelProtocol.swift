//
//  CryptoCurrencyStatisticsViewModelProtocol.swift
//  Investopedia
//
//  Created by João Ponte on 18/09/2023.
//

import Foundation

protocol CryptoCurrencyStatisticsViewModelProtocol {
    var selectedCrypto: CryptoCurrency? { get }
    func setSelectedCrypto(_ crypto: CryptoCurrency?)
    func reloadData()
    var delegate: CryptoCurrencyStatisticsViewModelDelegate? { get set }
    var coinTitleText: String { get }
    
    func formattedMarketCap(for crypto: CryptoCurrency) -> String
    func formattedUsdPrice(for crypto: CryptoCurrency) -> String
    func formattedSupply(for crypto: CryptoCurrency) -> String
    func formattedVolume24Hr(for crypto: CryptoCurrency) -> String
    func formattedChange24Hr(for crypto: CryptoCurrency) -> String
    func toggleFavorite()
    func isFavorite(crypto: CryptoCurrency) -> Bool
}
