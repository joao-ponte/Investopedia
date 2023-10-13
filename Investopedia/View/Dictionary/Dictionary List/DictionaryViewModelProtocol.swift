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
    func updateFilteredTerms(with searchText: String)
    func updateSections()
    
    // MARK: - Properties
    
    var delegate: DictionaryViewModelDelegate? { get set }
    var terms: [FinancialTerm] { get }
    var filteredTerms: [FinancialTerm] { get }
    var sectionTitles: [String] { get }
    var termsBySection: [String: [FinancialTerm]] { get }
    
}
