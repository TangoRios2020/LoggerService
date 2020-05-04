//
//  ViewController.swift
//  NetworkDemo
//
//  Created by tango on 2020/5/4.
//  Copyright © 2020 tangorios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = ""
        messageLabel.text = ""
        
        URLSessionRequestSender().send(UserRequest(name: "tango")) { user in
            self.nameLabel.text = user?.name ?? ""
            self.messageLabel.text = user?.message ?? ""
        }
    }


}

