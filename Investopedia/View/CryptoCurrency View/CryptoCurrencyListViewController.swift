//
//  CryptoCurrencyListView.swift
//  Investopedia
//
//  Created by João Ponte on 02/09/2023.
//
// MARK: - CryptoCurrencyListViewController.swift
import UIKit

class CryptoCurrencyListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel: CryptoCurrencyListViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupViewModel()
        
        let timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] _ in
            self?.viewModel.fetchData {
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }

        timer.fire()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(CryptoCurrencyTableViewCell.self, forCellReuseIdentifier: "CryptoCurrencyCell")
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
}

extension CryptoCurrencyListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCurrencyCell", for: indexPath) as! CryptoCurrencyTableViewCell
        let crypto = viewModel.cryptoCurrency(atIndex: indexPath.row)
        
        cell.configure(with: crypto)
        
        return cell
    }
}
