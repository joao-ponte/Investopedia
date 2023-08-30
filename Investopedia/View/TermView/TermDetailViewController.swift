//
//  MeaningView.swift
//  Investopedia
//
//  Created by João Ponte on 06/07/2023.
//

import UIKit

class TermDetailViewController: UIViewController {
    
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var exampleLabel: UILabel!
    @IBOutlet weak var meaningLabel: UILabel!
    
    var viewModel: TermDetailViewModelProtocol!
    var selectedTerm: FinancialTerm?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = TermDetailViewModel()
        setupUI()
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    private func setupUI() {
        if let term = selectedTerm {
            meaningLabel.text = term.meaning
            exampleLabel.text = term.example
            wordLabel.text = term.word
        }
    }
}



