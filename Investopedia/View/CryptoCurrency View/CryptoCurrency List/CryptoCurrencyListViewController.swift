//
//  CryptoCurrencyListView.swift
//  Investopedia
//
//  Created by João Ponte on 02/09/2023.
//
// MARK: - CryptoCurrencyListViewController.swift
import UIKit

class CryptoCurrencyListViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cryptoNotFoundImage: UIImageView!
    @IBOutlet weak var noConnectionImage: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Properties
    
    internal var viewModel: CryptoCurrencyListViewModelProtocol!
    private var previousPrices: [String: Double] = [:]
    private let cellIdentifier = "CryptoCurrencyCell"
    private let segueIdentifier = "showCryptoDetails"
    private let networkUtility: NetworkUtility = NetworkUtility()
    private let noResultImage = UIImage(named: "NoResultImage")
    private let noConnectionImageSmile = UIImage(named: "NoConnection")
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupViewModel()
        setupAutoRefreshTimer()
        setupTableViewDelegate()
        setupNavigationBar()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        setupTableView()
        setupSearchBar()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(CryptoCurrencyTableViewCell.self,
                           forCellReuseIdentifier: cellIdentifier)
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
    }
    
    private func setupViewModel() {
        let apiClient = NetworkManager()
        let networkUtility = NetworkUtility()
        viewModel = CryptoCurrencyListViewModel(networkManager: apiClient,
                                                networkUtility: networkUtility)
        
        viewModel.fetchData { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    private func setupAutoRefreshTimer() {
        let timer = Timer.scheduledTimer(withTimeInterval: 40, repeats: true) { [weak self] _ in
            self?.viewModel.fetchData {
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
        
        timer.fire()
    }
    
    private func setupTableViewDelegate() {
        tableView.delegate = self
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
}

// MARK: - UITableViewDataSource

extension CryptoCurrencyListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        let numberOfCrypto = viewModel.filteredCryptoCurrencies.count
        cryptoNotFoundImage.isHidden = numberOfCrypto != 0
        return numberOfCrypto

    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CryptoCurrencyTableViewCell
        let crypto = viewModel.filteredCryptoCurrencies[indexPath.row]
        let previousPrice = previousPrices[crypto.symbol] ?? 0.0
        
        cell.configure(with: crypto, previousPrice: previousPrice)
        previousPrices[crypto.symbol] = Double(crypto.priceUsd)
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension CryptoCurrencyListViewController: UITableViewDelegate {
    
//    func tableView(_ tableView: UITableView,
//                   didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: segueIdentifier,
//                     sender: viewModel.filteredCryptoCurrencies[indexPath.row])
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
}

// MARK: - UISearchBarDelegate

extension CryptoCurrencyListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar,
                   textDidChange searchText: String) {
        viewModel.updateFilteredCryptoCurrencies(with: searchText)
        tableView.reloadData()
    }
}

// MARK: - UIScrollViewDelegate

extension CryptoCurrencyListViewController: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.resignFirstResponder()
    }
}
