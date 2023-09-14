//
//  NetworkUtility.swift
//  Investopedia
//
//  Created by João Ponte on 13/09/2023.
//

import Network

class NetworkUtility: NetworkUtilityProtocol {
    func hasNetworkConnection() -> Bool {
        let monitor = NWPathMonitor()
        let networkStatus = monitor.currentPath.status

        switch networkStatus {
        case .satisfied:
            return true
        default:
            return false
        }
    }
}
