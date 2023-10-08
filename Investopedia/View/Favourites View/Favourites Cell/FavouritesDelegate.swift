//
//  FavouritesDelegate.swift
//  Investopedia
//
//  Created by João Ponte on 04/10/2023.
//

import UIKit

class FavouritesDelegate: NSObject, UICollectionViewDelegate {
    
    private let viewModel: FavouritesViewModelProtocol

    init(viewModel: FavouritesViewModelProtocol) {
        self.viewModel = viewModel
    }
}
