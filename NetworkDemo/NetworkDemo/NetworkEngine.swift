//
//  NetworkEngine.swift
//  NetworkDemo
//
//  Created by tango on 2020/5/4.
//  Copyright © 2020 tangorios. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
}

protocol Request {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameter: [String: AnyObject] { get }
    
    associatedtype Response: Decodable
}

extension Request {
    var parameter: [String: AnyObject] {
        return [:]
    }
}

protocol NetworkEngine {
    var host: String { get }
    func send<T: Request>(_ r: T, handler: @escaping (T.Response?) -> Void)
}

extension NetworkEngine {
    var host: String {
        return "http://api.tangorios.club"
    }
}

protocol Decodable {
    static func parse(data: Data) -> Self?
}

extension User: Decodable {
    static func parse(data: Data) -> User? {
        return User(data: data)
    }
}

extension URLSession: NetworkEngine {
    
    func send<T: Request>(_ r: T, handler: @escaping (T.Response?) -> Void) {
        let url = URL(string: host.appending(r.path))!
        var request = URLRequest(url: url)
        request.httpMethod = r.method.rawValue
        
        let task = dataTask(with: request) { data, res, error in
            if let data = data, let res = T.Response.parse(data: data) {
                DispatchQueue.main.async {
                    handler(res)
                }
            } else {
                DispatchQueue.main.async {
                    handler(nil)
                }
            }
        }
        task.resume()
    }
}

struct UserRequest: Request {
    let name: String
    var path: String {
        return "/user/\(name)"
    }
    let method: HTTPMethod = .GET
    
    typealias Response = User
}

