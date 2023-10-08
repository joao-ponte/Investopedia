//
//  FavouritesViewController.swift
//  Investopedia
//
//  Created by João Ponte on 04/10/2023.
//

import UIKit

class FavouritesViewController: UIViewController {
    
    @IBOutlet weak var noFavouritesImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    
    internal var viewModel: FavouritesViewModelProtocol!
    private lazy var favouritesDataSource = FavouritesDataSource(viewModel: viewModel)
    private lazy var favouritesDelegate = FavouritesDelegate(viewModel: viewModel)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupUI()
        loadFavouriteCryptocurrencies()
        configureFavouritesLayout()
    }
    

    private func configureFavouritesLayout() {
        
        let space: CGFloat = 2
        let dimension = (view.frame.size.width - (2 * space)) / space

        flowLayout.minimumLineSpacing = space
        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
    }
    
    private func setupUI() {
        collectionView.dataSource = favouritesDataSource
        collectionView.delegate = favouritesDelegate
    }
    
    private func setupViewModel() {
        let database = CoreDataManager()
        viewModel = FavouritesViewModel(database: database)
    }
    
    private func loadFavouriteCryptocurrencies() {
        guard let favouriteCryptoCurrencies = viewModel.favouriteCryptoCurrencies else {
            return
        }
        collectionView.dataSource = favouritesDataSource
        collectionView.delegate = favouritesDelegate
        collectionView.reloadData()
        noFavouritesImage.isHidden = !favouriteCryptoCurrencies.isEmpty
    }
}
