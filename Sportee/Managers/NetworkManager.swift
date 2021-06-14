//
//  NetworkManager.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 10..
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    private let apiKey = ApiKey().APIkey
    let cache = NSCache<NSString, UIImage>()
    var teamID: String!
    var ababa: String!
    
    
    private init() {}
    
    func getAllTeams(leagueid: String, completed: @escaping (Result<TeamsArray, SPError>) -> Void){
        let endpoint = "https://www.thesportsdb.com/api/v1/json/\(apiKey)/lookup_all_teams.php?id=\(leagueid)"
    
        guard let url = URL(string: endpoint) else {
            completed(.failure(.unableToComplete))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                
                return
            }
           
            do {
                let decoder = JSONDecoder()
                let teams   = try decoder.decode(TeamsArray.self, from: data)
                completed(.success(teams))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
    func getAllPlayersForSelectedTeam(teamID: String, completed: @escaping (Result<PlayersArray, SPError>) -> Void){
        let endpoint = "https://www.thesportsdb.com/api/v1/json/\(apiKey)/lookup_all_players.php?id=\(teamID)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.unableToComplete))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let player  = try decoder.decode(PlayersArray.self, from: data)
                completed(.success(player))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func getThePlayerBySearch(name: String, completed: @escaping (Result<PlayersArray, SPError>) -> Void){
        let endpoint = "https://www.thesportsdb.com/api/v1/json/\(apiKey)/searchplayers.php?p=\(name)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.unableToComplete))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
//                decoder.dateDecodingStrategy = .iso8601
                let player = try decoder.decode(PlayersArray.self, from: data)
                completed(.success(player))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
    func getLastEvents(teamID: String, completed: @escaping (Result<Results, SPError>) -> Void){
        let endpoint = "https://www.thesportsdb.com/api/v1/json/\(apiKey)/eventslast.php?id=\(teamID)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.unableToComplete))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let event = try decoder.decode(Results.self, from: data)
                completed(.success(event))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
    func getNextEvents(teamID: String, completed: @escaping (Result<NextEvents, SPError>) -> Void){
        let endpoint = "https://www.thesportsdb.com/api/v1/json/\(apiKey)/eventsnext.php?id=\(teamID)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.unableToComplete))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let data = data else {
                
                completed(.failure(.unableToComplete))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let event = try decoder.decode(NextEvents.self, from: data)
                completed(.success(event))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func getEvents(dateOfDay: String, completed: @escaping (Result<Events, SPError>) -> Void){
        let endpoint = "https://www.thesportsdb.com/api/v1/json/\(apiKey)/eventsday.php?d=\(dateOfDay)&s=basketball"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.unableToComplete))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let data = data else {
                
                completed(.failure(.unableToComplete))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                
                let event = try decoder.decode(Events.self, from: data)
                completed(.success(event))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void ) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
            
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let self = self,
                  error == nil,
                  let  response = response as? HTTPURLResponse, response.statusCode == 200,
                  let data = data,
                  let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
            
        }
        task.resume()
    }
}
