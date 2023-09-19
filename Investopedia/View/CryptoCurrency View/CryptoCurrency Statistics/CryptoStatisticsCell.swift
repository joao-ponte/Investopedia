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
            marketCapLabel.text = formatCurrency(marketCap, showDecimal: false)
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
            supplyLabel.text = formatCurrency(supplyValue, showDecimal: false)
        } else {
            supplyLabel.text = "N/A"
        }
        
        supplyLabel.sizeToFit()
        accessoryView = supplyLabel
    }
    
    func configureVolume24Hr(with crypto: CryptoCurrency) {
        textLabel?.text = "Volume (24Hr)"
        accessoryType = .disclosureIndicator
        
        let volume24HrLabel = UILabel()
        if let volumeUsd24Hr = crypto.volumeUsd24Hr, let volume = Double(volumeUsd24Hr) {
            volume24HrLabel.text = formatCurrency(volume, showDecimal: false)
        } else {
            volume24HrLabel.text = formatCurrency(0.0, showDecimal: false)
        }
        
        volume24HrLabel.sizeToFit()
        accessoryView = volume24HrLabel
    }
    
    func configureChange24Hr(with crypto: CryptoCurrency) {
        textLabel?.text = "Change (24Hr)"
        accessoryType = .disclosureIndicator
        
        let change24HrLabel = UILabel()
        if let changePercentage = Double(crypto.changePercent24Hr ?? "0.0") {
            change24HrLabel.text = formatCurrency(changePercentage, showDecimal: true, isPercentage: true)
        } else {
            change24HrLabel.text = "N/A"
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
    private func formatCurrency(_ value: Double, showDecimal: Bool, isPercentage: Bool = false) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US")
        
        if isPercentage {
            numberFormatter.numberStyle = .percent
            numberFormatter.minimumFractionDigits = 2
            numberFormatter.maximumFractionDigits = 2
        } else {
            numberFormatter.numberStyle = .currency
            numberFormatter.minimumFractionDigits = showDecimal ? 2 : 0
            numberFormatter.maximumFractionDigits = showDecimal ? 2 : 0
        }
        
        return numberFormatter.string(from: NSNumber(value: value)) ?? "N/A"
    }
}
