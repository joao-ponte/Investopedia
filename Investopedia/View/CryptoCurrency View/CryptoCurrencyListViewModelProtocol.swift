//
//  CryptoCurrencyListViewModelProtocol.swift
//  Investopedia
//
//  Created by João Ponte on 11/09/2023.
//

import Foundation

protocol CryptoCurrencyListViewModelProtocol {
    func fetchData(completion: @escaping () -> Void)
    func numberOfItems() -> Int
    func cryptoCurrency(atIndex index: Int) -> CryptoCurrency
}
