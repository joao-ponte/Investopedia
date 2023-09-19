//
//  CryptoCurrencyStatisticsViewController.swift
//  Investopedia
//
//  Created by João Ponte on 18/09/2023.
//

import UIKit

class CryptoCurrencyStatisticsViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel: CryptoCurrencyStatisticsViewModelProtocol?

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel?.delegate = self
    }

    // MARK: - Private Methods
    private func setupTableView() {
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension CryptoCurrencyStatisticsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cryptoStatisticsCell", for: indexPath) as! CryptoStatisticsCell

        switch indexPath.row {
        case 0:
            if let selectedCrypto = viewModel?.selectedCrypto {
                cell.configureRank(with: selectedCrypto)
            } else {
                cell.configureNoData(title: "Rank", value: "N/A")
            }
        case 1:
            if let selectedCrypto = viewModel?.selectedCrypto {
                cell.configureMarketCap(with: selectedCrypto)
            } else {
                cell.configureNoData(title: "Market Cap", value: "N/A")
            }
        case 2:
            if let selectedCrypto = viewModel?.selectedCrypto {
                cell.configureSupply(with: selectedCrypto)
            } else {
                cell.configureNoData(title: "Supply", value: "N/A")
            }
        case 3:
            if let selectedCrypto = viewModel?.selectedCrypto {
                cell.configureVolume24Hr(with: selectedCrypto)
            } else {
                cell.configureNoData(title: "Volume (24Hr)", value: "N/A")
            }
        case 4:
            if let selectedCrypto = viewModel?.selectedCrypto {
                cell.configureChange24Hr(with: selectedCrypto)
            } else {
                cell.configureNoData(title: "Change (24Hr)", value: "N/A")
            }
        default:
            cell.configureNoData(title: "", value: "")
        }

        return cell
    }
}


// MARK: - CryptoCurrencyStatisticsViewModelDelegate
extension CryptoCurrencyStatisticsViewController: CryptoCurrencyStatisticsViewModelDelegate {
    func selectedCryptoDidChange() {
        tableView.reloadData()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}
