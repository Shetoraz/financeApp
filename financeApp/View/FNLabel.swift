//
//  CustomButton.swift
//  financeApp
//
//  Created by Anton on 9/22/20.
//

import UIKit

class FNLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupButton()
    }
    
    convenience init(text: String) {
        self.init()
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor                                 = .systemGreen
        self.font                                      = UIFont.boldSystemFont(ofSize: 20)
    }
}
