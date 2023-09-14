//
//  ViewController.swift
//  Investopedia
//
//  Created by João Ponte on 06/07/2023.
//

import UIKit

class DictionaryViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var wordNotFoundImage: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var viewModel: DictionaryViewModelProtocol!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        setupTableView()
        setupNavigationBar()
        setupViewModel()
        searchBar.delegate = self
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "TermCell")
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupViewModel() {
        viewModel = DictionaryViewModel()
        viewModel.fetchTerms()
        viewModel.updateFilteredTerms(with: "")
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails",
           let destinationVC = segue.destination as? TermDetailViewController,
           let selectedTerm = sender as? FinancialTerm {
            let termDetailViewModel = TermDetailViewModel(terms: viewModel.terms, selectedTerm: selectedTerm)
            destinationVC.viewModel = termDetailViewModel
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension DictionaryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        let numberOfFilteredTerms = viewModel.filteredTerms.count
        wordNotFoundImage.isHidden = numberOfFilteredTerms != 0
        return numberOfFilteredTerms
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TermCell",
                                                 for: indexPath)
        let term = viewModel.filteredTerms[indexPath.row]
        configureCell(cell, with: term)
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails",
                     sender: viewModel.filteredTerms[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func configureCell(_ cell: UITableViewCell,
                               with term: FinancialTerm) {
        cell.textLabel?.text = term.word
        cell.textLabel?.numberOfLines = 0
    }
}

// MARK: - UISearchBarDelegate

extension DictionaryViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar,
                   textDidChange searchText: String) {
        viewModel.updateFilteredTerms(with: searchText)
        tableView.reloadData()
    }
}
// MARK: - UISrollViewDelegate
extension DictionaryViewController: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchBar.resignFirstResponder()
    }
}
