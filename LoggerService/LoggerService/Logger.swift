//
//  Logger.swift
//  LoggerService
//
//  Created by tango on 2020/3/26.
//  Copyright © 2020 tangorios. All rights reserved.
//

import Foundation

enum LogLevels: String {
    case fatal
    case error
    case warn
    case debug
    case info

    static let allValues = [fatal, error, warn, debug, info]
}

protocol Logger {
    static var loggers: [LogLevels: [LoggerProfile]] { get set }
    static func writeLog(logLevel: LogLevels, message: String)
}

extension Logger {
    static func logLevelContainsProfile(logLevel: LogLevels, loggerProfile: LoggerProfile) -> Bool {
        if let logProfiles = loggers[logLevel] {
            for logProfile in logProfiles where logProfile.loggerProfileId == loggerProfile.loggerProfileId {
                return true
            }
        }
        return false
    }

    static func setLogLevel(logLevel: LogLevels, loggerProfile: LoggerProfile) {

        if let _ = loggers[logLevel] {
            if !logLevelContainsProfile(logLevel: logLevel, loggerProfile: loggerProfile) {
                loggers[logLevel]?.append(loggerProfile)
            }
        } else {
            var loggerProfileList = [LoggerProfile]()
            loggerProfileList.append(loggerProfile)
            loggers[logLevel] = loggerProfileList
        }
    }

    static func addLogProfileToAllLevels(defaultLoggerProfile: LoggerProfile) {
        for level in LogLevels.allValues {
            setLogLevel(logLevel: level, loggerProfile: defaultLoggerProfile)
        }
    }

    static func removeLogProfileFromLevel(logLevel: LogLevels, loggerProfile: LoggerProfile) {
        if var logProfiles = loggers[logLevel] {
            if let index = logProfiles.firstIndex(where: { $0.loggerProfileId == loggerProfile.loggerProfileId }) {
                logProfiles.remove(at: index)
            }
            loggers[logLevel] = logProfiles
        }
    }

    static func removeLogProfileFromAllLevels(loggerProfile: LoggerProfile) {
        for level in LogLevels.allValues {
            removeLogProfileFromLevel(logLevel: level, loggerProfile: loggerProfile)
        }
    }

    static func hasLoggerForLevel(logLevel: LogLevels) -> Bool {
        guard let _ = loggers[logLevel] else {
            return false
        }
        return true
    }

}
