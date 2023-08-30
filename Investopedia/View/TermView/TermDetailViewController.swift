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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    private func setupUI() {
        if let term = viewModel.selectedTerm {
            meaningLabel.text = term.meaning
            exampleLabel.text = term.example
            wordLabel.text = term.word
        }
    }
}



