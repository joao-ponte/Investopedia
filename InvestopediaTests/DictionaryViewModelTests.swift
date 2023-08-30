//
//  DictionaryViewModelTests.swift
//  InvestopediaTests
//
//  Created by João Ponte on 30/08/2023.
//

@testable import Investopedia
import XCTest

final class DictionaryViewModelTests: XCTestCase {
    
    func testTermsProperty_ShouldBeInitiallyEmpty() {
        // Given
        let viewModel = DictionaryViewModel()
        // When
        let terms = viewModel.terms
        // Then
        XCTAssertTrue(terms.isEmpty)
    }
    
    func testFetchTerms_ShouldPopulateTermsFromJSON() {
        // Given
        let viewModel = DictionaryViewModel()
        // When
        viewModel.fetchTerms()
        // Then
        XCTAssertFalse(viewModel.terms.isEmpty)
    }
    
    func testTermAtIndex_OutOfBoundsIndex_ShouldReturnNil() {
        // Given
        let viewModel = DictionaryViewModel()
        // When
        let term = viewModel.term(at: -1)
        // Then
        XCTAssertNil(term)
    }
    
    func testTermAtIndex_ValidIndex_ShouldReturnTerm() {
        // Given
        let viewModel = DictionaryViewModel()
        viewModel.fetchTerms()
        // When
        let index = 0
        let term = viewModel.term(at: index)
        // Then
        XCTAssertNotNil(term)
        XCTAssertEqual(term?.word, viewModel.terms[index].word)
    }
}
