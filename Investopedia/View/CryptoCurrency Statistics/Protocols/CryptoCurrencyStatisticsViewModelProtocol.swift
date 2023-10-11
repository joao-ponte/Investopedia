//
//  CryptoCurrencyStatisticsViewModelProtocol.swift
//  Investopedia
//
//  Created by João Ponte on 18/09/2023.
//

import Foundation

protocol CryptoCurrencyStatisticsViewModelProtocol {
    // MARK: - Properties
    var selectedCrypto: CryptoCurrency? { get }
    var delegate: CryptoCurrencyStatisticsViewModelDelegate? { get set }
    var coinTitleText: String { get }

    // MARK: - Public Methods
    func setSelectedCrypto(_ crypto: CryptoCurrency?)
    func reloadData()
    func toggleFavorite()
    func fetchData()
    func stopRefreshTimer()

    // MARK: - Formatting Methods
    func formattedMarketCap(for crypto: CryptoCurrency) -> String
    func formattedUsdPrice(for crypto: CryptoCurrency) -> String
    func formattedSupply(for crypto: CryptoCurrency) -> String
    func formattedVolume24Hr(for crypto: CryptoCurrency) -> String
    func formattedChange24Hr(for crypto: CryptoCurrency) -> String

    // MARK: - Private Methods
    func isFavorite(crypto: CryptoCurrency) -> Bool
}
