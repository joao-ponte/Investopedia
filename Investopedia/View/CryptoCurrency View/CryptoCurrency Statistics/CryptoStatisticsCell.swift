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
    
    func configureMarketCap(with crypto: CryptoCurrency, viewModel: CryptoCurrencyStatisticsViewModelProtocol?) {
        textLabel?.text = "Market Cap"
        accessoryType = .disclosureIndicator

        let marketCapLabel = UILabel()
        marketCapLabel.text = viewModel?.formattedMarketCap(for: crypto) ?? "N/A"

        marketCapLabel.sizeToFit()
        accessoryView = marketCapLabel
    }
    
    func configureSupply(with crypto: CryptoCurrency, viewModel: CryptoCurrencyStatisticsViewModelProtocol?) {
        textLabel?.text = "Supply"
        accessoryType = .disclosureIndicator

        let supplyLabel = UILabel()
        if crypto.supply != nil {
            supplyLabel.text = viewModel?.formattedSupply(for: crypto) ?? "N/A"
        } else {
            supplyLabel.text = "N/A"
        }

        supplyLabel.sizeToFit()
        accessoryView = supplyLabel
    }
    
    func configureUsdPrice(with crypto: CryptoCurrency, viewModel: CryptoCurrencyStatisticsViewModelProtocol?) {
        textLabel?.text = "Price"
        accessoryType = .disclosureIndicator
        
        let priceUsdLabel = UILabel()
        priceUsdLabel.text = viewModel?.formattedUsdPrice(for: crypto) ?? "N/A"
        
        priceUsdLabel.sizeToFit()
        accessoryView = priceUsdLabel
    }
    
    func configureVolume24Hr(with crypto: CryptoCurrency, viewModel: CryptoCurrencyStatisticsViewModelProtocol?) {
        textLabel?.text = "Volume (24Hr)"
        accessoryType = .disclosureIndicator
        
        let volume24HrLabel = UILabel()
        if let volumeUsd24Hr = crypto.volumeUsd24Hr {
            volume24HrLabel.text = viewModel?.formattedVolume24Hr(for: crypto) ?? "N/A"
        } else {
            volume24HrLabel.text = "N/A"
        }
        
        volume24HrLabel.sizeToFit()
        accessoryView = volume24HrLabel
    }
    
    func configureChange24Hr(with crypto: CryptoCurrency, viewModel: CryptoCurrencyStatisticsViewModelProtocol?) {
        textLabel?.text = "Change (24Hr)"
        accessoryType = .disclosureIndicator
        
        let change24HrLabel = UILabel()
        if let changePercentage = Double(crypto.changePercent24Hr ?? "0.0") {
            let formattedChange = viewModel?.formattedChange24Hr(for: crypto)
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
        
        let noDataLabel = UILabel()
        noDataLabel.text = "N/A"
        noDataLabel.sizeToFit()
        accessoryView = noDataLabel
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

