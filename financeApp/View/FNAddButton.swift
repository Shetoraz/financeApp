//
//  FNAddButton.swift
//  financeApp
//
//  Created by Anton on 9/27/20.
//

import UIKit

class FNAddButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupAppearance()
    }
    
    convenience init(title: String) {
        self.init()
        setTitle(title, for: .normal)
    }
    
    private func setupAppearance() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setRoundCorner()
        self.backgroundColor = .systemGreen
        self.setTitleColor(.white, for: .normal)
    }
    
    private func setRoundCorner() {
        self.layer.cornerRadius  = 8.0
        self.layer.masksToBounds = true
    }
}
