//
//  PlayerDataHelper.swift
//  DataAccessLayer
//
//  Created by tango on 2020/3/26.
//  Copyright © 2020 tangorios. All rights reserved.
// swiftlint:disable line_length

import Foundation

struct PlayerDataHelper: DataHelper {

    typealias T = PlayerData
    static var playerData: [T] = []

    static func insert(_ item: T) throws -> Int64 {
        guard item.playerId != nil && item.firstName != nil && item.lastName != nil && item.teamId != nil && item.position != nil else {
            throw DataAccessError.nilInData
        }
        playerData.append(item)
        return item.playerId!
    }
    static func delete (_ item: T) throws {
        guard let playerId = item.playerId else {
            throw DataAccessError.deleteError
        }
        let playerArray = playerData
        for (index, player) in playerArray.enumerated() where player.playerId == playerId {
            playerData.remove(at: index)
        }
    }

    static func findAll() throws -> [T]? {
        return playerData
    }
    static func find(_ playerId: Int64) throws -> T? {
        for player in playerData where player.playerId == playerId {
            return player
        }
        return nil
    }

}
