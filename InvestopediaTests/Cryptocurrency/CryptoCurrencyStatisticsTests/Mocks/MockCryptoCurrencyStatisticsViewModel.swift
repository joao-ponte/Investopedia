//
//  MockCryptoCurrencyStatisticsViewModel.swift
//  InvestopediaTests
//
//  Created by João Ponte on 20/09/2023.
//

import Foundation
@testable import Investopedia


class MockCryptoCurrencyStatisticsViewModel: CryptoCurrencyStatisticsViewModelProtocol {
    func toggleFavorite() {
        return
    }
    
    func fetchData() {
        return
    }
    
    func stopRefreshTimer() {
        return
    }
    
    func isFavorite(crypto: Investopedia.CryptoCurrency) -> Bool {
        return true
    }
    
    var selectedCrypto: CryptoCurrency?
    var delegate: CryptoCurrencyStatisticsViewModelDelegate?
    var coinTitleText: String = "MockCoinTitle"
    var formattedMarketCapResult: String = "MockMarketCap"
    var formattedUsdPriceResult: String = "MockUsdPrice"
    var formattedSupplyResult: String = "MockSupply"
    var formattedVolume24HrResult: String = "MockVolume24Hr"
    var formattedChange24HrResult: String = "MockChange24Hr"

    func setSelectedCrypto(_ crypto: CryptoCurrency?) {
        selectedCrypto = crypto
        delegate?.selectedCryptoDidChange()
    }

    func reloadData() {
        delegate?.reloadData()
    }

    func formattedMarketCap(for crypto: CryptoCurrency) -> String {
        return formattedMarketCapResult
    }

    func formattedUsdPrice(for crypto: CryptoCurrency) -> String {
        return formattedUsdPriceResult
    }

    func formattedSupply(for crypto: CryptoCurrency) -> String {
        return formattedSupplyResult
    }

    func formattedVolume24Hr(for crypto: CryptoCurrency) -> String {
        return formattedVolume24HrResult
    }

    func formattedChange24Hr(for crypto: CryptoCurrency) -> String {
        return formattedChange24HrResult
    }
}
