//
//  NumberFormatter.swift
//  Investopedia
//
//  Created by João Ponte on 20/09/2023.
//

import Foundation

class NumberFormatter {
    static func formatCurrency(_ value: String?,
                               decimalPlaces: Int) -> String {
        guard let value = value,
                let doubleValue = Double(value) else {
            return "N/A"
        }
        return formatCurrency(doubleValue,
                              decimalPlaces: decimalPlaces)
    }
    
    static func formatCurrency(_ value:
                               Double, decimalPlaces: Int) -> String {
        let numberFormatter = Foundation.NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US")
        numberFormatter.numberStyle = .currency
        numberFormatter.minimumFractionDigits = decimalPlaces
        numberFormatter.maximumFractionDigits = decimalPlaces

        return numberFormatter.string(from: NSNumber(value: value)) ?? "N/A"
    }
    
    static func formatNumber(_ value: String?) -> String {
        guard let value = value, let doubleValue = Double(value) else {
            return "N/A"
        }
        return formatNumber(doubleValue)
    }
    
    static func formatNumber(_ value: Double) -> String {
        let numberFormatter = Foundation.NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US")
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 0
        
        return numberFormatter.string(from: NSNumber(value: value)) ?? "N/A"
    }
    
    static func formatPercentage(_ value: String?) -> String {
        guard let value = value, let doubleValue = Double(value) else {
            return "N/A"
        }
        return formatPercentage(doubleValue)
    }
    
    static func formatPercentage(_ value: Double) -> String {
        let adjustedValue = value / 100.0
        
        let numberFormatter = Foundation.NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US")
        numberFormatter.numberStyle = .percent
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        
        return numberFormatter.string(from: NSNumber(value: adjustedValue)) ?? "N/A"
    }
}
