///
/// CryptoCurrencyListViewModelTests.swift
/// InvestopediaTests
///
/// Created by João Ponte on 13/09/2023.
///

import XCTest
@testable import Investopedia

class CryptoCurrencyListViewModelTests: XCTestCase {
    var viewModel: CryptoCurrencyListViewModel!
    var networkManagerMock: NetworkManagerMock!
    var networkUtilityMock: NetworkUtilityMock!
    var delegateMock: CryptoCurrencyListViewModelDelegateMock!
    
    let crypto1 = CryptoCurrency(id: "1",
                                 rank: "1",
                                 symbol: "BTC",
                                 name: "Bitcoin",
                                 supply: "18743236",
                                 maxSupply: "21000000",
                                 marketCapUsd: "684572948216",
                                 volumeUsd24Hr: "48291680064",
                                 priceUsd: "36453.32",
                                 changePercent24Hr: "1.23",
                                 vwap24Hr: "36215.87",
                                 explorer: "btc-explorer")

    let crypto2 = CryptoCurrency(id: "2",
                                 rank: "2",
                                 symbol: "ETH",
                                 name: "Ethereum",
                                 supply: "117543236",
                                 maxSupply: nil,
                                 marketCapUsd: "362148592216",
                                 volumeUsd24Hr: "28916780064",
                                 priceUsd: "3053.65",
                                 changePercent24Hr: "2.65",
                                 vwap24Hr: "3015.87",
                                 explorer: "eth-explorer")

    
    override func setUp() {
        super.setUp()
        networkManagerMock = NetworkManagerMock()
        networkUtilityMock = NetworkUtilityMock()
        delegateMock = CryptoCurrencyListViewModelDelegateMock()
        viewModel = CryptoCurrencyListViewModel(networkManager: networkManagerMock, networkUtility: networkUtilityMock)
        viewModel.delegate = delegateMock
    }
    
    override func tearDown() {
        viewModel = nil
        networkManagerMock = nil
        networkUtilityMock = nil
        delegateMock = nil
        super.tearDown()
    }
    
    // MARK: - Tests for fetchData
    
    func testFetchData_Success() {
        // Given
        networkManagerMock.shouldSucceed = true
        
        // When
        viewModel.fetchData { result in
            // Then
            switch result {
            case .success:
                XCTAssertEqual(self.viewModel.cryptoCurrencies.count, 1)
            case .failure:
                XCTFail("Expected success, but got failure")
            }
        }
    }
    
    func testFetchData_Failure() {
        // Given
        networkManagerMock.shouldSucceed = false
        
        // When
        viewModel.fetchData { result in
            // Then
            switch result {
            case .success:
                XCTFail("Expected failure, but got success")
            case .failure:
                XCTAssert(true)
            }
        }
    }
    
    // MARK: - Tests for filteredCryptoCurrencies
    
    func testFilteredCryptoCurrencies_EmptySearchQuery() {
        // Given
        networkManagerMock.shouldSucceed = true
        
        // When
        viewModel.fetchData { result in
            // Then
            switch result {
            case .success:
                XCTAssertEqual(self.viewModel.filteredCryptoCurrencies.count, 1)
            case .failure:
                XCTFail("Expected success, but got failure")
            }
        }
    }

    func testFilteredCryptoCurrencies_NameMatch() {
        // Given
        networkManagerMock.shouldSucceed = true
        
        // When
        viewModel.fetchData { result in
            // Then
            switch result {
            case .success:
                XCTAssertEqual(self.viewModel.filteredCryptoCurrencies.count, 1)
                self.viewModel.updateFilteredCryptoCurrencies(with: "Bitcoin")
                XCTAssertEqual(self.viewModel.filteredCryptoCurrencies.count, 1)
                XCTAssertEqual(self.viewModel.filteredCryptoCurrencies.first?.name, "Bitcoin")
            case .failure:
                XCTFail("Expected success, but got failure")
            }
        }
    }
    // MARK: - Tests for updateFilteredCryptoCurrencies
    
    func testUpdateFilteredCryptoCurrencies() {
        // When
        viewModel.updateFilteredCryptoCurrencies(with: "Bitcoin")
        
        // Then
        XCTAssertTrue(delegateMock.filteredCryptoCurrenciesUpdatedCalled)
    }

    func testCheckNetworkConnection() {
        // Given
        networkUtilityMock.isConnected = true
        
        // When
        let isConnected = viewModel.checkNetworkConnection()
        
        // Then
        XCTAssertTrue(isConnected)
    }

    func testSetSelectedCrypto() {
        // Given
        networkManagerMock.shouldSucceed = true
        
        // When
        viewModel.fetchData { _ in
            self.viewModel.setSelectedCrypto(self.crypto1)
        }
        
        // Then
        XCTAssertEqual(viewModel.getSelectedCrypto(), crypto1)
    }

    func testGetSelectedCrypto() {
        // Given
        networkManagerMock.shouldSucceed = true
        
        // When
        viewModel.fetchData { _ in
            self.viewModel.setSelectedCrypto(self.crypto2)
            let selectedCrypto = self.viewModel.getSelectedCrypto()
            
            // Then
            XCTAssertEqual(selectedCrypto, self.crypto2)
        }
    }

    func testFilteredCryptoCurrencies_SpecialCharactersSearchQuery() {
        // Given
        networkManagerMock.shouldSucceed = true
        
        // When
        viewModel.fetchData { _ in
            self.viewModel.updateFilteredCryptoCurrencies(with: "!@#$%^&*")
            
            // Then
            XCTAssertEqual(self.viewModel.filteredCryptoCurrencies.count, 0)
        }
    }


}

