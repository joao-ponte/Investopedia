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
    
    enum EndPoints {
        
        case getCryptoCurrency
        case getFiatCurrency
        
        var stringValue: String {
            switch self {
                
            case .getCryptoCurrency:
                return "https://api.coincap.io/v2/assets"
            case .getFiatCurrency:
                return "https://api.coincap.io/v2/rates"
            }
        }
        
        var url: URL? {
            guard let url = URL(string: stringValue) else {
                return nil
            }
            return url
        }
    }
    
    func getCryptoCurrency(completion: @escaping (Result<[CryptoCurrency],NetworkError>) -> Void) {
        let endPoint = EndPoints.getCryptoCurrency
        guard let url = endPoint.url else {
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
            
        }
    }
}
