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
    private var _selectedCrypto: CryptoCurrency?
    weak var delegate: CryptoCurrencyStatisticsViewModelDelegate?
    
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

// MARK: - Formatter Helper Classes
class PriceFormatter {
    static func formatUsdPrice(price: String) -> String {
        guard let priceUsd = Double(price) else {
            return "N/A"
        }
        
        switch priceUsd {
        case 0..<1.01:
            return NumberFormatter.formatCurrency(priceUsd, decimalPlaces: 8)
        case 1.01..<100:
            return NumberFormatter.formatCurrency(priceUsd, decimalPlaces: 4)
        default:
            return NumberFormatter.formatCurrency(priceUsd, decimalPlaces: 2)
        }
    }
}

class NumberFormatter {
    static func formatCurrency(_ value: String?, decimalPlaces: Int) -> String {
        guard let value = value, let doubleValue = Double(value) else {
            return "N/A"
        }
        return formatCurrency(doubleValue, decimalPlaces: decimalPlaces)
    }
    
    static func formatCurrency(_ value: Double, decimalPlaces: Int) -> String {
        let numberFormatter = Foundation.NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US")
        numberFormatter.numberStyle = .currency
        numberFormatter.minimumFractionDigits = decimalPlaces
        numberFormatter.maximumFractionDigits = decimalPlaces

        return numberFormatter.string(from: NSNumber(value: value)) ?? "N/A"
    }
    
    static func formatNumber(_ value: String?) -> String {
        guard let value = value, let doubleValue = Double(value) else {
            return "N/A"
        }
        return formatNumber(doubleValue)
    }
    
    static func formatNumber(_ value: Double) -> String {
        let numberFormatter = Foundation.NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US")
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 0
        
        return numberFormatter.string(from: NSNumber(value: value)) ?? "N/A"
    }
    
    static func formatPercentage(_ value: String?) -> String {
        guard let value = value, let doubleValue = Double(value) else {
            return "N/A"
        }
        return formatPercentage(doubleValue)
    }
    
    static func formatPercentage(_ value: Double) -> String {
        let adjustedValue = value / 100.0
        
        let numberFormatter = Foundation.NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US")
        numberFormatter.numberStyle = .percent
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        
        return numberFormatter.string(from: NSNumber(value: adjustedValue)) ?? "N/A"
    }
}
