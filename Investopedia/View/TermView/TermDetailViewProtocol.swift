//
//  TermDetailViewProtocol.swift
//  Investopedia
//
//  Created by João Ponte on 29/08/2023.
//

import Foundation

protocol TermDetailViewModelProtocol {
    var selectedTerm: FinancialTerm? { get }
    func configure(with term: FinancialTerm)
}
