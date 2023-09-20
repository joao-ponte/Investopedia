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
    
    // MARK: - Delegate

    weak var delegate: CryptoCurrencyStatisticsViewModelDelegate?
    
    // MARK: - Computed Property

    var selectedCrypto: CryptoCurrency? {
        return _selectedCrypto
    }
    
    var coinTitleText: String {
        if let selectedCrypto = selectedCrypto {
            return "\(selectedCrypto.name) (\(selectedCrypto.symbol))"
        } else {
            return "N/A"
        }
    }
    // MARK: - Public Methods

    func setSelectedCrypto(_ crypto: CryptoCurrency?) {
        _selectedCrypto = crypto
        delegate?.selectedCryptoDidChange()
    }
    
    func reloadData() {
        delegate?.reloadData()
    }
}

// MARK: - Formatting Methods Extension
extension CryptoCurrencyStatisticsViewModel {
    func formattedUsdPrice(for crypto: CryptoCurrency) -> String {
        return PriceFormatter.formatUsdPrice(price: crypto.priceUsd)
    }
    
    func formattedMarketCap(for crypto: CryptoCurrency) -> String {
        return NumberFormatter.formatCurrency(crypto.marketCapUsd, decimalPlaces: 0)
    }
    
    func formattedSupply(for crypto: CryptoCurrency) -> String {
        return NumberFormatter.formatNumber(crypto.supply)
    }
    
    func formattedVolume24Hr(for crypto: CryptoCurrency) -> String {
        return NumberFormatter.formatCurrency(crypto.volumeUsd24Hr, decimalPlaces: 0)
    }
    
    func formattedChange24Hr(for crypto: CryptoCurrency) -> String {
        return NumberFormatter.formatPercentage(crypto.changePercent24Hr)
    }
}
