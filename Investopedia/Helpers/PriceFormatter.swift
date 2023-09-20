//
//  PriceFormatter.swift
//  Investopedia
//
//  Created by João Ponte on 20/09/2023.
//

import Foundation

class PriceFormatter {
    static func formatUsdPrice(price: String) -> String {
        guard let priceUsd = Double(price) else {
            return "N/A"
        }
        
        switch priceUsd {
        case 0..<1.01:
            return NumberFormatter.formatCurrency(priceUsd, decimalPlaces: 8)
        case 1.01..<100:
            return NumberFormatter.formatCurrency(priceUsd, decimalPlaces: 4)
        default:
            return NumberFormatter.formatCurrency(priceUsd, decimalPlaces: 2)
        }
    }
}
