//
//  ViewController.swift
//  LoggerService
//
//  Created by tango on 2020/3/26.
//  Copyright © 2020 tangorios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        MyLogger.addLogProfileToAllLevels(defaultLoggerProfile: LoggerConsole())
        print("Debug Message 1")
        MyLogger.writeLog(logLevel: LogLevels.debug, message: "Debug Message 1")
        MyLogger.writeLog(logLevel: LogLevels.error, message: "Error Message 1")
    }

}
