//
//  CryptoCurrencyTableViewCell.swift
//  Investopedia
//
//  Created by João Ponte on 11/09/2023.
//

import UIKit

class CryptoCurrencyTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func configure(with crypto: CryptoCurrency, previousPrice: Double) {
        textLabel?.text = crypto.symbol
        detailTextLabel?.text = crypto.name
        accessoryType = .disclosureIndicator

        let priceLabel = UILabel()
//        priceLabel.textColor = determinePriceColor(currentPrice: crypto.priceUsd,
//                                                   previousPrice: previousPrice)
        priceLabel.text = formatPrice(price: crypto.priceUsd)
        priceLabel.sizeToFit()
        accessoryView = priceLabel
    }

//    private func determinePriceColor(currentPrice: String,
//                                     previousPrice: Double) -> UIColor {
//
//        guard let currentPriceDouble = Double(currentPrice) else {
//            return .black // Default color
//        }
//
//        if currentPriceDouble > previousPrice {
//            return UIColor(red: 0, green: 0.5, blue: 0, alpha: 1.0) // Dark green for price increases
//        } else if currentPriceDouble < previousPrice {
//            return UIColor(red: 0.5, green: 0.0, blue: 0, alpha: 1.0) // Dark green for price increases
//        } else {
//            return .black // Price stays the same, set color to black
//        }
//    }

    private func formatPrice(price: String) -> String {
        guard let priceDouble = Double(price) else {
            return "$0.00"
        }
        
        let formattedPrice: String
        
        switch priceDouble {
        case 0..<1.01:
            formattedPrice = formatCurrency(priceDouble,
                                            minimumFractionDigits: 8)
        case 1.01..<100:
            formattedPrice = formatCurrency(priceDouble,
                                            minimumFractionDigits: 4)
        default:
            formattedPrice = formatCurrency(priceDouble,
                                            minimumFractionDigits: 2)
        }
        
        return formattedPrice
    }

    private func formatCurrency(_ value: Double,
                                minimumFractionDigits: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US")
        numberFormatter.numberStyle = .currency
        numberFormatter.minimumFractionDigits = minimumFractionDigits
        
        return numberFormatter.string(from: NSNumber(value: value)) ?? "$0.00"
    }
}
