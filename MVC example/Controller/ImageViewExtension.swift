//
//  ImageViewExtension.swift
//  MVC example
//
//  Created by Felipe Medeiros on 11/10/22.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func cacheImage(urlString: String) {
        let activityIndicator = getLoadingIndicator()
        
        let url = URL(string: urlString)
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.setImage(fade: false, image: imageFromCache)
            activityIndicator.stopAnimating()
            return
        }
        
        if let URL = url {
            URLSession.shared.dataTask(with: URL) { data, response, _ in
                if let response = data {
                    DispatchQueue.main.async {
                        guard let imageToCache = UIImage(data: response) else { return }
                        imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
                        self.setImage(fade: true, image: imageToCache)
                        activityIndicator.stopAnimating()
                    }
                } else {
                    DispatchQueue.main.async {
                        activityIndicator.stopAnimating()
                    }
                }
            }.resume()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    
    private func setImage(fade: Bool, image: UIImage?) {
        if fade {
            self.alpha = 0
            UIView.animate(withDuration: 0.3) {
                self.image = image
                self.alpha = 1
            }
        } else {
            self.image = image
        }
    }
    
    fileprivate func getLoadingIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .red
        activityIndicator.startAnimating()
        layoutIfNeeded()
        activityIndicator.center = center
        addSubview(activityIndicator)
        
        return activityIndicator
    }
}
