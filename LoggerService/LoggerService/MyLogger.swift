//
//  MyLogger.swift
//  LoggerService
//
//  Created by tango on 2020/3/26.
//  Copyright © 2020 tangorios. All rights reserved.
//

import Foundation

struct MyLogger: Logger {
    static var loggers = [LogLevels: [LoggerProfile]]()
    static func writeLog(logLevel: LogLevels, message: String) {
        guard hasLoggerForLevel(logLevel: logLevel) else {
            print("No logger")
            return
        }
        if let logProfiles = loggers[logLevel] {
            for logProfile in logProfiles {
                logProfile.writeLog(level: logLevel.rawValue, message: message)
            }
        }
    }
}
