//
//  CoinCapAPIEndpoints.swift
//  Investopedia
//
//  Created by João Ponte on 02/09/2023.
//

import Foundation

struct CoinCapAPIEndpoints {
    static let baseUrl = "https://api.coincap.io/v2"
    
    static let getCryptoCurrency = "\(baseUrl)/assets"
    static let getFiatCurrency = "\(baseUrl)/rates"
}
