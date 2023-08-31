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
    }
    
    func term(at index: Int) -> FinancialTerm? {
        guard index >= 0 && index < terms.count else { return nil }
        return terms[index]
    }
    
    func updateFilteredTerms(with searchText: String) {
        searchQuery = searchText
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
}
