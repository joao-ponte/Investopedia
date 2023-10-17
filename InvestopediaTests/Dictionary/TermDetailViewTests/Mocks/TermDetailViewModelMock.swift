//
//  TermDetailViewModelMock.swift
//  InvestopediaTests
//
//  Created by João Ponte on 17/10/2023.
//

import Foundation
@testable import Investopedia

class TermDetailViewModelMock: TermDetailViewModelProtocol {
    var selectedTerm: FinancialTerm?
    var canSelectNextTerm: Bool = false
    var canSelectPreviousTerm: Bool = false
    
    var configureCalled = false
    var selectNextTermCalled = false
    var selectPreviousTermCalled = false
    var nextTermCalled = false
    var previousTermCalled = false
    
    func configure(with term: FinancialTerm) {
        print("configure(with:) called")
        configureCalled = true
    }
    
    func selectNextTerm() {
        selectNextTermCalled = true
    }
    
    func selectPreviousTerm() {
        selectPreviousTermCalled = true
    }
    
    func previousTerm() -> FinancialTerm? {
        previousTermCalled = true
        return nil
    }
    
    func nextTerm() -> FinancialTerm? {
        nextTermCalled = true
        return nil
    }
}
