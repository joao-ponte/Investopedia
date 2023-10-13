//
//  NetworkUtility.swift
//  Investopedia
//
//  Created by João Ponte on 13/09/2023.
//

import Network

protocol NetworkUtilityDelegate: AnyObject {
    func networkStatusDidChange(isConnected: Bool)
}

class NetworkUtility: NetworkUtilityProtocol {
    weak var delegate: NetworkUtilityDelegate?

    func startMonitoring() {
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { [weak self] path in
            let isConnected = path.status == .satisfied
            self?.delegate?.networkStatusDidChange(isConnected: isConnected)
        }
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
    
    func hasNetworkConnection() -> Bool {
        let monitor = NWPathMonitor()
        let networkStatus = monitor.currentPath.status

        return networkStatus == .satisfied ? true : false
    }
}
