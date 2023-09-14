//
//  MockNetworkUtility.swift
//  InvestopediaTests
//
//  Created by João Ponte on 14/09/2023.
//

import Foundation
@testable import Investopedia

class MockNetworkUtility: NetworkUtilityProtocol {
    var isNetworkAvailable = true

    func hasNetworkConnection() -> Bool {
        return isNetworkAvailable
    }
}
