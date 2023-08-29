//
//  DictionaryViewModel.swift
//  Investopedia
//
//  Created by João Ponte on 24/08/2023.
//

import Foundation

final class DictionaryViewModel: DictionaryViewModelProtocol {
    
    private(set) var terms: [FinancialTerm] = []
    
    func fetchTerms() {
        if let url = Bundle.main.url(forResource: "FinancialDictionaryData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ResponseData.self, from: data)
                terms = jsonData.dictionary // Update the terms array here
                terms.sort { $0.word < $1.word}
            } catch {
                print("Error decoding JSON: \(error)")
            }
        } else {
            print("Error🥲")
        }
    }
    
    func term(at index: Int) -> FinancialTerm? {
        guard index >= 0 && index < terms.count else { return nil}
        return terms[index]
    }
}

