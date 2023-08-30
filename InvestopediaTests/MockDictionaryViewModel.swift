//
//  MockDictionaryViewModel.swift
//  InvestopediaTests
//
//  Created by João Ponte on 30/08/2023.
//

import Foundation
@testable import Investopedia

class MockDictionaryViewModel: DictionaryViewModelProtocol {
    
    var fetchTermsCalled = false
    var termAtIndexCalled = false
    var updateTermsCalled = false
    var sortTermsAlphabeticallyCalled = false
    
    var mockTerms: [FinancialTerm] = []
    
    func fetchTerms() {
        fetchTermsCalled = true
    }
    
    func term(at index: Int) -> FinancialTerm? {
        termAtIndexCalled = true
        return mockTerms[safe: index]
    }
    
    var terms: [FinancialTerm] {
        return mockTerms
    }
    
    func updateTerms(with newTerms: [FinancialTerm]) {
        updateTermsCalled = true
    }
    
    func sortTermsAlphabetically() {
        sortTermsAlphabeticallyCalled = true
    }
}

extension Array {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
