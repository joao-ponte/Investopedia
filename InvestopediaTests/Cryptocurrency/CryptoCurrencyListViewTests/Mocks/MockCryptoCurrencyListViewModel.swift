//
//  MockCryptoCurrencyListViewModel.swift
//  InvestopediaTests
//
//  Created by João Ponte on 13/09/2023.
//

import Foundation
@testable import Investopedia

class MockCryptoCurrencyListViewModel: CryptoCurrencyListViewModelProtocol {
    var cryptoCurrencies: [CryptoCurrency] = []
    var filteredCryptoCurrencies: [CryptoCurrency] = []
    
    func fetchData(completion: @escaping () -> Void) {
        // Mock implementation for testing
        let mockCryptos = [
            CryptoCurrency(id: "1", rank: "1", symbol: "BTC", name: "Bitcoin", supply: "1", maxSupply: "1", marketCapUsd: "1", volumeUsd24Hr: "1", priceUsd: "50000", changePercent24Hr: "1", vwap24Hr: "1", explorer: "1"),
            CryptoCurrency(id: "2", rank: "2", symbol: "ETH", name: "Ethereum", supply: "1", maxSupply: "1", marketCapUsd: "1", volumeUsd24Hr: "1", priceUsd: "3000", changePercent24Hr: "1", vwap24Hr: "1", explorer: "1")
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
