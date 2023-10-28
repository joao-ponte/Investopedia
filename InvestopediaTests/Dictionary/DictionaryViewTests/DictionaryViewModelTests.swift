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
        let termRepositoryMock = FinancialTermRepositoryMock()
        viewModel = DictionaryViewModel(termRepository: termRepositoryMock)
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
        let termRepositoryMock = viewModel.termRepository as! FinancialTermRepositoryMock
        termRepositoryMock.termsToReturn = [FinancialTerm(id: 1, word: "Test", meaning: "Meaning", example: "Example")]

        // When
        viewModel.fetchTerms()

        // Then
        XCTAssertTrue(termRepositoryMock.fetchTermsCalled)
        XCTAssertEqual(viewModel.terms.count, 1)
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
    
    // MARK: - Term
    
    func testTerm() {
        // Given: Some terms to set for testing
        let term1 = FinancialTerm(id: 1, word: "Test1", meaning: "Meaning1", example: "Example1")
        let term2 = FinancialTerm(id: 2, word: "Test2", meaning: "Meaning2", example: "Example2")

        // When: Setting terms for testing
        viewModel.updateTerms(with: [term1, term2])

        // Then: The terms should be set correctly for testing
        XCTAssertEqual(viewModel.term(at: 0), term1)
        XCTAssertEqual(viewModel.term(at: 1), term2)
        XCTAssertNil(viewModel.term(at: 2))
    }
    
    func testUpdateSections() {
        // Given
        let termA1 = FinancialTerm(id: 1, word: "Apple", meaning: "Apple definition", example: "Apple Example")
        let termB1 = FinancialTerm(id: 2, word: "Banana", meaning: "Banana definition", example: "Banana Example")
        let termA2 = FinancialTerm(id: 3, word: "Aardvark", meaning: "Aardvark definition", example: "Aardvark Example")
        let termC1 = FinancialTerm(id: 4, word: "Carrot", meaning: "Carrot definition", example: "Carrot Example")

        viewModel.updateTerms(with: [termA1, termB1, termA2, termC1])

        // When
        viewModel.updateSections()

        // Then
        XCTAssertEqual(viewModel.sectionTitles, ["A", "B", "C"])

        // Verify terms in sections
        XCTAssertEqual(viewModel.termsBySection["A"], [termA2, termA1])
        XCTAssertEqual(viewModel.termsBySection["B"], [termB1])
        XCTAssertEqual(viewModel.termsBySection["C"], [termC1])

        // Ensure terms are alphabetically sorted within sections
        XCTAssertEqual(viewModel.termsBySection["A"]?.map { $0.word }, ["Aardvark", "Apple"])
        XCTAssertEqual(viewModel.termsBySection["B"]?.map { $0.word }, ["Banana"])
        XCTAssertEqual(viewModel.termsBySection["C"]?.map { $0.word }, ["Carrot"])
    }

    
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
