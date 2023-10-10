//
//  CoinCapAPIEndpoints.swift
//  Investopedia
//
//  Created by João Ponte on 02/09/2023.
//

import Foundation

struct APIEndpoint {
    let urlString: String
    
    // Base URL
    static let base = "https://api.coincap.io/v2"
    
    // Endpoint for retrieving a list of all crypto currencies
    static let cryptoCurrencies = APIEndpoint(urlString: "\(base)/assets")
    
    // Endpoint for retrieving fiat currency rates
    static let fiatCurrency = APIEndpoint(urlString: "\(base)/rates")
    
    // Endpoint for retrieving a specific crypto currency by its unique ID
    static func cryptoCurrency(withID id: String) -> APIEndpoint {
        return APIEndpoint(urlString: "\(cryptoCurrencies.urlString)/\(id)")
    }
}
