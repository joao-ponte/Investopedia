//
//  MeaningView.swift
//  Investopedia
//
//  Created by João Ponte on 06/07/2023.
//

import UIKit

class TermDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var exampleLabel: UILabel!
    @IBOutlet weak var meaningLabel: UILabel!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - Properties
    
    var viewModel: TermDetailViewModelProtocol!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    
    @IBAction func previousButtonTapped(_ sender: UIButton) {
        viewModel.selectPreviousTerm()
        setupUI()
        updateButtonTitles()
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        viewModel.selectNextTerm()
        setupUI()
        updateButtonTitles()
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        if let term = viewModel.selectedTerm {
            meaningLabel.text = term.meaning
            exampleLabel.text = term.example
            wordLabel.text = term.word
            
            updateButtonStates()
        }
    }
    
    private func updateButtonStates() {
        previousButton.isEnabled = viewModel.canSelectPreviousTerm
        nextButton.isEnabled = viewModel.canSelectNextTerm
    }
    
    private func updateButtonTitles() {
        previousButton.setTitle(viewModel.previousTerm()?.word, for: .normal)
        nextButton.setTitle(viewModel.nextTerm()?.word, for: .normal)
    }
}
