//
//  CryptoCurrencyListViewModelTests.swift
//  InvestopediaTests
//
//  Created by João Ponte on 13/09/2023.
//

import XCTest
@testable import Investopedia

class CryptoCurrencyListViewModelTests: XCTestCase {
    
    var viewModel: CryptoCurrencyListViewModel!
    var mockNetworkManager: MockNetworkManager?
    var mockNetworkUtility: NetworkUtility?
    
    override func setUp() {
        super.setUp()
        
        // Create a mock network manager for testing
        mockNetworkManager = MockNetworkManager()
        mockNetworkUtility = NetworkUtility()
        
        // Initialize the view model with the mock network manager
        viewModel = CryptoCurrencyListViewModel(networkManager: mockNetworkManager!, networkUtility: mockNetworkUtility!)
    }
    
    override func tearDown() {
        super.tearDown()
        
        viewModel = nil
        mockNetworkManager = nil
        mockNetworkUtility = nil
    }
    
    
    // MARK: - Test fetchData
    
    func testFetchData_Success() {
        // Given
        let expectation = XCTestExpectation(description: "Fetch data should succeed")
        let mockCryptos = [CryptoCurrency(id: "1", rank: "1", symbol: "BTC", name: "Bitcoin", supply: "1", maxSupply: "1", marketCapUsd: "1", volumeUsd24Hr: "1", priceUsd: "50000", changePercent24Hr: "1", vwap24Hr: "1", explorer: "1")]
        let mockResponse = ResponseCryptos(data: mockCryptos)
        
        if let mockManager = mockNetworkManager {
            mockManager.mockResponse = .success(mockResponse)
            
            // When
            viewModel.fetchData {
                // Then
                XCTAssertEqual(self.viewModel.cryptoCurrencies.count, 1)
                XCTAssertEqual(self.viewModel.filteredCryptoCurrencies.count, 1)
                XCTAssertEqual(self.viewModel.filteredCryptoCurrencies[0].name, "Bitcoin")
                XCTAssertEqual(self.viewModel.filteredCryptoCurrencies[0].symbol, "BTC")
                XCTAssertEqual(self.viewModel.filteredCryptoCurrencies[0].priceUsd, "50000")
                
                expectation.fulfill()
            }
        } else {
            XCTFail("Mock network manager is nil")
        }
        
        wait(for: [expectation], timeout: 1.0)
    }

    func testFetchData_Failure() {
        // Given
        let expectation = XCTestExpectation(description: "Fetch data should fail")
        let mockError = NSError(domain: "TestErrorDomain", code: 123, userInfo: nil)
        
        if let mockManager = mockNetworkManager {
            mockManager.mockResponse = .failure(mockError)
            
            // When
            viewModel.fetchData {
                // Then
                XCTAssertTrue(self.viewModel.cryptoCurrencies.isEmpty)
                XCTAssertTrue(self.viewModel.filteredCryptoCurrencies.isEmpty)
                
                expectation.fulfill()
            }
        } else {
            XCTFail("Mock network manager is nil")
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testFetchData_EmptyData() {
        // Given
        let expectation = XCTestExpectation(description: "Fetch data with empty response")
        let mockResponse = ResponseCryptos(data: [])
        
        if let mockManager = mockNetworkManager {
            mockManager.mockResponse = .success(mockResponse)
            
            // When
            viewModel.fetchData {
                // Then
                XCTAssertTrue(self.viewModel.cryptoCurrencies.isEmpty)
                XCTAssertTrue(self.viewModel.filteredCryptoCurrencies.isEmpty)
                
                expectation.fulfill()
            }
        } else {
            XCTFail("Mock network manager is nil")
        }
        
        wait(for: [expectation], timeout: 1.0)
    }
}
