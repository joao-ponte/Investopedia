//
//  DictionaryViewModelTests.swift
//  InvestopediaTests
//
//  Created by João Ponte on 30/08/2023.
//

import XCTest
@testable import Investopedia

class DictionaryViewModelTests: XCTestCase {
    var viewModel: DictionaryViewModel!
    var delegateMock: DictionaryViewModelDelegateMock!
    
    override func setUp() {
        super.setUp()
        viewModel = DictionaryViewModel()
        delegateMock = DictionaryViewModelDelegateMock()
        viewModel.delegate = delegateMock
    }
    
    override func tearDown() {
        viewModel = nil
        delegateMock = nil
        super.tearDown()
    }
    
    // MARK: - Initialization
    
    func testInitialization() {
        XCTAssertNotNil(viewModel)
    }
    
    // MARK: - Fetch Terms
    
    func testFetchTerms() {
        // Given
        XCTAssertTrue(viewModel.terms.isEmpty)
        
        // When
        viewModel.fetchTerms()
        
        // Then
        XCTAssertFalse(viewModel.terms.isEmpty)
    }
    
    // MARK: - Update Filtered Terms
    
    func testUpdateFilteredTerms() {
        // Given
        let searchText = "test"
        
        // When
        viewModel.updateFilteredTerms(with: searchText)
        
        // Then
        XCTAssertTrue(delegateMock.filteredTermsUpdatedCalled)
        XCTAssertEqual(viewModel.filteredTerms.count, 0)
    }
    
    func testFilteredTermsEmpty() {
        // Given: An empty terms list
        XCTAssertTrue(viewModel.terms.isEmpty)
        
        // When: Updating filtered terms with an empty search query
        viewModel.updateFilteredTerms(with: "")
        
        // Then: The filtered terms should also be empty
        XCTAssertTrue(viewModel.filteredTerms.isEmpty)
    }
    
//    func testFilteredTerms() {
//        // Given
//        let term1 = FinancialTerm(id: 1, word: "Test1", meaning: "Meaning1", example: "Example1")
//        let term2 = FinancialTerm(id: 2, word: "Test2", meaning: "Meaning2", example: "Example2")
//        viewModel.setTermsForTesting([term1, term2])
//        
//        // When: Updating filtered terms with a search query
//        let searchText = "Test1"
//        viewModel.updateFilteredTerms(with: searchText)
//        
//        // Then: The filtered terms should contain Term1 but not Term2
//        XCTAssertEqual(viewModel.filteredTerms.count, 1)
//        XCTAssertTrue(viewModel.filteredTerms.contains(term1))
//        XCTAssertFalse(viewModel.filteredTerms.contains(term2))
//    }
    
    // MARK: - Term
    
//    func testTerm() {
//        // Given
//        let term1 = FinancialTerm(id: 1, word: "Test1", meaning: "Meaning1", example: "Example1")
//        let term2 = FinancialTerm(id: 2, word: "Test2", meaning: "Meaning2", example: "Example2")
//        viewModel.setTermsForTesting([term1, term2])
//        
//        // When
//        _ = viewModel.term(at: 0)
//        _ = viewModel.term(at: 1)
//        let resultInvalidIndex = viewModel.term(at: 2)
//        
//        // Then
//        XCTAssertNil(resultInvalidIndex)
//    }
    
//    func testTermAtIndex() {
//        // Given: Some terms to set for testing
//        let term1 = FinancialTerm(id: 1, word: "Test1", meaning: "Meaning1", example: "Example1")
//        let term2 = FinancialTerm(id: 2, word: "Test2", meaning: "Meaning2", example: "Example2")
//        viewModel.setTermsForTesting([term1, term2])
//        
//        // When: Getting terms at specific indices
//        let resultTerm1 = viewModel.term(at: 0)
//        let resultTerm2 = viewModel.term(at: 1)
//        let resultInvalidIndex = viewModel.term(at: 2)
//        
//        // Then: The correct terms should be returned for valid indices, and nil for an invalid index
//        XCTAssertEqual(resultTerm1, term1)
//        XCTAssertEqual(resultTerm2, term2)
//        XCTAssertNil(resultInvalidIndex)
//    }
    
    // MARK: - Sections
    
//    func testUpdateSections() {
//        // Given
//        let term1 = FinancialTerm(id: 1, word: "Apple", meaning: "Apple definition", example: "Apple Example")
//        let term2 = FinancialTerm(id: 2, word: "Banana", meaning: "Banana definition", example: "Banana Example")
//        let terms = [term1, term2]
//        viewModel.setTermsForTesting(terms)
//        
//        // When
//        viewModel.updateSections()
//        
//        // Then
//        XCTAssertEqual(viewModel.sectionTitles, ["A", "B"])
//        XCTAssertEqual(viewModel.termsBySection["A"], [term1])
//        XCTAssertEqual(viewModel.termsBySection["B"], [term2])
//    }
    
    // MARK: - Set Terms for Testing
    
//    func testSetTermsForTesting() {
//        // Given: Some terms to set for testing
//        let term1 = FinancialTerm(id: 1, word: "Test1", meaning: "Meaning1", example: "Example1")
//        let term2 = FinancialTerm(id: 2, word: "Test2", meaning: "Meaning2", example: "Example2")
//        
//        // When: Setting terms for testing
//        viewModel.setTermsForTesting([term1, term2])
//        
//        // Then: The terms should be set correctly for testing
//        XCTAssertEqual(viewModel.terms, [term1, term2])
//    }
    
    // MARK: - Search Query
    
//    func testSearchQuery() {
//        // Given
//        let initialSearchQuery = viewModel.getSearchQueryForTesting()
//        let newSearchQuery = "test"
//        
//        // When
//        viewModel.updateFilteredTerms(with: newSearchQuery)
//        
//        // Then
//        XCTAssertEqual(viewModel.getSearchQueryForTesting(), newSearchQuery)
//        XCTAssertNotEqual(viewModel.getSearchQueryForTesting(), initialSearchQuery)
//    }
    
    // MARK: - Delegate Invocation
    
    func testDelegateInvocation() {
        // Given
        let searchText = "test"
        viewModel.delegate = delegateMock
        
        // When
        viewModel.updateFilteredTerms(with: searchText)
        
        // Then
        XCTAssertTrue(delegateMock.filteredTermsUpdatedCalled)
    }
}
