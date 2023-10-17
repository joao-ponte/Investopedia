//
//  CryptoCurrencyListViewModelDelegateMock.swift
//  InvestopediaTests
//
//  Created by João Ponte on 17/10/2023.
//

import Foundation
@testable import Investopedia

class CryptoCurrencyListViewModelDelegateMock: CryptoCurrencyListViewModelDelegate {
    var filteredCryptoCurrenciesUpdatedCalled = false
    
    func filteredCryptoCurrenciesUpdated() {
        filteredCryptoCurrenciesUpdatedCalled = true
    }
}
