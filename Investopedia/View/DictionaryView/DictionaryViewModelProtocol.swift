//
//  DictionaryViewModelProtocol.swift
//  Investopedia
//
//  Created by João Ponte on 25/08/2023.
//

import Foundation

protocol DictionaryViewModelProtocol {
    func fetchTerms()
    func term(at index: Int) -> FinancialTerm?
    var terms: [FinancialTerm] { get }
}
