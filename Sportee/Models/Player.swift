//
//  Player.swift
//  Sportee
//
//  Created by Macbook Pro CTO on 2021. 05. 10..
//

import UIKit

struct PlayersArray: Codable, Hashable {
    let player: [Player]
}


struct Player: Codable, Hashable {
    
    var idPlayer: String?
    var idTeam: String?
    var strNationality: String?
    var strPlayer: String?
    var strTeam: String?
    var dateBorn: String?
    var strBirthLocation: String?
    var strDescriptionEN: String?
    var strPosition: String
    var strHeight: String?
    var strWeight: String?
    var strCutout: String?
    var strThumb: String?
    var strSport: String?
    
}
