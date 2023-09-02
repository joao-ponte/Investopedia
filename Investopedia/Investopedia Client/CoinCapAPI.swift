//
//  CoinCapAPI.swift
//  Investopedia
//
//  Created by João Ponte on 02/09/2023.
//

import Foundation

class CoinCapAPI {
    
    let client: HttpClientProtocol
    
    init(client: HttpClientProtocol) {
        self.client = client
    }
    
    func getCryptoCurrency(completion: @escaping (Result<[CryptoCurrency],NetworkError>) -> Void) {
        guard let url = URL(string: CoinCapAPIEndpoints.getCryptoCurrency) else {
            completion(.failure(.badURL))
            return
        }
        client.taskForGetRequest(url: url, response: ResponseCryptos.self) { result, error in
            if let error = error {
                completion(.failure(.serviceError))
                return
            }
            guard let response = result else {
                completion(.failure(.noData))
                return
            }
            
            let cryptos = response.data
            completion(.success(cryptos))
            
        }
    }
}
