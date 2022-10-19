//
//  File.swift
//  MVC example
//
//  Created by Felipe Medeiros on 10/10/22.
//

import Foundation
//Arquivo de onde o JSON irá realizar o Parse

struct ProfileData: Codable {
    let user: User
}

struct User: Codable {
    let name: String
    let avatarURL: String
    let role: String
}
