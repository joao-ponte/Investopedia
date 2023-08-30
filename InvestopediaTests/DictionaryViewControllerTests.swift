//
//  DictionaryViewControllerTests.swift
//  InvestopediaTests
//
//  Created by João Ponte on 30/08/2023.
//

import XCTest
@testable import Investopedia

class DictionaryViewControllerTests: XCTestCase {

    var sut: DictionaryViewController!
    var mockViewModel: MockDictionaryViewModel!

    override func setUpWithError() throws {
        sut = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(identifier: "DictionaryViewController") as? DictionaryViewController
        _ = sut.view // Load the view hierarchy
        
        mockViewModel = MockDictionaryViewModel()
        sut.viewModel = mockViewModel
    }

    override func tearDownWithError() throws {
        sut = nil
        mockViewModel = nil
    }
    
    func testTermAtIndexCalled() {
        let _ = sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        XCTAssertTrue(mockViewModel.termAtIndexCalled)
    }
    
    func testDidSelectRow() {
        let tableView = sut.tableView
        let indexPath = IndexPath(row: 0, section: 0)
        
        sut.tableView(tableView!, didSelectRowAt: indexPath)
        
        XCTAssertTrue(mockViewModel.termAtIndexCalled)
    }
}
