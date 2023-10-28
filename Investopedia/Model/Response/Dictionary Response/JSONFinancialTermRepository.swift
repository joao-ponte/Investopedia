//
//  JSONFinancialTermRepository.swift
//  Investopedia
//
//  Created by João Ponte on 28/10/2023.
//

import Foundation

class JSONFinancialTermRepository: FinancialTermRepository {
    func fetchTerms(completion: @escaping ([FinancialTerm]?) -> Void) {
        guard let url = Bundle.main.url(forResource: "FinancialDictionaryData", withExtension: "json") else {
            print("Error loading JSON file.")
            completion(nil)
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(ResponseData.self, from: data)
            let terms = jsonData.dictionary
            completion(terms)
        } catch {
            print("Error decoding JSON: \(error)")
            completion(nil)
        }
    }
}
