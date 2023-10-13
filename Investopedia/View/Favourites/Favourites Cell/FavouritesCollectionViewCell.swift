//
//  FavouritesCollectionViewCell.swift
//  Investopedia
//
//  Created by João Ponte on 04/10/2023.
//

import UIKit

class FavouritesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cryptoChange24Hrs: UILabel!
    @IBOutlet weak var cryptoPrice: UILabel!
    @IBOutlet weak var cryptoName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        configureCell()
    }
    
    private func configureCell() {
        updateBorderColor()
        roundCorners()
    }
    
    private func updateBorderColor() {
        if self.traitCollection.userInterfaceStyle == .dark {
            layer.borderColor = UIColor.white.cgColor // Set border color to white for dark mode
        } else {
            layer.borderColor = UIColor.black.cgColor // Set border color to gray for light mode
        }
        layer.borderWidth = 1.0
    }
    
    private func roundCorners() {
        layer.cornerRadius = 10 // Adjust the corner radius to your liking
        layer.masksToBounds = true
    }
}
