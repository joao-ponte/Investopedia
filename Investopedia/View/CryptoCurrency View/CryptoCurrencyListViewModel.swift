//
//  CryptoCurrencyListViewModel.swift
//  Investopedia
//
//  Created by João Ponte on 02/09/2023.
//

import Foundation

final class CryptoCurrencyListViewModel: CryptoCurrencyListViewModelProtocol {
    
    private(set) var cryptoCurrencies: [CryptoCurrency] = []
    
    private let apiClient: CoinCapAPI
    
    init(apiClient: CoinCapAPI) {
        self.apiClient = apiClient
    }
    
    func fetchData(completion: @escaping () -> Void) {
        apiClient.getCryptoCurrency { result in
            switch result {
            case .success(let cryptos):
                self.cryptoCurrencies = cryptos
                completion()
            case .failure(let error):
                print("Error fetching data: \(error)")
                completion()
            }
        }
    }
    
    func numberOfItems() -> Int {
        return cryptoCurrencies.count
    }
    
    func cryptoCurrency(atIndex index: Int) -> CryptoCurrency {
        return cryptoCurrencies[index]
    }
}
