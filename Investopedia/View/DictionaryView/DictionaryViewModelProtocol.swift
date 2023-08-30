//
//  DictionaryViewModelProtocol.swift
//  Investopedia
//
//  Created by João Ponte on 25/08/2023.
//

import Foundation

protocol DictionaryViewModelProtocol {
    
    // MARK: - Methods
    
    func fetchTerms()
    func term(at index: Int) -> FinancialTerm?
    
    // MARK: - Properties
    
    var terms: [FinancialTerm] { get }
}
