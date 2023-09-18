//
//  CryptoCurrencyStatisticsViewController.swift
//  Investopedia
//
//  Created by João Ponte on 18/09/2023.
//

import UIKit

class CryptoCurrencyStatisticsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var viewModel: CryptoCurrencyStatisticsViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        viewModel?.delegate = self
    }
}

extension CryptoCurrencyStatisticsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoStatisticsCell", for: indexPath)
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Rank: \(viewModel?.selectedCrypto?.rank ?? "-")"
        case 1:
            cell.textLabel?.text = "Market Cap: \(viewModel?.selectedCrypto?.marketCapUsd ?? "-")"
        case 2:
            cell.textLabel?.text = "Supply: \(viewModel?.selectedCrypto?.supply ?? "-")"
        case 3:
            cell.textLabel?.text = "Volume (24Hr): \(viewModel?.selectedCrypto?.volumeUsd24Hr ?? "-")"
        case 4:
            cell.textLabel?.text = "Change (24Hr): \(viewModel?.selectedCrypto?.changePercent24Hr ?? "-")"
        default:
            cell.textLabel?.text = ""
        }
        return cell
    }
}

extension CryptoCurrencyStatisticsViewController: CryptoCurrencyStatisticsViewModelDelegate {
    func selectedCryptoDidChange() {
        tableView.reloadData()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}
