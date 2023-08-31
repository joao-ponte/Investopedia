//
//  DictionaryViewModel.swift
//  Investopedia
//
//  Created by João Ponte on 24/08/2023.
//

import Foundation

final class DictionaryViewModel: DictionaryViewModelProtocol {
    
    // MARK: - Properties
    
    private(set) var terms: [FinancialTerm] = []
    private(set) var filteredTerms: [FinancialTerm] = []
    
    // MARK: - Public Methods
    
    func fetchTerms() {
        if let url = Bundle.main.url(forResource: "FinancialDictionaryData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ResponseData.self, from: data)
                updateTerms(with: jsonData.dictionary)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        } else {
            print("Error loading JSON file.")
        }
    }
    
    func term(at index: Int) -> FinancialTerm? {
        guard index >= 0 && index < terms.count else { return nil }
        return terms[index]
    }
    
    func updateFilteredTerms(with searchText: String) {
        guard !searchText.isEmpty else {
            filteredTerms = terms
            return
        }
        
        let searchPredicate = { (term: FinancialTerm) in
            term.word.localizedCaseInsensitiveContains(searchText)
        }
        
        filteredTerms = terms.filter(searchPredicate)
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
