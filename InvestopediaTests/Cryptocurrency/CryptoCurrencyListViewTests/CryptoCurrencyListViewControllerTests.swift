//
//  CryptoCurrencyListViewControllerTests.swift
//  InvestopediaTests
//
//  Created by João Ponte on 13/09/2023.
//

import XCTest
@testable import Investopedia

class CryptoCurrencyListViewControllerTests: XCTestCase {
    
    var viewController: CryptoCurrencyListViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Replace with your storyboard name
        viewController = storyboard.instantiateViewController(withIdentifier: "CryptoCurrencyListViewController") as? CryptoCurrencyListViewController
        
        viewController.loadViewIfNeeded()
    }
    
    override func tearDown() {
        super.tearDown()
        viewController = nil
    }
    
    // MARK: - Test ViewController Initialization and Setup
    
    func testViewControllerNotNil() {
        XCTAssertNotNil(viewController, "View controller should not be nil")
    }
    
    func testUIComponentsConnected() {
        XCTAssertNotNil(viewController.tableView, "Table view should be connected")
        XCTAssertNotNil(viewController.searchBar, "Search bar should be connected")
        XCTAssertNotNil(viewController.wordNotFoundImage, "Word not found image should be connected")
    }
    
    // MARK: - Test UITableViewDataSource
    
    func testNumberOfRowsInSection() {
        let viewModelMock = MockCryptoCurrencyListViewModel()
        viewModelMock.filteredCryptoCurrencies = [
            CryptoCurrency(id: "1", rank: "1", symbol: "BTC", name: "Bitcoin", supply: "1", maxSupply: "1", marketCapUsd: "1", volumeUsd24Hr: "1", priceUsd: "50000", changePercent24Hr: "1", vwap24Hr: "1", explorer: "1"),
            CryptoCurrency(id: "2", rank: "2", symbol: "ETH", name: "Ethereum", supply: "1", maxSupply: "1", marketCapUsd: "1", volumeUsd24Hr: "1", priceUsd: "3000", changePercent24Hr: "1", vwap24Hr: "1", explorer: "1")
        ]
        viewController.viewModel = viewModelMock
        
        let numberOfRowsInSection = viewController.tableView(viewController.tableView, numberOfRowsInSection: 0)
        
        XCTAssertEqual(numberOfRowsInSection, 2, "Number of rows should match the count of filtered crypto currencies")
    }
    
    func testCellForRowAt() {
        let viewModelMock = MockCryptoCurrencyListViewModel()
        viewModelMock.filteredCryptoCurrencies = [
            CryptoCurrency(id: "1", rank: "1", symbol: "BTC", name: "Bitcoin", supply: "1", maxSupply: "1", marketCapUsd: "1", volumeUsd24Hr: "1", priceUsd: "50000", changePercent24Hr: "1", vwap24Hr: "1", explorer: "1")
        ]
        viewController.viewModel = viewModelMock
        
        // Create a test table view
        let tableView = UITableView()
        tableView.register(CryptoCurrencyTableViewCell.self, forCellReuseIdentifier: "CryptoCurrencyCell")
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = viewController.tableView(tableView, cellForRowAt: indexPath) as? CryptoCurrencyTableViewCell
        
        XCTAssertNotNil(cell, "Cell should not be nil")
    }
}
