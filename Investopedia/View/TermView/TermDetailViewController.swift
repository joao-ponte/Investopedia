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
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var viewModel: TermDetailViewModelProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func previousButtonTapped(_ sender: UIButton) {
        viewModel.selectPreviousTerm()
        setupUI()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        viewModel.selectNextTerm()
        setupUI()
    }
    
    private func setupUI() {
        if let term = viewModel.selectedTerm {
            meaningLabel.text = term.meaning
            exampleLabel.text = term.example
            wordLabel.text = term.word
            
            previousButton.isEnabled = viewModel.canSelectPreviousTerm
            nextButton.isEnabled = viewModel.canSelectNextTerm
        }
    }
}
