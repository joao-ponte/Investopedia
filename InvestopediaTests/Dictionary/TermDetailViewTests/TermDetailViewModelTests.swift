//
//  TermDetailViewModelTests.swift
//  InvestopediaTests
//
//  Created by João Ponte on 31/08/2023.
//

@testable import Investopedia
import XCTest

final class TermDetailViewModelTests: XCTestCase {
    var viewModel: TermDetailViewModel?
    var mockTerm: FinancialTerm!
    var mockTerms: [FinancialTerm]!
    
    override func setUp() {
        super.setUp()
        
        // Mock terms for testing
        mockTerm = FinancialTerm(id: 1, word: "TestTerm", meaning: "TestMeaning", example: "TestExample")
        mockTerms = [
            FinancialTerm(id: 1, word: "Term1", meaning: "Meaning1", example: "Example1"),
            FinancialTerm(id: 2, word: "Term2", meaning: "Meaning2", example: "Example2"),
            FinancialTerm(id: 3, word: "Term3", meaning: "Meaning3", example: "Example3")
        ]
        
        // Initialize the view model
        viewModel = TermDetailViewModel(terms: mockTerms, selectedTerm: mockTerm)
    }
    
    // MARK: - Tests
    
    func testInitialization() {
        XCTAssertNotNil(viewModel)
    }
    
    func testSelectedTerm() {
        XCTAssertEqual(viewModel?.selectedTerm, mockTerms.first)
    }
    
    func testSelectNextTerm() {
        // When
        viewModel?.selectNextTerm()
        
        // Then
        XCTAssertEqual(viewModel?.selectedTerm, mockTerms[1])
    }
    
    func testConfigure() {
        let newSelectedTerm = mockTerms[1]
        viewModel?.configure(with: newSelectedTerm)
        XCTAssertEqual(viewModel?.selectedTerm, newSelectedTerm)
    }
    
    func testSelectPreviousTerm() {
        viewModel?.selectPreviousTerm()
        XCTAssertEqual(viewModel?.selectedTerm, mockTerms[0])
    }
    
    func testNextTerm() {
        // When
        let nextTerm = viewModel?.nextTerm()
        
        // Then
        XCTAssertEqual(nextTerm, mockTerms[1])
    }
    
    func testPreviousTerm() {
        // When
        let previousTerm = viewModel?.previousTerm()
        
        // Then
        XCTAssertEqual(previousTerm, nil)  // The initial selected term is the first term, so there's no previous term
    }
}
