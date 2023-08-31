//
//  TermDetailViewModelTests.swift
//  InvestopediaTests
//
//  Created by João Ponte on 31/08/2023.
//

@testable import Investopedia
import XCTest

final class TermDetailViewModelTests: XCTestCase {

    var viewModel: TermDetailViewModel!

//    override func setUp() {
//        super.setUp()
//        viewModel = TermDetailViewModel(terms: <#T##[FinancialTerm]#>, selectedTerm: <#T##FinancialTerm#>)
//    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testInitialization_WithTermsAndSelectedTerm_ShouldSetProperties() {
        // Given
        let terms = [FinancialTerm(id: 1, word: "World", meaning: "Blue", example: "Water"),
                     FinancialTerm(id: 2, word: "Mars", meaning: "Red", example: "Rock")]
        let selectedTerm = terms[0]

        // When
        let viewModel = TermDetailViewModel(terms: terms, selectedTerm: selectedTerm)

        // Then
        XCTAssertEqual(viewModel.selectedTerm, selectedTerm)
    }
}
