//
//  PlayerBridge.swift
//  DataAccessLayer
//
//  Created by tango on 2020/3/26.
//  Copyright © 2020 tangorios. All rights reserved.
// swiftlint:disable line_length

import Foundation

struct PlayerBridge {
    static func save(_ player: inout Player) throws {
            let playerData = toPlayerData(player)
            let playerId = try PlayerDataHelper.insert(playerData)
            player.playerId = playerId
        }
        static func delete(_ player: Player) throws {
            let playerData = toPlayerData(player)
            try PlayerDataHelper.delete(playerData)
        }
        static func retrieve(_ playerId: Int64) throws -> Player? {
            if let player = try PlayerDataHelper.find(playerId) {
                return toPlayer(player)
            }
            return nil
        }
        static func toPlayerData(_ player: Player) -> PlayerData {
            return PlayerData(playerId: player.playerId, firstName:
            player.firstName, lastName: player.lastName, number: player.number,
            teamId: player.teamId, position: player.position)
        }
        static func toPlayer(_ playerData: PlayerData) -> Player {
            return Player(playerId: playerData.playerId, firstName:
            playerData.firstName, lastName: playerData.lastName, number: playerData.number, teamId: playerData.teamId, position:
            playerData.position)
        }
    }
