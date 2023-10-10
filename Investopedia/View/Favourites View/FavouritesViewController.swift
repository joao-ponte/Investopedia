//
//  FavouritesViewController.swift
//  Investopedia
//
//  Created by João Ponte on 04/10/2023.
//

import UIKit

class FavouritesViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var noFavouritesImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Properties
    internal var viewModel: FavouritesViewModelProtocol!
    private lazy var favouritesDataSource = FavouritesDataSource(viewModel: viewModel)
    private lazy var favouritesDelegate = FavouritesDelegate(viewModel: viewModel, viewController: self)
    
    // MARK: - View Lifecycle
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
        collectionView.delegate = favouritesDelegate
    }
}
// MARK: - UI Setup and Layout
extension FavouritesViewController {
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
    
    private func setupSearchBar() {
        searchBar.delegate = self
    }
}
// MARK: - ViewModel Setup
extension FavouritesViewController {
    private func setupViewModel() {
        let database = CoreDataManager()
        viewModel = FavouritesViewModel(database: database)
        viewModel.delegate = self
    }
}
// MARK: - Data Handling
extension FavouritesViewController {
    private func loadFavouriteCryptocurrencies() {
        viewModel.updateFavourites()
        collectionView.reloadData()
        updateNoFavouritesImageVisibility()
    }
    
    private func updateNoFavouritesImageVisibility() {
        if let favouriteCryptoCurrencies = viewModel.favouriteCryptoCurrencies, !favouriteCryptoCurrencies.isEmpty {
            noFavouritesImage.isHidden = true
        } else {
            noFavouritesImage.isHidden = false
        }
    }
}
// MARK: - Navigation
extension FavouritesViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCryptoStatistics",
           let cryptoStatisticsViewController = segue.destination as? CryptoCurrencyStatisticsViewController,
           let crypto = sender as? CryptoCurrency {
            let database = CoreDataManager()
            let networkManager = NetworkManager()
            
            cryptoStatisticsViewController.viewModel = CryptoCurrencyStatisticsViewModel(database: database, networkManager: networkManager)
            cryptoStatisticsViewController.viewModel?.setSelectedCrypto(crypto)
        }
    }
}
// MARK: - FavouritesViewModelDelegate
extension FavouritesViewController: FavouritesViewModelDelegate {
    func filteredCryptoCurrenciesUpdated() {
        collectionView.reloadData()
    }
}

// MARK: - UISearchBarDelegate
extension FavouritesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.updateFilteredCryptoCurrencies(with: searchText)
    }
}
