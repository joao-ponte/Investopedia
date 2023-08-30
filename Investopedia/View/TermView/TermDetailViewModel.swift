//
//  TermDetailViewModel.swift
//  Investopedia
//
//  Created by João Ponte on 29/08/2023.
//

import Foundation

final class TermDetailViewModel: TermDetailViewModelProtocol {
    private var terms: [FinancialTerm]
    private var currentTermIndex: Int = 0
    
    init(terms: [FinancialTerm], selectedTerm: FinancialTerm) {
        self.terms = terms
        if let selectedIndex = terms.firstIndex(of: selectedTerm) {
            self.currentTermIndex = selectedIndex
        } else {
            self.currentTermIndex = 0
        }
    }
    
    var selectedTerm: FinancialTerm? {
        return terms[currentTermIndex]
    }
    
    func configure(with term: FinancialTerm) {
        if let selectedIndex = terms.firstIndex(of: term) {
            currentTermIndex = selectedIndex
        }
    }
    
    func selectNextTerm() {
        if currentTermIndex < terms.count - 1 {
            currentTermIndex += 1
        }
    }
    
    func selectPreviousTerm() {
        if currentTermIndex > 0 {
            currentTermIndex -= 1
        }
    }
}
