//
//  Button Extension.swift
//  CinemaPlus
//
//  Created by Alparslan Cafer on 13.11.2023.
//

import UIKit


extension UIButton {
    func applyGradient(colors: [CGColor]) {
        let rgbColor = CAGradientLayer()
        rgbColor.colors = colors
        rgbColor.cornerRadius = layer.cornerRadius
        rgbColor.startPoint = CGPoint(x: 0, y: 0)
        rgbColor.endPoint = CGPoint(x: 1, y: 0)
        rgbColor.frame = bounds
        layer.insertSublayer(rgbColor, at: 0)
    }
}



extension UIView {
    func applyGradientView(colors: [CGColor]) {
        let rgbColor = CAGradientLayer()
        rgbColor.colors = colors
        rgbColor.cornerRadius = layer.cornerRadius
        rgbColor.startPoint = CGPoint(x: 0, y: 0)
        rgbColor.endPoint = CGPoint(x: 1, y: 0)
        rgbColor.frame = bounds
        layer.insertSublayer(rgbColor, at: 0)
    }
}

