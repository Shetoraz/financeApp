//
//  CALayer + Gradient.swift
//  financeApp
//
//  Created by Anton on 9/26/20.
//

import UIKit

extension CALayer {
    
    public func addGradienBorder(colors: [UIColor], width: CGFloat = 2) {
        let gradientLayer        = CAGradientLayer()
        gradientLayer.frame      =  CGRect(origin: .zero,
                                           size: self.bounds.size)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint   = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.colors     = colors.map({$0.cgColor})
        
        let shapeLayer           = CAShapeLayer()
        shapeLayer.lineWidth     = width
        shapeLayer.path          = UIBezierPath(roundedRect: bounds.insetBy(dx: 0, dy: 0),
                                                cornerRadius: 10).cgPath
        shapeLayer.fillColor     = nil
        shapeLayer.strokeColor   = UIColor.black.cgColor
        gradientLayer.mask       = shapeLayer
        
        self.addSublayer(gradientLayer)
    }
    
}
