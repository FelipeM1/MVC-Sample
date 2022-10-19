//
//  FetchURL.swift
//  MVC example
//
//  Created by Felipe Medeiros on 10/10/22.
//

import Foundation

protocol ProfileManagerDelegate {
    func loadProfile(_ profileManager: ProfileManager, profile: ProfileModel)
    func didFailWithError(error: Error)
}

struct ProfileManager {
    
    let profileUrl = "https://firebasestorage.googleapis.com/v0/b/nasa-api-tests.appspot.com/o/getArchiteture.json?alt=media&token=d19d1bb5-82b3-43a5-a440-1bf8ef6dfd08"
    
    var delegate: ProfileManagerDelegate?
    
    //Função que realiza a request
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let profile = self.parseJSON(safeData) {
                        self.delegate?.loadProfile(self, profile: profile)  
                    }
                }
            }
            task.resume()
        }
    }
    
    //Função que realiza o Parse do JSON
    func parseJSON(_ profileData: Data) -> ProfileModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(ProfileData.self, from: profileData)
            let name = decodedData.user.name
            let avatar = decodedData.user.avatarURL
            let role = decodedData.user.role
            
            let profile = ProfileModel(userImage: avatar, username: name, roleName: role)
            return profile
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
