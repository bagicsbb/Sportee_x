//
//  Team.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 10..
//

import UIKit

struct TeamsArray: Codable, Hashable {
    let teams: [Team]
}

struct Team: Codable, Hashable {
    
    let strTeam: String
    let strTeamBadge: String
    let idTeam: String
    let strTeamShort: String?
    let intFormedYear: String
    let strStadium: String
    let strStadiumThumb: String
    let strStadiumDescription: String
    let strStadiumLocation: String
    let intStadiumCapacity: String
    let strWebsite: String
    let strTwitter: String
    let strTeamLogo: String

}

