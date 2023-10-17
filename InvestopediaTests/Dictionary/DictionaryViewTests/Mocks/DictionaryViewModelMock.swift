//
//  DictionaryViewModelMock.swift
//  InvestopediaTests
//
//  Created by João Ponte on 17/10/2023.
//

import Foundation
@testable import Investopedia

class DictionaryViewModelMock: DictionaryViewModelProtocol {
    var delegate: DictionaryViewModelDelegate?
    var terms: [FinancialTerm] = []
    var filteredTerms: [FinancialTerm] = []
    var sectionTitles: [String] = []
    var termsBySection: [String: [FinancialTerm]] = [:]
    var searchText: String = "Test Search"
    
    func fetchTerms() {
    }
    
    func term(at index: Int) -> FinancialTerm? {
        return nil
    }
    
    func updateFilteredTerms(with searchText: String) {
        self.searchText = searchText
    }
    
    func updateSections() {
        
    }
}
