//
//  ValueInputView.swift
//  financeApp
//
//  Created by Anton on 9/29/20.
//

import UIKit

class FNValueInputView: UIView {
    
    private let amountLabel = UILabel()
    let amountField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupField()
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
        self.amountLabel.textColor       = .white
        self.amountLabel.text            = "Amount"
    }
    
    fileprivate func setupField() {
        self.amountField.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(amountField)
        self.amountField.backgroundColor     = #colorLiteral(red: 0.06518068165, green: 0.06519971043, blue: 0.0651782006, alpha: 1)
        self.amountField.layer.cornerRadius  = 12.0
        self.amountField.layer.masksToBounds = true
        self.amountField.anchorCenterYToSubview(subView: self)
        self.amountField.clipsToBounds       = true
        self.amountField.placeholder         = "Enter amount"
        self.amountField.textColor           = .white
        self.amountField.anchor(top: topAnchor,
                                leading: leadingAnchor,
                                bottom: bottomAnchor,
                                trailing: trailingAnchor)
    }
}
