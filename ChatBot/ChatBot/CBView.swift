//
//  CBView.swift
//  ChatBot
//
//  Created by Abhishek on 29/05/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//

import UIKit

class CBView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */    
}

class GradientColor {

    var gradientLayer: CAGradientLayer
    
    init() {
        
        gradientLayer = CAGradientLayer()
        let color1 = UIColor.lightGray.cgColor
        let color2 = UIColor.red.cgColor
        gradientLayer.colors = [color1, color2]
        gradientLayer.locations = [0.0, 1.0]
    }
    
}

extension UIView {

    func setRoundedConrners(corners: UIRectCorner, radius: CGFloat) {
    
        let path = UIBezierPath(roundedRect: self.bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
