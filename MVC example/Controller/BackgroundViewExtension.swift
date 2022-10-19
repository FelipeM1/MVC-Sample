//
//  BackgroundViewExtension.swift
//  MVC example
//
//  Created by Felipe Medeiros on 11/10/22.
//

import UIKit

extension UIViewController {
    
    func setGradientBackground() {
            let colorTop = UIColor(red: 255.0/240.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        
        let colorBottom = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor

            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [colorTop, colorBottom]
            gradientLayer.locations = [0.0, 1.0]
            gradientLayer.frame = self.view.bounds

            self.view.layer.insertSublayer(gradientLayer, at:0)
        }
    
}
