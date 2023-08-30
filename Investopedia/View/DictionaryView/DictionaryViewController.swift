//
//  ViewController.swift
//  Investopedia
//
//  Created by João Ponte on 06/07/2023.
//

import UIKit

class DictionaryViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: DictionaryViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = DictionaryViewModel()
        setupTableView()
        viewModel.fetchTerms()
        
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TermCell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails",
           let destinationVC = segue.destination as? TermDetailViewController,
           let selectedTerm = sender as? FinancialTerm {
            destinationVC.selectedTerm = selectedTerm
        }
    }
}

extension DictionaryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.terms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TermCell", for: indexPath)
        if let term = viewModel.term(at: indexPath.row) {
            cell.textLabel?.text = term.word
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "showDetails", sender: viewModel.term(at: indexPath.row))
        }

}
