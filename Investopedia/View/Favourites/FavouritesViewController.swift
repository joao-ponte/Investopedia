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
    
    // MARK: - Properties
    internal var viewModel: FavouritesViewModelProtocol!
    private lazy var favouritesDataSource = FavouritesDataSource(viewModel: viewModel)
    private lazy var favouritesDelegate = FavouritesDelegate(viewModel: viewModel, viewController: self)
    private var autoRefreshTimer: Timer?
    
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
        collectionView.delegate = favouritesDelegate
        setupAutoRefreshTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        autoRefreshTimer?.invalidate()
    }
    
    private func setupAutoRefreshTimer() {
        autoRefreshTimer?.invalidate()
        
        autoRefreshTimer = Timer.scheduledTimer(withTimeInterval: 40, repeats: true) { [weak self] _ in
            self?.loadFavouriteCryptocurrencies()
        }
        autoRefreshTimer?.fire()
    }
}
// MARK: - UI Setup and Layout
extension FavouritesViewController {
    
    private func configureFavouritesLayout() {
        let spacing: CGFloat = 10
        let maxCellWidth = collectionView.frame.width - 22.5 * spacing // Adjust as needed
        let itemWidth = min(maxCellWidth, collectionView.frame.width)
        let itemHeight = itemWidth

        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        collectionView.collectionViewLayout = layout
    }

    
    private func setupUI() {
        collectionView.dataSource = favouritesDataSource
        collectionView.delegate = favouritesDelegate
    }
}
// MARK: - ViewModel Setup
extension FavouritesViewController {
    private func setupViewModel() {
        let database = CoreDataManager()
        viewModel = FavouritesViewModel(database: database)
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
