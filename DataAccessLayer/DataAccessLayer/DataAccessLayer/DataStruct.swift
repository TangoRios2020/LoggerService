//
//  DataStruct.swift
//  DataAccessLayer
//
//  Created by tango on 2020/3/26.
//  Copyright © 2020 tangorios. All rights reserved.
//

import Foundation

typealias TeamData = (teamId: Int64?, city: String?, nickName: String?, abbreviation: String?)
typealias PlayerData = (playerId: Int64?, firstName: String?, lastName: String?, number: Int?, teamId: Int64?,
    position: Positions?)

enum Positions: String {
    case pitcher = "Pitcher"
    case catcher = "Catcher"
    case firstBase = "First Base"
    case secondBase = "Second Base"
    case thirdBase = "Third Base"
    case shortstop = "Shortstop"
    case leftField = "Left Field"
    case centerField = "Center Field"
    case rightField = "Right field"
    case designatedHitter = "Designated Hitter"
}

enum DataAccessError: Error {
    case datastoreConnectionError
    case insertError
    case deleteError
    case searchError
    case nilInData
}

struct Team {
    var teamId: Int64?
    var city: String?
    var nickName: String?
    var abbreviation: String?
}

struct Player {
    var playerId: Int64?
    var firstName: String?
    var lastName: String?
    var number: Int?
    var teamId: Int64? {
        didSet {
            if let tmpTeam = try? TeamBridge.retrieve(teamId!) {
                team = tmpTeam
            }
        }
    }
    var position: Positions?
    var team: Team?

    init(playerId: Int64?, firstName: String?, lastName: String?, number: Int?, teamId: Int64?, position: Positions?) {
        self.playerId = playerId
        self.firstName = firstName
        self.lastName = lastName
        self.number = number
        self.teamId = teamId
        self.position = position
        if let teamId = self.teamId {
            if let tmpTeam = try? TeamBridge.retrieve(teamId) {
                team = tmpTeam
            }
        }
    }
}
