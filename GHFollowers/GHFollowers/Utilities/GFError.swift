//
//  GFError.swift
//  GHFollowers
//
//  Created by Ömer Oğuz Çelikel on 24.05.2024.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername    = "This username created an invalid request. Please try again."
    case unableToComplete   = "Unable to complete your request. Please check your internet connection"
    case invalidResponse    = "Invalid response from the server. Please try egain."
    case invalidData        = "The data recieved from the server was invalid. Please try again."
}
