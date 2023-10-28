//
//  CoinCapAPIEndpoints.swift
//  Investopedia
//
//  Created by João Ponte on 02/09/2023.
//

import Foundation

struct APIEndpoint {
    let urlString: String
    
    static let base = "https://api.coincap.io/v2"
    
    static let cryptoCurrencies = APIEndpoint(urlString: "\(base)/assets")
    
    static let fiatCurrency = APIEndpoint(urlString: "\(base)/rates")
    
    static func cryptoCurrency(withID id: String) -> APIEndpoint {
        return APIEndpoint(urlString: "\(cryptoCurrencies.urlString)/\(id)")
    }
}
