//
//  MeaningView.swift
//  Investopedia
//
//  Created by João Ponte on 06/07/2023.
//

import UIKit

class TermDetailViewController: UIViewController {
    
    
    @IBOutlet weak var exampleLabel: UILabel!
    @IBOutlet weak var meaningLabel: UILabel!
    
    var viewModel: TermDetailViewModelProtocol!
    var selectedTerm: FinancialTerm?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = TermDetailViewModel()
        setupUI()
    }
    
    private func setupUI() {
        if let term = selectedTerm {
            meaningLabel.text = "Meaning: " + term.meaning
            exampleLabel.text = "Example: " + term.example
        }
    }
}



