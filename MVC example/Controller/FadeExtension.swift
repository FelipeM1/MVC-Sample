//
//  LabelsExtension.swift
//  MVC example
//
//  Created by Felipe Medeiros on 11/10/22.
//

import UIKit

extension UIView {
    
    func fadeIn(duration: TimeInterval = 1.0, delay: TimeInterval = 0.0, completion: @escaping ((
        Bool) -> Void) = {(finished: Bool) -> Void in}) {
            UIView.animate(withDuration: duration,
                           delay: delay,
                           options: UIView.AnimationOptions.curveEaseIn,
                           animations: { self.alpha = 1.0},
                           completion: completion) }
    
    func fadeOut(duration: TimeInterval = 1.0, delay: TimeInterval = 3.0, completion: @escaping (
        Bool) -> Void = {(finished: Bool) -> Void in}) {
            UIView.animate(withDuration: duration,
                           delay: delay,
                           options:UIView.AnimationOptions.curveEaseIn,
                           animations: {self.alpha = 0.0},
                           completion: completion)
            
        }
}
