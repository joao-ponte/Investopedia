//
//  DictionaryViewModelDelegateMock.swift
//  InvestopediaTests
//
//  Created by João Ponte on 16/10/2023.
//

import Foundation
@testable import Investopedia

class DictionaryViewModelDelegateMock: DictionaryViewModelDelegate {
    var filteredTermsUpdatedCalled = false
    var lastFilteredTermsUpdateSearchText: String?

    func filteredTermsUpdated() {
        filteredTermsUpdatedCalled = true
    }

    func setLastFilteredTermsUpdateSearchText(_ searchText: String) {
        lastFilteredTermsUpdateSearchText = searchText
    }
}
