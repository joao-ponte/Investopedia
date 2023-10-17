//
//  NetworkManagerMock.swift
//  InvestopediaTests
//
//  Created by João Ponte on 17/10/2023.
//

import Foundation
@testable import Investopedia

class NetworkManagerMock: NetworkManagerProtocol {
    var shouldSucceed: Bool = true

    func request<ResponseType: Decodable>(_ endpoint: APIEndpoint,
                                          responseType: ResponseType.Type,
                                          completion: @escaping (Result<ResponseType, NetworkError>) -> Void) {
        if shouldSucceed {
            if responseType == ResponseCryptos.self {
                // Mock successful response for CryptoCurrency list
                let mockResponse = ResponseCryptos(data: [CryptoCurrency(id: "1", rank: "1", symbol: "BTC", name: "Bitcoin", supply: "1000000", maxSupply: "21000000", marketCapUsd: "1000000000", volumeUsd24Hr: "50000000", priceUsd: "50000", changePercent24Hr: "0.5", vwap24Hr: "49000", explorer: "btc-explorer")])
                completion(.success(mockResponse as! ResponseType))
            } else {
                // Mock successful response for single CryptoCurrency
                let mockResponse = ResponseOneCrypto(data: CryptoCurrency(id: "1", rank: "1", symbol: "BTC", name: "Bitcoin", supply: "1000000", maxSupply: "21000000", marketCapUsd: "1000000000", volumeUsd24Hr: "50000000", priceUsd: "50000", changePercent24Hr: "0.5", vwap24Hr: "49000", explorer: "btc-explorer"), timestamp: 1634056800)
                completion(.success(mockResponse as! ResponseType))
            }
        } else {
            // Mock failure response
            completion(.failure(.serviceError))
        }
    }

    func requestCryptoCurrencyData(for cryptoID: String, completion: @escaping (Result<ResponseOneCrypto, NetworkError>) -> Void) {
        if shouldSucceed {
            // Mock successful response for single CryptoCurrency
            let mockResponse = ResponseOneCrypto(data: CryptoCurrency(id: "1", rank: "1", symbol: "BTC", name: "Bitcoin", supply: "1000000", maxSupply: "21000000", marketCapUsd: "1000000000", volumeUsd24Hr: "50000000", priceUsd: "50000", changePercent24Hr: "0.5", vwap24Hr: "49000", explorer: "btc-explorer"), timestamp: 1634056800)
            completion(.success(mockResponse))
        } else {
            // Mock failure response
            completion(.failure(.serviceError))
        }
    }
}

