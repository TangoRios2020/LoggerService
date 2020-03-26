//
//  LoggerNull.swift
//  LoggerService
//
//  Created by tango on 2020/3/26.
//  Copyright © 2020 tangorios. All rights reserved.
//

import Foundation

struct  LoggerNull: LoggerProfile {
    let  loggerProfileId  =  "tangorios.logger.null"
    func  writeLog(level: String, message: String) {
        //  Do  nothing
    }
}
