//
//  DataLoader.swift
//  NetworkDemo
//
//  Created by tango on 2020/5/4.
//  Copyright © 2020 tangorios. All rights reserved.
//

import Foundation

class DataLoader {
    
    private let engine: NetworkEngine

    init(engine: NetworkEngine = URLSession.shared) {
        self.engine = engine
    }

    func send<T: Request>(_ r: T, handler: @escaping (T.Response?) -> Void) {
        engine.send(r, handler: handler)
    }

}
