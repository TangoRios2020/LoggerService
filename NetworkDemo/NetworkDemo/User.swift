//
//  User.swift
//  NetworkDemo
//
//  Created by tango on 2020/5/4.
//  Copyright © 2020 tangorios. All rights reserved.
//

import Foundation

struct User {
    let name: String
    let message: String
    
    init?(data: Data) {
        guard let obj = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] else {
            return nil
        }
        guard let name = obj["name"] as? String else {
            return nil
        }
        guard let message = obj["message"] as? String else {
            return nil
        }
        
        self.name = name
        self.message = message
    }
    
}
