//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Ömer Oğuz Çelikel on 10.05.2024.
//

import UIKit

class NetworkManager {
    static let shared   = NetworkManager()
    private let baseURL = "https://api.github.com/users/"
    let cache           = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            //Should return an error
            //if call error from here it will be background thread
            //pass error message to ViewController it will present it
//            completed(nil, .invalidUsername)
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            //nothing will be happen. Mostly internet connection. 
            //If there is an error from API it will be like 404 error in response
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
            // response not nill and check satus code
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                //completed(followers, nil)
                completed(.success(followers))
            } catch {
//                completed(nil, error.localizedDescription) // good error message to the developers
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func getUserInfo(for username: String, completed: @escaping (Result<User, GFError>) -> Void) {
        let endpoint = baseURL + "\(username)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let user = try decoder.decode(User.self, from: data)
                completed(.success(user))
            } catch {
                completed(.failure(.invalidData))
            }
        }        
        task.resume()
    }
}
