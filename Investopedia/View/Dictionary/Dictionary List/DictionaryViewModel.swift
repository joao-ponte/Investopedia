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
    
    // MARK: - Public Methods
    
    func fetchTerms() {
        guard let url = Bundle.main.url(forResource: "FinancialDictionaryData", withExtension: "json") else {
            print("Error loading JSON file.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(ResponseData.self, from: data)
            updateTerms(with: jsonData.dictionary)
        } catch {
            print("Error decoding JSON: \(error)")
        }
        updateSections()
    }
    
    func term(at index: Int) -> FinancialTerm? {
        guard index >= 0 && index < sectionTitles.count else { return nil }
        let sectionTitle = sectionTitles[index]
        return termsBySection[sectionTitle]?.first
    }
    
    func updateFilteredTerms(with searchText: String) {
        let trimmedSearchText = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        searchQuery = trimmedSearchText
        updateSections()
        delegate?.filteredTermsUpdated()
    }
    
    // MARK: - Private Methods
    
    private func updateTerms(with newTerms: [FinancialTerm]) {
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
        
        for key in termsBySection.keys {
            termsBySection[key]?.sort { $0.word < $1.word }
        }
    }
}
