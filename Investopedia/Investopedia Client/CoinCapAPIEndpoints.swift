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
    static let cryptoCurrency = APIEndpoint(urlString: "https://api.coincap.io/v2/assets")
    static let fiatCurrency = APIEndpoint(urlString: "\(base)/rates")
}
