//
//  CryptoStatisticsCell.swift
//  Investopedia
//
//  Created by João Ponte on 18/09/2023.
//

import UIKit

class CryptoStatisticsCell: UITableViewCell {
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Configuration
    
    // Configure for general data
    func configureRank(with crypto: CryptoCurrency) {
        textLabel?.text = "Rank"
        accessoryType = .disclosureIndicator
        
        let rankLabel = UILabel()
        rankLabel.text = crypto.rank
        rankLabel.sizeToFit()
        accessoryView = rankLabel
    }
    
    // Configure for general data
    func configureMarketCap(with crypto: CryptoCurrency) {
        textLabel?.text = "Market Cap"
        accessoryType = .disclosureIndicator

        let marketCapLabel = UILabel()
        if let marketCapUsd = crypto.marketCapUsd, let marketCap = Double(marketCapUsd) {
            marketCapLabel.text = formatCurrency(marketCap, decimalPlaces: 0)
        } else {
            marketCapLabel.text = "N/A"
        }

        marketCapLabel.sizeToFit()
        accessoryView = marketCapLabel
    }
    
    func configureSupply(with crypto: CryptoCurrency) {
        textLabel?.text = "Supply"
        accessoryType = .disclosureIndicator

        let supplyLabel = UILabel()
        if let supply = crypto.supply, let supplyValue = Double(supply) {
            supplyLabel.text = formatNumber(supplyValue)
        } else {
            supplyLabel.text = "N/A"
        }

        supplyLabel.sizeToFit()
        accessoryView = supplyLabel
    }
    
    func configureUsdPrice(with crypto: CryptoCurrency) {
        textLabel?.text = "Price"
        accessoryType = .disclosureIndicator
        
        let priceUsdLabel = UILabel()
        let priceUsd = crypto.priceUsd
        priceUsdLabel.text = formatPrice(price: priceUsd)
        
        priceUsdLabel.sizeToFit()
        accessoryView = priceUsdLabel
    }
    
    func configureVolume24Hr(with crypto: CryptoCurrency) {
        textLabel?.text = "Volume (24Hr)"
        accessoryType = .disclosureIndicator
        
        let volume24HrLabel = UILabel()
        if let volumeUsd24Hr = crypto.volumeUsd24Hr, let volume = Double(volumeUsd24Hr) {
            volume24HrLabel.text = formatCurrency(volume, decimalPlaces: 0)
        } else {
            volume24HrLabel.text = "N/A"
        }
        
        volume24HrLabel.sizeToFit()
        accessoryView = volume24HrLabel
    }
    
    func configureChange24Hr(with crypto: CryptoCurrency) {
        textLabel?.text = "Change (24Hr)"
        accessoryType = .disclosureIndicator
        
        let change24HrLabel = UILabel()
        if let changePercentage = Double(crypto.changePercent24Hr ?? "0.0") {
            let formattedChange = formatAsPercentage(changePercentage)
            change24HrLabel.text = formattedChange
            
            if changePercentage >= 0 {
                change24HrLabel.textColor = .darkGreen
            } else {
                change24HrLabel.textColor = .darkRed
            }
        } else {
            change24HrLabel.text = "N/A"
            change24HrLabel.textColor = .black
        }
        
        change24HrLabel.sizeToFit()
        accessoryView = change24HrLabel
    }
    
    func configureNoData(title: String, value: String) {
        textLabel?.text = title
        accessoryType = .disclosureIndicator
        
        let noDataLable = UILabel()
        noDataLable.text = "N/A"
        noDataLable.sizeToFit()
        accessoryView = noDataLable
    }
    
    // Helper method to format currency based on conditions
    private func formatCurrency(_ value: Double, decimalPlaces: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US")
        numberFormatter.numberStyle = .currency
        numberFormatter.minimumFractionDigits = decimalPlaces
        numberFormatter.maximumFractionDigits = decimalPlaces
        
        return numberFormatter.string(from: NSNumber(value: value)) ?? "N/A"
    }
    
    private func formatAsPercentage(_ value: Double) -> String {
        // Divide the value by 100
        let adjustedValue = value / 100.0
        
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US")
        numberFormatter.numberStyle = .percent
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        
        return numberFormatter.string(from: NSNumber(value: adjustedValue)) ?? "N/A"
    }
    
    private func formatNumber(_ value: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US")
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 0
        
        return numberFormatter.string(from: NSNumber(value: value)) ?? "N/A"
    }
    
    private func formatPrice(price: String) -> String {
        guard let priceDouble = Double(price) else {
            return "$0.00"
        }
        
        let formattedPrice: String
        
        switch priceDouble {
        case 0..<1.01:
            formattedPrice = formatCurrency(priceDouble, decimalPlaces: 8)
        case 1.01..<100:
            formattedPrice = formatCurrency(priceDouble, decimalPlaces: 4)
        default:
            formattedPrice = formatCurrency(priceDouble, decimalPlaces: 2)
        }
        return formattedPrice
    }
}

extension UIColor {
    static var darkGreen: UIColor {
        return UIColor(red: 0.0, green: 0.5, blue: 0.0, alpha: 1.0)
    }

    static var darkRed: UIColor {
        return UIColor(red: 0.5, green: 0.0, blue: 0.0, alpha: 1.0)
    }
}

