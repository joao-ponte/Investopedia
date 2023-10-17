//
//  NetworkUtilityMock.swift
//  InvestopediaTests
//
//  Created by João Ponte on 17/10/2023.
//

import Foundation
@testable import Investopedia

class NetworkUtilityMock: NetworkUtilityProtocol {
    var isConnected: Bool = true

    func hasNetworkConnection() -> Bool {
        return isConnected
    }
}

