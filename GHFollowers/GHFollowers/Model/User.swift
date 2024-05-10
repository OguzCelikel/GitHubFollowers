//
//  User.swift
//  GHFollowers
//
//  Created by Ömer Oğuz Çelikel on 10.05.2024.
//

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var followers: Int
    var createdAt: String
}
