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

    func configure(with crypto: CryptoCurrency) {
        textLabel?.text = crypto.symbol
        detailTextLabel?.text = crypto.name
        accessoryType = .disclosureIndicator

        let priceLabel = UILabel()
        priceLabel.text = String(format: "$%.2f", Double(crypto.priceUsd) ?? 0.0)
        priceLabel.sizeToFit()
        accessoryView = priceLabel
    }
}
