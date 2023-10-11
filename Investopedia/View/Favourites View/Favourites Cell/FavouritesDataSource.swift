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
        let formattedPrice = PriceFormatter.formatUsdPrice(price: crypto.priceUsd ?? "N/A")
        let formattedPercentage = NumberFormatter.formatPercentage(crypto.changePercent24Hr)
        
        cell.cryptoName.text = crypto.name
        cell.cryptoPrice.text = "Price: \(formattedPrice)"
        cell.cryptoChange24Hrs.text = "Change 24Hrs: \(formattedPercentage)"
    }
}
