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
    private let database: Database
    
    init(database: Database) {
        self.database = database
    }
    
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
    
    func toggleFavorite() {
        guard let selectedCrypto = selectedCrypto else { return }
        
        if isFavorite(crypto: selectedCrypto) {
            if let cryptoEntity = findCryptoEntity(for: selectedCrypto) {
                database.removeCryptoFromFavorites(crypto: cryptoEntity)
            }
        } else {
            print("Adding \(selectedCrypto.name) to favorites.")
            database.addCryptoToFavorites(crypto: selectedCrypto)
        }
        
        delegate?.selectedCryptoDidChange()
    }

    private func findCryptoEntity(for crypto: CryptoCurrency) -> CryptoCurrencyEntity? {
        guard let favorites = database.getFavourites() else {
            return nil
        }
        
        return favorites.first { $0.id == crypto.id }
    }

    func isFavorite(crypto: CryptoCurrency) -> Bool {
        guard let favorites = database.getFavourites() else {
            print("Favorites array is nil.")
            return false
        }

        let isFavorite = favorites.contains { $0.id == crypto.id }

        if isFavorite {
            print("\(crypto.name) is a favorite.")
        } else {
            print("\(crypto.name) is not a favorite.")
        }

        return isFavorite
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
