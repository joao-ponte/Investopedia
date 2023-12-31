//
//  CryptoCurrencyTableViewCell.swift
//  Investopedia
//
//  Created by João Ponte on 11/09/2023.
//

import UIKit

class CryptoCurrencyTableViewCell: UITableViewCell {
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Configuration

    func configure(with crypto: CryptoCurrency, previousPrice: Double) {
        textLabel?.text = crypto.symbol
        detailTextLabel?.text = crypto.name
        accessoryType = .disclosureIndicator

        let priceLabel = UILabel()
        priceLabel.text = formatPrice(price: crypto.priceUsd)
        priceLabel.sizeToFit()
        accessoryView = priceLabel
    }

    // MARK: - Private Helpers
    
    private func formatPrice(price: String) -> String {
        guard let priceDouble = Double(price) else {
            return "$0.00"
        }
        
        let formattedPrice: String
        
        switch priceDouble {
        case 0..<1.01:
            formattedPrice = formatCurrency(value: priceDouble,
                                            decimalPlaces: 8)
        case 1.01..<100:
            formattedPrice = formatCurrency(value: priceDouble,
                                            decimalPlaces: 4)
        default:
            formattedPrice = formatCurrency(value: priceDouble,
                                            decimalPlaces: 2)
        }
        
        return formattedPrice
    }

    private func formatCurrency(value: Double, decimalPlaces: Int) -> String {
        let numberFormatter = Foundation.NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US")
        numberFormatter.numberStyle = .currency
        numberFormatter.minimumFractionDigits = decimalPlaces
        
        return numberFormatter.string(from: NSNumber(value: value)) ?? "$0.00"
    }
}
