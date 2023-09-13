//
//  CryptoCurrencyListViewModelProtocol.swift
//  Investopedia
//
//  Created by João Ponte on 11/09/2023.
//

import Foundation

protocol CryptoCurrencyListViewModelProtocol {
    func fetchData(completion: @escaping () -> Void)
    var cryptoCurrencies: [CryptoCurrency] { get }
    var filteredCryptoCurrencies: [CryptoCurrency] { get }
    func updateFilteredCryptoCurrencies(with searchText: String)
    func checkNetworkConnection() -> Bool
}
