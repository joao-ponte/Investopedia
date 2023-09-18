//
//  CryptoCurrencyStatisticsViewModelProtocol.swift
//  Investopedia
//
//  Created by João Ponte on 18/09/2023.
//

import Foundation

protocol CryptoCurrencyStatisticsViewModelProtocol {
    var selectedCrypto: CryptoCurrency? { get }
    func setSelectedCrypto(_ crypto: CryptoCurrency)
    func reloadData()
    var delegate: CryptoCurrencyStatisticsViewModelDelegate? { get set }
}
