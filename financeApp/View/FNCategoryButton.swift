//
//  CategoryCell.swift
//  financeApp
//
//  Created by Anton on 9/22/20.
//

import UIKit

class FNCategoryButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupAppearance()
    }
    
    private func setupAppearance() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setRoundCorner()
        self.setupGradientBackgroundColor()
    }
    
    private func setupGradientBackgroundColor() {
        let colors = cellRandomBackgroundColors()
        self.setGradient(colorOne: colors[0], colorTwo: colors[1])
    }
    
    private func setRoundCorner() {
        self.layer.cornerRadius  = 8.0
        self.layer.masksToBounds = true
        self.layer.borderWidth   = 1.0
        self.layer.borderColor   = UIColor.clear.cgColor
    }
}
