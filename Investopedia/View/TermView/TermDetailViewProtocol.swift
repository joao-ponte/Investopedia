//
//  TermDetailViewProtocol.swift
//  Investopedia
//
//  Created by João Ponte on 29/08/2023.
//

import Foundation

protocol TermDetailViewModelProtocol {
    var selectedTerm: FinancialTerm? { get }
    var canSelectNextTerm: Bool { get }
    var canSelectPreviousTerm: Bool { get }
    
    func configure(with term: FinancialTerm)
    func selectNextTerm()
    func selectPreviousTerm()
}

