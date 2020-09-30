//
//  ValueInputView.swift
//  financeApp
//
//  Created by Anton on 9/29/20.
//

import UIKit

class FNValueInputView: UIView {
    
    private let amountLabel = UILabel()
    private let amountField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLabel()
        self.setupField()
    }
    
    convenience init(text: String) {
        self.init()
        self.amountLabel.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupLabel() {
        self.amountLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(amountLabel)
        self.amountLabel.anchor(top: nil, leading: leadingAnchor, bottom: nil, trailing: nil)
        self.amountLabel.anchorCenterYToSubview(subView: self)
        self.amountLabel.backgroundColor = .clear
        self.amountLabel.textColor = .white
    }
    
    fileprivate func setupField() {
        self.amountField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(amountField)
        self.amountField.backgroundColor = .gray
        self.amountField.layer.cornerRadius = 10
        self.amountField.layer.masksToBounds = true
        self.amountField.clipsToBounds = true
        self.amountField.placeholder = "Amount"
        self.amountField.textColor = .white
        self.amountField.anchorCenterXToSubview(subView: self)
    }
    
}
