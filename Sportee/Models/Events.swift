//
//  Events.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 31..
//

import Foundation

struct Events: Codable {
    
    let events: [EventModel]
}

struct EventModel: Codable {
    let strHomeTeam: String?
    let strAwayTeam: String?
    let dateEvent: String?
    let strTime: String?
    let idLeague: String?
    let strThumb: String?
    let idHomeTeam: String?
    let idAwayTeam: String?
    let intHomeScore: String?
    let intAwayScore: String?
    
}
