//
//  DataHelper.swift
//  DataAccessLayer
//
//  Created by tango on 2020/3/26.
//  Copyright © 2020 tangorios. All rights reserved.
//

import Foundation

protocol DataHelper {
    associatedtype T
    static func insert(_ item: T) throws -> Int64
    static func delete(_ item: T) throws
    static func findAll() throws -> [T]?
}
