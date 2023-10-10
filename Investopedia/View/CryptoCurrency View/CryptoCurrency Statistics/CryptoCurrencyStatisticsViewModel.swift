//
//  CryptoCurrencyStatisticsViewModel.swift
//  Investopedia
//
//  Created by João Ponte on 18/09/2023.
//

import Foundation

// MARK: - CryptoCurrencyStatisticsViewModelDelegate

protocol CryptoCurrencyStatisticsViewModelDelegate: AnyObject {
    func selectedCryptoDidChange()
    func reloadData()
}

// MARK: - CryptoCurrencyStatisticsViewModel

class CryptoCurrencyStatisticsViewModel: CryptoCurrencyStatisticsViewModelProtocol {
    // MARK: - Properties
    
    private var _selectedCrypto: CryptoCurrency?
    private let database: Database
    private let networkManager: NetworkManagerProtocol
    private var refreshTimer: Timer?
    
    // MARK: - Initialization
    
    init(database: Database, networkManager: NetworkManagerProtocol) {
        self.database = database
        self.networkManager = networkManager
    }
    
    deinit {
        stopRefreshTimer()
    }
    
    // MARK: - Delegate
    
    weak var delegate: CryptoCurrencyStatisticsViewModelDelegate?
    
    // MARK: - Computed Properties
    
    var selectedCrypto: CryptoCurrency? {
        return _selectedCrypto
    }
    
    var coinTitleText: String {
        return selectedCrypto.map { "\($0.name) (\($0.symbol))" } ?? "N/A"
    }
    
    // MARK: - Public Methods
    
    func setSelectedCrypto(_ crypto: CryptoCurrency?) {
        _selectedCrypto = crypto
        delegate?.selectedCryptoDidChange()
    }
    
    func fetchData() {
        startRefreshTimer()
    }
    
    func reloadData() {
        delegate?.reloadData()
    }
    
    func toggleFavorite() {
        guard let selectedCrypto = selectedCrypto else { return }
        
        if isFavorite(crypto: selectedCrypto) {
            removeFavorite(crypto: selectedCrypto)
        } else {
            addFavorite(crypto: selectedCrypto)
        }
        
        delegate?.selectedCryptoDidChange()
    }
    
    // MARK: - Private Methods
    
    private func startRefreshTimer() {
        refreshTimer = Timer.scheduledTimer(timeInterval: 40, target: self, selector: #selector(fetchCryptoData), userInfo: nil, repeats: true)
    }
    
    @objc private func fetchCryptoData() {
        guard let crypto = selectedCrypto else { return }
        
        let endpoint = APIEndpoint.cryptoCurrency(withID: crypto.id)
        
        networkManager.request(endpoint, responseType: ResponseOneCrypto.self) { [weak self] result in
            switch result {
            case .success(let cryptoApiResponse):
                self?.handleCryptoDataResponse(cryptoApiResponse.data)
            case .failure(let error):
                print("Error fetching crypto data: \(error.localizedDescription)")
            }
        }
    }
    
    private func handleCryptoDataResponse(_ cryptoData: CryptoCurrency) {
        setSelectedCrypto(cryptoData)
        delegate?.reloadData()
    }
    
    internal func stopRefreshTimer() {
        refreshTimer?.invalidate()
        refreshTimer = nil
    }
    
    internal func isFavorite(crypto: CryptoCurrency) -> Bool {
        guard let favorites = database.getFavourites() else {
            print("Favorites array is nil.")
            return false
        }
        
        return favorites.contains { $0.id == crypto.id }
    }
    
    private func addFavorite(crypto: CryptoCurrency) {
        print("Adding \(crypto.name) to favorites.")
        database.addCryptoToFavorites(crypto: crypto)
    }
    
    private func removeFavorite(crypto: CryptoCurrency) {
        guard let cryptoEntity = findCryptoEntity(for: crypto) else { return }
        database.removeCryptoFromFavorites(crypto: cryptoEntity)
    }
    
    private func findCryptoEntity(for crypto: CryptoCurrency) -> CryptoCurrencyEntity? {
        return database.getFavourites()?.first { $0.id == crypto.id }
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
