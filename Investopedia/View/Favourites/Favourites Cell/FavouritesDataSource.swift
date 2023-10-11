//
//  FavouritesDataSource.swift
//  Investopedia
//
//  Created by João Ponte on 04/10/2023.
//

import UIKit

class FavouritesDataSource: NSObject, UICollectionViewDataSource {
    
    private let viewModel: FavouritesViewModelProtocol
    
    init(viewModel: FavouritesViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return viewModel.favoriteCryptoCurrencies?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavouritesCell", for: indexPath) as? FavouritesCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if let crypto = viewModel.favouriteCryptoCurrencies?[indexPath.item] {
            configureCell(cell, with: crypto)
        } else {
            print("Crypto is nil")
        }
        
        return cell
    }
    
    private func configureCell(_ cell: FavouritesCollectionViewCell, with crypto: CryptoCurrencyEntity) {
        if let priceUsd = crypto.priceUsd {
            let formattedPrice = PriceFormatter.formatUsdPrice(price: priceUsd)
            cell.cryptoPrice.text = "Price: \(formattedPrice)"
        } else {
            cell.cryptoPrice.text = "Price: N/A"
        }
        
        if let changePercent24Hr = crypto.changePercent24Hr {
            if let percentage = Double(changePercent24Hr) {
                let formattedPercentage = NumberFormatter.formatPercentage(percentage)
                cell.cryptoChange24Hrs.text = formattedPercentage
                
                // Determine text color based on the sign of the percentage
                if percentage >= 0 {
                    cell.cryptoChange24Hrs.textColor = .darkGreen
                } else {
                    cell.cryptoChange24Hrs.textColor = .darkRed
                }
            } else {
                cell.cryptoChange24Hrs.text = "N/A"
                cell.cryptoChange24Hrs.textColor = .black
            }
        } else {
            cell.cryptoChange24Hrs.text = "N/A"
            cell.cryptoChange24Hrs.textColor = .black
        }
        
        if let name = crypto.name, let symbol = crypto.symbol {
            cell.cryptoName.text = "\(symbol) (\(name))"
        } else {
            cell.cryptoName.text = "N/A"
        }
        
        // Configure label to have multiple lines
        cell.cryptoName.numberOfLines = 0
        cell.cryptoPrice.numberOfLines = 0
        cell.cryptoChange24Hrs.numberOfLines = 0
        cell.cryptoName.preferredMaxLayoutWidth = cell.cryptoName.frame.size.width
        cell.cryptoName.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
    }

}
