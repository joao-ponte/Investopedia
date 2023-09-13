//
//  DictionaryViewModelTests.swift
//  InvestopediaTests
//
//  Created by João Ponte on 30/08/2023.
//

@testable import Investopedia
import XCTest

final class DictionaryViewModelTests: XCTestCase {

    var viewModel: DictionaryViewModel!

    override func setUp() {
        super.setUp()
        viewModel = DictionaryViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testTermsProperty_ShouldBeInitiallyEmpty() {
        // When
        let terms = viewModel.terms
        // Then
        XCTAssertTrue(terms.isEmpty)
    }
    
    func testFetchTerms_ShouldPopulateTermsFromJSON() {
        // When
        viewModel.fetchTerms()
        // Then
        XCTAssertFalse(viewModel.terms.isEmpty)
    }
    
    func testTermAtIndex_OutOfBoundsIndex_ShouldReturnNil() {
        // When
        let term = viewModel.term(at: -1)
        // Then
        XCTAssertNil(term)
    }
    
    func testTermAtIndex_ValidIndex_ShouldReturnTerm() {
        // Given
        viewModel.fetchTerms()
        // When
        let index = 0
        let term = viewModel.term(at: index)
        // Then
        XCTAssertNotNil(term)
        XCTAssertEqual(term?.word, viewModel.terms[index].word)
    }
    
    func testUpdateFilteredTerms_WithEmptySearchText_ShouldMatchAllTerms() {
        // Given
        viewModel.fetchTerms()
        
        // When
        viewModel.updateFilteredTerms(with: "")
        
        // Then
        XCTAssertEqual(viewModel.filteredTerms, viewModel.terms)
    }

    func testUpdateFilteredTerms_WithSearchText_ShouldFilterTerms() {
        // Given
        viewModel.fetchTerms()
        let searchText = "Bond"  // Provide a sample search text
        
        // When
        viewModel.updateFilteredTerms(with: searchText)
        
        // Then
        XCTAssertTrue(viewModel.filteredTerms.allSatisfy { term in
            term.word.localizedCaseInsensitiveContains(searchText)
        })
    }
}
