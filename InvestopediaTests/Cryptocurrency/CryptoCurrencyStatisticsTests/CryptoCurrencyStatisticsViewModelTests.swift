//
//  CryptoCurrencyStatisticsViewModelTests.swift
//  InvestopediaTests
//
//  Created by João Ponte on 20/09/2023.
//

import XCTest
@testable import Investopedia

class CryptoCurrencyStatisticsViewModelTests: XCTestCase {
    var viewModel: CryptoCurrencyStatisticsViewModel!
    var database: DatabaseMock!
    var networkManager: NetworkManagerMock!
    
    override func setUp() {
        super.setUp()
        database = DatabaseMock()
        networkManager = NetworkManagerMock()
        viewModel = CryptoCurrencyStatisticsViewModel(database: database, networkManager: networkManager)
    }
    
    override func tearDown() {
        viewModel = nil
        database = nil
        networkManager = nil
        super.tearDown()
    }
    
    func testSetSelectedCrypto_givenCrypto_thenSelectedCryptoShouldBeSet() {
        // Given
        let crypto = CryptoCurrency(
            id: "1",
            rank: "1",
            symbol: "BTC",
            name: "Bitcoin",
            supply: "21000000",
            maxSupply: "21000000",
            marketCapUsd: "100000000",
            volumeUsd24Hr: "5000000",
            priceUsd: "50000",
            changePercent24Hr: "5",
            vwap24Hr: "51000",
            explorer: "example.com"
        )
        
        // When
        viewModel.setSelectedCrypto(crypto)
        
        // Then
        XCTAssertEqual(viewModel.selectedCrypto, crypto)
    }
    
    func testCoinTitleText_givenCryptoIsSet_whenGettingCoinTitleText_thenTitleTextShouldBeCorrect() {
        // Given
        let crypto = CryptoCurrency(
            id: "1",
            rank: "1",
            symbol: "BTC",
            name: "Bitcoin",
            supply: "21000000",
            maxSupply: "21000000",
            marketCapUsd: "100000000",
            volumeUsd24Hr: "5000000",
            priceUsd: "50000",
            changePercent24Hr: "5",
            vwap24Hr: "51000",
            explorer: "example.com"
        )
        viewModel.setSelectedCrypto(crypto)
        
        // When
        let coinTitle = viewModel.coinTitleText
        
        // Then
        XCTAssertEqual(coinTitle, "Bitcoin (BTC)")
    }
    
    func testCoinTitleText_givenNoCryptoIsSet_whenGettingCoinTitleText_thenTitleTextShouldBeNA() {
        // Given: No crypto is set, as this is the default state
        
        // When
        let coinTitle = viewModel.coinTitleText
        
        // Then
        XCTAssertEqual(coinTitle, "N/A")
    }
    
    func testFormattedUsdPrice_givenCryptoWithValidPrice_whenFormattingUsdPrice_thenFormattedPriceShouldBeCorrect() {
        // Given
        let crypto = CryptoCurrency(
            id: "1",
            rank: "1",
            symbol: "BTC",
            name: "Bitcoin",
            supply: "21000000",
            maxSupply: "21000000",
            marketCapUsd: "100000000",
            volumeUsd24Hr: "5000000",
            priceUsd: "50000",
            changePercent24Hr: "5",
            vwap24Hr: "51000",
            explorer: "example.com"
        )
        
        // When
        let formattedPrice = viewModel.formattedUsdPrice(for: crypto)
        
        // Then
        XCTAssertEqual(formattedPrice, "$50,000.00")
    }
    
    func testFormattedUsdPrice_givenCryptoWithZeroPrice_whenFormattingUsdPrice_thenFormattedPriceShouldBeCorrect() {
        // Given
        let crypto = CryptoCurrency(
            id: "1",
            rank: "1",
            symbol: "BTC",
            name: "Bitcoin",
            supply: "21000000",
            maxSupply: "21000000",
            marketCapUsd: "100000000",
            volumeUsd24Hr: "5000000",
            priceUsd: "1.00111238",
            changePercent24Hr: "5",
            vwap24Hr: "51000",
            explorer: "example.com"
        )
        
        // When
        let formattedPrice = viewModel.formattedUsdPrice(for: crypto)
        
        // Then
        XCTAssertEqual(formattedPrice, "$1.00111238")
    }
    
    func testFormattedMarketCap_givenCryptoWithValidMarketCap_whenFormattingMarketCap_thenFormattedMarketCapShouldBeCorrect() {
        // Given
        let crypto = CryptoCurrency(
            id: "1",
            rank: "1",
            symbol: "BTC",
            name: "Bitcoin",
            supply: "21000000",
            maxSupply: "21000000",
            marketCapUsd: "100000000",
            volumeUsd24Hr: "5000000",
            priceUsd: "50000",
            changePercent24Hr: "5",
            vwap24Hr: "51000",
            explorer: "example.com"
        )
        
        // When
        let formattedMarketCap = viewModel.formattedMarketCap(for: crypto)
        
        // Then
        XCTAssertEqual(formattedMarketCap, "$100,000,000")
    }
    
    func testFormattedSupply_givenCryptoWithValidSupply_whenFormattingSupply_thenFormattedSupplyShouldBeCorrect() {
        // Given
        let crypto = CryptoCurrency(
            id: "1",
            rank: "1",
            symbol: "BTC",
            name: "Bitcoin",
            supply: "21000000",
            maxSupply: "21000000",
            marketCapUsd: "100000000",
            volumeUsd24Hr: "5000000",
            priceUsd: "50000",
            changePercent24Hr: "5",
            vwap24Hr: "51000",
            explorer: "example.com"
        )
        
        // When
        let formattedSupply = viewModel.formattedSupply(for: crypto)
        
        // Then
        XCTAssertEqual(formattedSupply, "21,000,000")
    }
    
    func testFormattedVolume24Hr_givenCryptoWithValidVolume_whenFormattingVolume_thenFormattedVolumeShouldBeCorrect() {
        // Given
        let crypto = CryptoCurrency(
            id: "1",
            rank: "1",
            symbol: "BTC",
            name: "Bitcoin",
            supply: "21000000",
            maxSupply: "21000000",
            marketCapUsd: "100000000",
            volumeUsd24Hr: "5000000",
            priceUsd: "50000",
            changePercent24Hr: "5",
            vwap24Hr: "51000",
            explorer: "example.com"
        )
        
        // When
        let formattedVolume24Hr = viewModel.formattedVolume24Hr(for: crypto)
        
        // Then
        XCTAssertEqual(formattedVolume24Hr, "$5,000,000")
    }
    
    func testReloadData_givenNilDelegate_thenNoCrashShouldOccur() {
        // Given
        viewModel.delegate = nil
        
        // When
        viewModel.reloadData()
        
        // Then: No crash should occur
    }
}
