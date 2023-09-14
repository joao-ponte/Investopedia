//
//  CryptoCurrencyListViewModel.swift
//  Investopedia
//
//  Created by João Ponte on 02/09/2023.
//

import Foundation

protocol CryptoCurrencyListViewModelDelegate: AnyObject {
    func filteredCryptoCurrenciesUpdated()
}

final class CryptoCurrencyListViewModel {
    
    // MARK: - Properties
    
    private(set) var cryptoCurrencies: [CryptoCurrency] = []
    private let networkManager: NetworkManagerProtocol
    private let networkUtility: NetworkUtilityProtocol
    private var searchQuery: String = ""
    
    // MARK: - Delegate
    
    weak var delegate: CryptoCurrencyListViewModelDelegate?
    
    // MARK: - Computed Property
    
    var filteredCryptoCurrencies: [CryptoCurrency] {
        if searchQuery.isEmpty {
            return cryptoCurrencies
        } else {
            let lowercaseQuery = searchQuery.lowercased()
            return cryptoCurrencies.filter { crypto in
                let nameMatch = crypto.name.lowercased().contains(lowercaseQuery)
                let symbolMatch = crypto.symbol.lowercased().contains(lowercaseQuery)
                return nameMatch || symbolMatch
            }
        }
    }
    
    // MARK: - Initialization
     
     init(networkManager: NetworkManagerProtocol, networkUtility: NetworkUtilityProtocol) {
         self.networkManager = networkManager
         self.networkUtility = networkUtility
     }
     
     // MARK: - Public Methods
     
     func checkNetworkConnection() -> Bool {
         return networkUtility.hasNetworkConnection()
     }
 }

// MARK: - CryptoCurrencyListViewModelProtocol

extension CryptoCurrencyListViewModel: CryptoCurrencyListViewModelProtocol {
    
    func fetchData(completion: @escaping () -> Void) {
        print("Fetching data from the API...")
        networkManager.request(APIEndpoint.cryptoCurrency,
                               responseType: ResponseCryptos.self) { [weak self] result in
            switch result {
            case .success(let cryptos):
                self?.updateCryptoCurrencies(with: cryptos.data)
                completion()
                
            case .failure(let error):
                self?.handleError(error)
                completion()
            }
        }
    }
    
    func updateFilteredCryptoCurrencies(with searchText: String) {
        let trimmedSearchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        searchQuery = trimmedSearchText
        delegate?.filteredCryptoCurrenciesUpdated()
    }
}

// MARK: - Private Helper Methods

private extension CryptoCurrencyListViewModel {
    
    func updateCryptoCurrencies(with data: [CryptoCurrency]) {
        cryptoCurrencies = data
        delegate?.filteredCryptoCurrenciesUpdated()
    }
    
    func handleError(_ error: Error) {
        print("Error fetching data: \(error)")
    }
}
