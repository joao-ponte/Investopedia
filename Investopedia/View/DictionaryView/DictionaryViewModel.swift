//
//  DictionaryViewModel.swift
//  Investopedia
//
//  Created by João Ponte on 24/08/2023.
//

import Foundation

class DictionaryViewModel {
    
    private var terms: [FinancialTerm] = []
    
    func fetchTerms() {
        if let url = Bundle.main.url(forResource: "FinancialDictionaryData", withExtension: "json") {
            print(url)
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ResponseData.self, from: data)
                terms = jsonData.dictionary // Update the terms array here
            } catch {
                print("Error decoding JSON: \(error)")
            }
        } else {
            print("Error🥲")
        }
    }
    
    func numbersOfTerms() -> Int {
        terms.count
    }
    
    func term(at index: Int) -> FinancialTerm? {
        guard index >= 0 && index < terms.count else { return nil}
        return terms[index]
    }
}

