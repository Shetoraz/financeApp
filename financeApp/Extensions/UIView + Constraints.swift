//
//  UIView + Constraints.swift
//  financeApp
//
//  Created by Anton on 9/26/20.
//

import UIKit

extension UIView {
    
    public func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    public func anchorCenterXToSubview(constant: CGFloat = 0, subView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: subView.centerXAnchor, constant: constant).isActive = true
    }
    
    public func anchorCenterYToSubview(constant: CGFloat = 0, subView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: subView.centerYAnchor, constant: constant).isActive = true
    }
    
    public func anchorCenterSubview(subView: UIView, heightConstant: CGFloat = 0) {
        anchorCenterXToSubview(subView: subView)
        anchorCenterYToSubview(subView: subView)
        heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
    }
    
}
