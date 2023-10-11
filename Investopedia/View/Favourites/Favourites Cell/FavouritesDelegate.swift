//
//  FavouritesDelegate.swift
//  Investopedia
//
//  Created by João Ponte on 04/10/2023.
//

import UIKit

class FavouritesDelegate: NSObject, UICollectionViewDelegate {
    
    private let viewModel: FavouritesViewModelProtocol
    private weak var viewController: UIViewController?
    
    init(viewModel: FavouritesViewModelProtocol, viewController: UIViewController) {
        self.viewModel = viewModel
        self.viewController = viewController
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cryptoEntity = viewModel.favouriteCryptoCurrencies?[indexPath.item] else {
            return
        }
        
        let id = cryptoEntity.id ?? "N/A"
        let rank = cryptoEntity.rank ?? "N/A"
        let symbol = cryptoEntity.symbol ?? "N/A"
        let name = cryptoEntity.name ?? "N/A"
        let supply = cryptoEntity.supply ?? "N/A"
        let maxSupply = cryptoEntity.maxSupply ?? "N/A"
        let marketCapUsd = cryptoEntity.marketCapUsd ?? "N/A"
        let volumeUsd24Hr = cryptoEntity.volumeUsd24Hr ?? "N/A"
        let priceUsd = cryptoEntity.priceUsd ?? "N/A"
        let changePercent24Hr = cryptoEntity.changePercent24Hr ?? "N/A"
        let vwap24Hr = cryptoEntity.vwap24Hr ?? "N/A"
        let explorer = cryptoEntity.explorer ?? "N/A"
        
        let crypto = CryptoCurrency(
            id: id,
            rank: rank,
            symbol: symbol,
            name: name,
            supply: supply,
            maxSupply: maxSupply,
            marketCapUsd: marketCapUsd,
            volumeUsd24Hr: volumeUsd24Hr,
            priceUsd: priceUsd,
            changePercent24Hr: changePercent24Hr,
            vwap24Hr: vwap24Hr,
            explorer: explorer
        )
        
        if let viewController = self.viewController as? FavouritesViewController {
            viewController.performSegue(withIdentifier: "showCryptoStatistics", sender: crypto)
        }
    }
}
