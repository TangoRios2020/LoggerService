//
//  TeamBridge.swift
//  DataAccessLayer
//
//  Created by tango on 2020/3/26.
//  Copyright © 2020 tangorios. All rights reserved.
//
// swiftlint:disable line_length

import Foundation

struct TeamBridge {
    static func save(_ team: inout Team) throws {
        let teamData = toTeamData(team)
        let teamId = try TeamDataHelper.insert(teamData)
        team.teamId = teamId
    }
    static func delete(_ team: Team) throws {
        let teamData = toTeamData(team)
        try TeamDataHelper.delete(teamData)
    }
    static func retrieve(_ teamId: Int64) throws -> Team? {
        if let team = try TeamDataHelper.find(teamId) {
            return toTeam(team)
        }
        return nil
    }
    static func toTeamData(_ team: Team) -> TeamData {
        return TeamData(teamId: team.teamId, city: team.city, nickName:
        team.nickName, abbreviation: team.abbreviation)
    }
    static func toTeam(_ teamData: TeamData) -> Team {
        return Team(teamId: teamData.teamId, city: teamData.city, nickName: teamData.nickName, abbreviation: teamData.abbreviation)
    }
}
