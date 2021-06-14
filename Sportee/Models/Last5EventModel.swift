//
//  lastEvent.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 10..
//

import Foundation

struct Results: Codable {
    
    let results: [Last5EventModel]
}

struct Last5EventModel: Codable {
    let strHomeTeam: String?
    let strAwayTeam: String?
    let dateEvent: String?
    let intHomeScore: String?
    let intAwayScore: String?
    let idHomeTeam: String?
    let idAwayTeam: String?
    
}
