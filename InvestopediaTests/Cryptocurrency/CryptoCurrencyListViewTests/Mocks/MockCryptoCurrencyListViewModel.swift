//
//  MockCryptoCurrencyListViewModel.swift
//  InvestopediaTests
//
//  Created by João Ponte on 13/09/2023.
//

import Foundation
@testable import Investopedia

class MockCryptoCurrencyListViewModel: CryptoCurrencyListViewModelProtocol {
    func fetchData(completion: @escaping (Result<Void, Error>) -> Void) {
        return
    }
    
    var selectedCrypto: Investopedia.CryptoCurrency?
    var cryptoCurrencies: [CryptoCurrency] = []
    var filteredCryptoCurrencies: [CryptoCurrency] = []
    
    func setSelectedCrypto(_ crypto: Investopedia.CryptoCurrency) {
        self.selectedCrypto = crypto
    }

    func getSelectedCrypto() -> Investopedia.CryptoCurrency? {
        return self.selectedCrypto
    }

    func fetchData(completion: @escaping () -> Void) {
        let mockCryptos = [
            CryptoCurrency(id: "1", 
                           rank: "1",
                           symbol: "BTC",
                           name: "Bitcoin",
                           supply: "1",
                           maxSupply: "1",
                           marketCapUsd: "1",
                           volumeUsd24Hr: "1",
                           priceUsd: "50000",
                           changePercent24Hr: "1",
                           vwap24Hr: "1",
                           explorer: "1"),
            CryptoCurrency(id: "2", 
                           rank: "2",
                           symbol: "ETH",
                           name: "Ethereum",
                           supply: "1", 
                           maxSupply: "1",
                           marketCapUsd: "1",
                           volumeUsd24Hr: "1",
                           priceUsd: "3000",
                           changePercent24Hr: "1",
                           vwap24Hr: "1",
                           explorer: "1")
        ]
        
        cryptoCurrencies = mockCryptos
        filteredCryptoCurrencies = mockCryptos
        
        completion()
    }
    
    func updateFilteredCryptoCurrencies(with searchText: String) {
        // Mock implementation for testing
        filteredCryptoCurrencies = cryptoCurrencies.filter { crypto in
            let nameMatch = crypto.name.lowercased().contains(searchText.lowercased())
            let symbolMatch = crypto.symbol.lowercased().contains(searchText.lowercased())
            return nameMatch || symbolMatch
        }
    }
}
