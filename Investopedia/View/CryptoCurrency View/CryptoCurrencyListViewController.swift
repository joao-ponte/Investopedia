//
//  CryptoCurrencyListView.swift
//  Investopedia
//
//  Created by João Ponte on 02/09/2023.
//

import UIKit

class CryptoCurrencyListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: CryptoCurrencyListViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        let apiClient = CoinCapAPI(client: HttpClient())
        
        viewModel = CryptoCurrencyListViewModel(apiClient: apiClient)
        
        // Fetch data and reload table view
        viewModel.fetchData { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension CryptoCurrencyListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCurrencyCell", for: indexPath)
        let crypto = viewModel.cryptoCurrency(atIndex: indexPath.row)
        
        // Configure the cell with cryptocurrency data
        cell.textLabel?.text = crypto.symbol
        cell.detailTextLabel?.text = crypto.name
        cell.accessoryType = .disclosureIndicator
        
        // Format and display the price
        let priceLabel = UILabel()
        priceLabel.text = String(format: "$%.2f", Double(crypto.priceUsd) ?? 0.0)
        priceLabel.sizeToFit()
        cell.accessoryView = priceLabel
        
        return cell
    }
}
