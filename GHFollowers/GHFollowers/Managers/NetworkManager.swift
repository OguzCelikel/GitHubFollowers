//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Ömer Oğuz Çelikel on 10.05.2024.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let baseURL: String = "https://api.github.com/users/"
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping ([Follower]?, String?) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&\(page)"
        
        guard let url = URL(string: endpoint) else {
            //Should return an error
            //if call error from here it will be background thread
            //pass error message to ViewController it will present it
            completed(nil, "This username created an invalid request. Please try again.")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            //nothing will be happen. Mostly internet connection. 
            //If there is an error from API it will be like 404 error in response
            if let _ = error {
                completed(nil, "Unable to complete your request. Please check your internet connection")
            }
            
            // response not nill and check satus code
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid response from the server. Please try egain.")
                return
            }
            
            guard let data = data else {
                completed(nil, "The data recieved from the server was invalid. Please try again.")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(followers, nil)
            } catch {
                completed(nil, "The data recieved from the server was invalid. Please try again.")
            }
        }
        
        task.resume()
    }
}
