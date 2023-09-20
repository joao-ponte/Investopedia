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
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel: CryptoCurrencyStatisticsViewModelProtocol?

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel?.delegate = self
        updateUI()
    }

    // MARK: - Private Methods
    private func setupTableView() {
        tableView.dataSource = self
    }
    private func updateUI() {
        coinTitle.text = viewModel?.coinTitleText
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
        if let selectedCrypto = viewModel?.selectedCrypto {
            coinTitle.text = "\(selectedCrypto.name) (\(selectedCrypto.symbol))"
        } else {
            coinTitle.text = "N/A"
        }
        
        tableView.reloadData()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}
