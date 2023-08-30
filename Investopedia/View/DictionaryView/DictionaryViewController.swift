//
//  ViewController.swift
//  Investopedia
//
//  Created by João Ponte on 06/07/2023.
//

import UIKit

class DictionaryViewController: UIViewController {

    // MARK: - IBOutlets
    
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
        viewModel = DictionaryViewModel()
        viewModel.fetchTerms()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TermCell")
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.terms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TermCell", for: indexPath)
        if let term = viewModel.term(at: indexPath.row) {
            configureCell(cell, with: term)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: viewModel.term(at: indexPath.row))
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func configureCell(_ cell: UITableViewCell, with term: FinancialTerm) {
        cell.textLabel?.text = term.word
        cell.textLabel?.numberOfLines = 0
    }
}
