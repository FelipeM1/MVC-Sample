//
//  PerfilViewController.swift
//  MVC example
//
//  Created by Felipe Medeiros on 10/10/22.
//

import UIKit

class ProfileViewController: UIViewController, ProfileManagerDelegate {
    
    @IBOutlet var backgroundVW: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    var profileManager = ProfileManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        nameLabel.text = ""
        jobLabel.text = ""
        nameLabel.alpha = 0
        jobLabel.alpha = 0
        nameLabel.fadeIn(duration: 1, delay: 1.2, completion: { (finished: Bool) -> Void in })
        jobLabel.fadeIn(duration: 1, delay: 1, completion: { (finished: Bool) -> Void in })
        
        profileManager.delegate = self
        profileManager.performRequest(urlString: profileManager.profileUrl)
        
        setGradientBackground()
    }
    
    func loadProfile(_ profileManager: ProfileManager, profile: ProfileModel) {
        DispatchQueue.main.async {
            self.profileImage.cacheImage(urlString: profile.userImage)
            self.nameLabel.text = "\(profile.username)"
            self.jobLabel.text = "\(profile.roleName)"
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}
