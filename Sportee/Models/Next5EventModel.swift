//
//  nextEvent.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 25..
//

import Foundation

struct NextEvents: Codable {
    
    let events: [Next5EventModel]
}

struct Next5EventModel: Codable {
    let strHomeTeam: String?
    let strAwayTeam: String?
    let dateEvent: String?
    let strTime: String?
    let idHomeTeam: String?
    let idAwayTeam: String?
}
