//
//  TeamDataHelper.swift
//  DataAccessLayer
//
//  Created by tango on 2020/3/26.
//  Copyright © 2020 tangorios. All rights reserved.
//

import Foundation

struct TeamDataHelper: DataHelper {

    typealias T = TeamData
    static var teamData: [T] = []

    static func insert(_ item: T) throws -> Int64 {
         guard item.teamId != nil && item.city != nil && item.nickName !=
             nil && item.abbreviation != nil else {
                throw DataAccessError.nilInData
            }
        teamData.append(item)
        return item.teamId!
    }

    static func delete (_ item: T) throws {
        guard let teamId = item.teamId else {
            throw DataAccessError.nilInData
        }
        let teamArray = teamData
        for (index, team) in teamArray.enumerated() where team.teamId == teamId {
            teamData.remove(at: index)
            return
        }
        throw DataAccessError.deleteError
    }

    static func findAll() throws -> [T]? {
        return teamData
    }

    static func find(_ teamId: Int64) throws -> T? {
        for team in teamData where team.teamId == teamId {
            return team
        }
        return nil
    }
}
