//
//  CryptoCurrencyStatisticsViewController.swift
//  Investopedia
//
//  Created by João Ponte on 18/09/2023.
//

import UIKit

class CryptoCurrencyStatisticsViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var coinTitle: UILabel!
    @IBOutlet weak var favouriteButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel: CryptoCurrencyStatisticsViewModelProtocol?
    
    deinit {
        viewModel?.stopRefreshTimer()
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel?.delegate = self
        updateUI()
        setTableViewFooter()
        updateFavoriteButtonUI()
        viewModel?.fetchData()
    }
    
    @IBAction func tapFavouriteButton(_ sender: Any) {
        viewModel?.toggleFavorite()
        updateFavoriteButtonUI()
    }
    
    // MARK: - Private Methods
    private func setupTableView() {
        tableView.dataSource = self
    }
    private func updateUI() {
        coinTitle.text = viewModel?.coinTitleText
    }
    
    private func setTableViewFooter() {
        // Create an empty footer view to hide extra empty cells
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 1))
        tableView.tableFooterView = footerView
    }
    
    private func updateFavoriteButtonUI() {
        guard let viewModel = viewModel else {
            return
        }
        
        if let selectedCrypto = viewModel.selectedCrypto {
            let isFavorite = viewModel.isFavorite(crypto: selectedCrypto)
            favouriteButton.image = isFavorite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        } else {
            favouriteButton.image = UIImage(systemName: "star")
        }
    }
}

// MARK: - UITableViewDataSource
extension CryptoCurrencyStatisticsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellType = CryptoCellType(rawValue: indexPath.row),
              let selectedCrypto = viewModel?.selectedCrypto else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoStatisticsCell", for: indexPath) as! CryptoStatisticsCell
        
        switch cellType {
        case .rank:
            cell.configureRank(with: selectedCrypto)
        case .marketCap:
            cell.configureMarketCap(with: selectedCrypto, viewModel: viewModel)
        case .usdPrice:
            cell.configureUsdPrice(with: selectedCrypto, viewModel: viewModel)
        case .supply:
            cell.configureSupply(with: selectedCrypto, viewModel: viewModel)
        case .volume24Hr:
            cell.configureVolume24Hr(with: selectedCrypto, viewModel: viewModel)
        case .change24Hr:
            cell.configureChange24Hr(with: selectedCrypto, viewModel: viewModel)
        }
        
        return cell
    }
    
}

// MARK: - CryptoCurrencyStatisticsViewModelDelegate
extension CryptoCurrencyStatisticsViewController: CryptoCurrencyStatisticsViewModelDelegate {
    func selectedCryptoDidChange() {
        DispatchQueue.main.async { [weak self] in
            if let selectedCrypto = self?.viewModel?.selectedCrypto {
                self?.coinTitle.text = "\(selectedCrypto.name) (\(selectedCrypto.symbol))"
            } else {
                self?.coinTitle.text = "N/A"
            }
            
            self?.reloadData()
        }
    }
    
    func reloadData() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}
