//
//  CryptoCurrencyListViewModelProtocol.swift
//  Investopedia
//
//  Created by João Ponte on 11/09/2023.
//

import Foundation

protocol CryptoCurrencyListViewModelProtocol {
    // MARK: - Data Fetching
    func fetchData(completion: @escaping () -> Void)
    
    // MARK: - Properties
    var cryptoCurrencies: [CryptoCurrency] { get }
    var filteredCryptoCurrencies: [CryptoCurrency] { get }
    
    // MARK: - Filtering
    func updateFilteredCryptoCurrencies(with searchText: String)
}
