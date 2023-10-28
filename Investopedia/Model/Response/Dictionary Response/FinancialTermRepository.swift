//
//  FinancialTermRepository.swift
//  Investopedia
//
//  Created by João Ponte on 28/10/2023.
//

import Foundation

protocol FinancialTermRepository {
    func fetchTerms(completion: @escaping ([FinancialTerm]?) -> Void)
}
