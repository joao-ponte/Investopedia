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
    @IBOutlet weak var searchBar: UISearchBar!
    
    internal var viewModel: FavouritesViewModelProtocol!
    private lazy var favouritesDataSource = FavouritesDataSource(viewModel: viewModel)
    private lazy var favouritesDelegate = FavouritesDelegate(viewModel: viewModel)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadFavouriteCryptocurrencies()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupUI()
        configureFavouritesLayout()
        setupSearchBar()
    }
    
    private func configureFavouritesLayout() {
        let space: CGFloat = 2
        let dimension = (view.frame.size.width - (2 * space)) / 2 // Display 2 cells in a row
        
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
        viewModel.delegate = self
    }
    
    private func loadFavouriteCryptocurrencies() {
        viewModel.updateFavourites()
        collectionView.reloadData()
        noFavouritesImage.isHidden = viewModel.favouriteCryptoCurrencies?.isEmpty ?? true
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
    }
}

extension FavouritesViewController: FavouritesViewModelDelegate {
    func filteredCryptoCurrenciesUpdated() {
        collectionView.reloadData()
    }
}

extension FavouritesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.updateFilteredCryptoCurrencies(with: searchText)
    }
}
