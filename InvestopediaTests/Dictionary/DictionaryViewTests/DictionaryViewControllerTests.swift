//
//  DictionaryViewControllerTests.swift
//  InvestopediaTests
//
//  Created by João Ponte on 17/10/2023.
//

import XCTest
@testable import Investopedia

class DictionaryViewControllerTests: XCTestCase {
    
    var viewController: DictionaryViewController!
    var viewModelMock: DictionaryViewModelMock!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "DictionaryViewController") as? DictionaryViewController
        viewModelMock = DictionaryViewModelMock()
        viewController.viewModel = viewModelMock
        viewController.loadViewIfNeeded()
    }
    
    override func tearDown() {
        viewController = nil
        viewModelMock = nil
        super.tearDown()
    }
    
    func testViewDidLoad() {
        // Given
        let searchBarDelegate = viewController.searchBar.delegate

        // When
        viewController.viewDidLoad()

        // Then
        XCTAssertNotNil(searchBarDelegate)
    }
    
    func testSearchBarTextDidChangeUpdatesViewModel() {
        // Given
        let searchText = "Test Search"
        
        // When
        viewController.searchBar(UISearchBar(), textDidChange: searchText)
        
        // Then
        XCTAssertEqual(viewModelMock.searchText, searchText)
    }
    
    func testTableViewDataSource() {
        // Given
        let viewModelMock = DictionaryViewModelMock()
        viewController.viewModel = viewModelMock
        
        viewModelMock.sectionTitles = ["A", "B", "C"]
        viewModelMock.termsBySection = [
            "A": [FinancialTerm(id: 1, word: "Apple", meaning: "Apple definition", example: "Apple Example")],
            "B": [FinancialTerm(id: 2, word: "Banana", meaning: "Banana definition", example: "Banana Example")],
            "C": [FinancialTerm(id: 3, word: "Cherry", meaning: "Cherry definition", example: "Cherry Example")]
        ]
        
        // When
        let numberOfSections = viewController.numberOfSections(in: viewController.tableView)
        let numberOfRowsInFirstSection = viewController.tableView(viewController.tableView, numberOfRowsInSection: 0)
        
        // Then
        XCTAssertEqual(numberOfSections, viewModelMock.sectionTitles.count)
        XCTAssertEqual(numberOfRowsInFirstSection, viewModelMock.termsBySection["A"]?.count ?? 0)
        
        // Check the first cell text
        let firstCell = viewController.tableView(viewController.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertEqual(firstCell.textLabel?.text, "Apple")
    }
}
