//
//  CryptoCurrencyStatisticsViewControllerTests.swift
//  InvestopediaTests
//
//  Created by João Ponte on 20/09/2023.
//

import XCTest
@testable import Investopedia

class CryptoCurrencyStatisticsViewControllerTests: XCTestCase {
    var viewController: CryptoCurrencyStatisticsViewController!
    var viewModel: MockCryptoCurrencyStatisticsViewModel!

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "CryptoCurrencyStatisticsViewController") as? CryptoCurrencyStatisticsViewController
        viewModel = MockCryptoCurrencyStatisticsViewModel()
        viewController.viewModel = viewModel
        viewController.loadViewIfNeeded()
    }

    override func tearDown() {
        viewController = nil
        viewModel = nil
        super.tearDown()
    }

    func testViewDidLoad_setupTableView() {
        // Given
        let tableView = viewController.tableView

        // When
        viewController.viewDidLoad()

        // Then
        XCTAssertNotNil(tableView?.dataSource)
    }

    func testViewDidLoad_viewModelDelegateSet() {
        // When
        viewController.viewDidLoad()

        // Then
        XCTAssertNotNil(viewModel.delegate)
    }

    func testViewDidLoad_updateUI() {
        // Given
        let coinTitle = viewController.coinTitle

        // When
        viewController.viewDidLoad()

        // Then
        XCTAssertEqual(coinTitle?.text, "MockCoinTitle")
    }

    func testTableViewDataSource_numberOfRowsInSection() {
        // Given
        viewModel.selectedCrypto = CryptoCurrency(id: "1", rank: "1", symbol: "BTC", name: "Bitcoin", supply: "21000000", maxSupply: "21000000", marketCapUsd: "100000000", volumeUsd24Hr: "5000000", priceUsd: "50000", changePercent24Hr: "5", vwap24Hr: "51000", explorer: "example.com")

        // When
        let rows = viewController.tableView(viewController.tableView, numberOfRowsInSection: 0)

        // Then
        XCTAssertEqual(rows, 6)
    }

    // Helper method to configure and present the view controller
    private func configureViewController() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
