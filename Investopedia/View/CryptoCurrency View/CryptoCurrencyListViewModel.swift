//
//  CryptoCurrencyListViewModel.swift
//  Investopedia
//
//  Created by João Ponte on 02/09/2023.
//

import Foundation

final class CryptoCurrencyListViewModel: CryptoCurrencyListViewModelProtocol {
    
    private(set) var cryptoCurrencies: [CryptoCurrency] = []
    private let networkManager: NetworkManagerProtocol

    init(networkManager: NetworkManagerProtocol) {
        self.networkManager = networkManager
    }

    func fetchData(completion: @escaping () -> Void) {
        print("Fetching data from the API...")
        
        networkManager.request(APIEndpoint.cryptoCurrency, responseType: ResponseCryptos.self) { [weak self] result in
            switch result {
            case .success(let cryptos):
                self?.cryptoCurrencies = cryptos.data
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
