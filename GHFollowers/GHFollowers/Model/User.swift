//
//  User.swift
//  GHFollowers
//
//  Created by Ömer Oğuz Çelikel on 10.05.2024.
//

struct User: Codable {
    let login: String
    let avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    let publicRepos: Int
    let publicGists: Int
    let htmlUrl: String
    let following: Int
    let followers: Int
    let createdAt: String
}
