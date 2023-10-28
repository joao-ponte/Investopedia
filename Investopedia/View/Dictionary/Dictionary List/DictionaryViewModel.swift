//
//  DictionaryViewModel.swift
//  Investopedia
//
//  Created by João Ponte on 24/08/2023.
//

import Foundation

protocol DictionaryViewModelDelegate: AnyObject {
    func filteredTermsUpdated()
}

final class DictionaryViewModel: DictionaryViewModelProtocol {
    
    // MARK: - Properties
    
    private(set) var terms: [FinancialTerm] = []
    private var searchQuery: String = ""
    
    // New properties for sections
    private(set) var termsBySection: [String: [FinancialTerm]] = [:]
    private(set) var sectionTitles: [String] = []
    
    var filteredTerms: [FinancialTerm] {
        if searchQuery.isEmpty {
            return terms
        } else {
            return terms.filter { $0.word.localizedCaseInsensitiveContains(searchQuery) }
        }
    }
    
    weak var delegate: DictionaryViewModelDelegate?
    internal var termRepository: FinancialTermRepository
    
    // MARK: - Initializer
    
    init(termRepository: FinancialTermRepository) {
        self.termRepository = termRepository
    }
}

// MARK: - Public Methods

extension DictionaryViewModel {
    func fetchTerms() {
        termRepository.fetchTerms { [weak self] terms in
            if let terms = terms {
                self?.updateTerms(with: terms)
                self?.updateSections()
            }
        }
    }
    
    func term(at index: Int) -> FinancialTerm? {
        guard index >= 0 && index < terms.count else { return nil }
        let term = terms[index]
        return term
    }
    
    func updateFilteredTerms(with searchText: String) {
        let trimmedSearchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        searchQuery = trimmedSearchText
        updateSections()
        delegate?.filteredTermsUpdated()
    }
}

// MARK: - Private/Internal Methods

extension DictionaryViewModel {
    internal func updateTerms(with newTerms: [FinancialTerm]) {
        terms = newTerms
        sortTermsAlphabetically()
    }
    
    private func sortTermsAlphabetically() {
        terms.sort { $0.word < $1.word }
    }
    
    internal func updateSections() {
        termsBySection = [:]
        sectionTitles = []
        
        for term in filteredTerms {
            let startingLetter = String(term.word.prefix(1)).uppercased()
            if termsBySection[startingLetter] == nil {
                termsBySection[startingLetter] = []
                sectionTitles.append(startingLetter)
            }
            termsBySection[startingLetter]?.append(term)
        }
        
        // Sort terms within each section by the 'word' property
        for key in termsBySection.keys {
            termsBySection[key]?.sort { $0.word < $1.word }
        }
    }
}
