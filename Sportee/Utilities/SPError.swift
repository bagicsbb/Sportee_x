//
//  SPError.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 10..
//

import Foundation


enum SPError: String, Error {
    

    case unableToComplete   = "Unable to complete your request. Please check your internet connection."
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data recived from the server was invalid. Please try again."
    case unableToFavorite   = "There was an error favoriting this player. Please try again."
    case alreadyInFavorites = "You've already favorited this player. You must REALLY like them!"
}
