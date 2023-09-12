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
    @IBOutlet weak var wordNotFoundImage: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Properties
    
    private var viewModel: CryptoCurrencyListViewModelProtocol!
    private var previousPrices: [String: Double] = [:]
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupViewModel()
        setupAutoRefreshTimer()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        setupTableView()
        setupSearchBar()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(CryptoCurrencyTableViewCell.self, forCellReuseIdentifier: "CryptoCurrencyCell")
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
    }
    
    private func setupViewModel() {
        let apiClient = NetworkManager()
        viewModel = CryptoCurrencyListViewModel(networkManager: apiClient)
        
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
}

// MARK: - UITableViewDataSource

extension CryptoCurrencyListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredCryptoCurrencies.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCurrencyCell", for: indexPath) as! CryptoCurrencyTableViewCell
        let crypto = viewModel.filteredCryptoCurrencies[indexPath.row]
        let previousPrice = previousPrices[crypto.symbol] ?? 0.0
        
        cell.configure(with: crypto, previousPrice: previousPrice)
        previousPrices[crypto.symbol] = Double(crypto.priceUsd)
        
        return cell
    }
}

// MARK: - UISearchBarDelegate

extension CryptoCurrencyListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.updateFilteredCryptoCurrencies(with: searchText)
        tableView.reloadData()
    }
}
