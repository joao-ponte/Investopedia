//
//  FinancialTermRepositoryMock.swift
//  InvestopediaTests
//
//  Created by João Ponte on 28/10/2023.
//

import Foundation
@testable import Investopedia

class FinancialTermRepositoryMock: FinancialTermRepository {
    var fetchTermsCalled = false
    var termsToReturn: [FinancialTerm]?
    
    func fetchTerms(completion: @escaping ([FinancialTerm]?) -> Void) {
        fetchTermsCalled = true
        if let termsToReturn = termsToReturn {
            completion(termsToReturn)
        } else {
            completion(nil)
        }
    }
}
