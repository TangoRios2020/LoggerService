//
//  ViewController.swift
//  DataAccessLayer
//
//  Created by tango on 2020/3/26.
//  Copyright © 2020 tangorios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var bos = Team(teamId: 0, city: "Boston",
                       nickName: "Red Sox", abbreviation: "BOS")

        try? TeamBridge.save(&bos)
        var ortiz = Player(playerId: 0, firstName: "David",
                           lastName: "Ortiz", number: 34, teamId: bos.teamId,
                           position: Positions.designatedHitter)

        try? PlayerBridge.save(&ortiz)

        if let team = try? TeamBridge.retrieve(0) {
            print("--- \(team.city ?? "")")
        }

        if let player = try? PlayerBridge.retrieve(0) {
            print("--- \(player.firstName) \(player.lastName) plays for \(player.team?.city)")
        }
    }

}
