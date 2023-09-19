//
//  CryptoCurrencyStatisticsViewModel.swift
//  Investopedia
//
//  Created by João Ponte on 18/09/2023.
//

import Foundation

protocol CryptoCurrencyStatisticsViewModelDelegate: AnyObject {
    func selectedCryptoDidChange()
    func reloadData()
}

class CryptoCurrencyStatisticsViewModel: CryptoCurrencyStatisticsViewModelProtocol {
    // MARK: - Properties
    private var _selectedCrypto: CryptoCurrency?
    weak var delegate: CryptoCurrencyStatisticsViewModelDelegate?
    
    // MARK: - CryptoCurrencyStatisticsViewModelProtocol
    var selectedCrypto: CryptoCurrency? {
        return _selectedCrypto
    }
    
    func setSelectedCrypto(_ crypto: CryptoCurrency) {
        _selectedCrypto = crypto
        delegate?.selectedCryptoDidChange()
    }
    
    func reloadData() {
        delegate?.reloadData()
    }
}
