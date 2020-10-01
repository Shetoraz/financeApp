//
//  CustomCollectionCell.swift
//  financeApp
//
//  Created by Anton on 9/24/20.
//

import UIKit

class FNCollectionCell: UICollectionViewCell {
    
    let categoryName    = UILabel()
    let categoryImage   = UIImageView()
    let moneySpentLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setupAppearance()
    }
    
    private func setupAppearance() {
        let colors = cellRandomBackgroundColors()
        self.layer.addGradienBorder(colors: colors, width: 2.0)
        self.addLabel()
        self.addImage()
        self.layer.cornerRadius = 10.0
        self.clipsToBounds      = true
        self.contentView.anchor(top: nil,
                                leading: categoryName.leadingAnchor,
                                bottom: nil,
                                trailing: categoryName.trailingAnchor,
                                padding: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
    }
    
    private func addLabel() {
        self.contentView.addSubview(categoryName)
        self.categoryName.anchorCenterXToSubview(subView: self)
        self.categoryName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        
        self.contentView.addSubview(moneySpentLabel)
        self.moneySpentLabel.anchorCenterXToSubview(subView: self)
        self.moneySpentLabel.textColor = .white
        self.moneySpentLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
    }
    
    private func addImage() {
        self.contentView.addSubview(categoryImage)
        self.categoryImage.contentMode   = .scaleAspectFit
        self.categoryImage.clipsToBounds = true
        self.categoryImage.anchorCenterSubview(subView: self, heightConstant: 40.0)
    }
    
    func setupCell(text: String?, image: String?, moneySpent: Double?) {
            if let text = text {
                self.categoryName.text = text
            }
            if let image = image {
                self.categoryImage.image = UIImage(systemName: image)?.withTintColor(.white, renderingMode: .alwaysOriginal)
            }
            if let moneySpent = moneySpent {
                self.moneySpentLabel.text = String(moneySpent)
        }
    }
}
