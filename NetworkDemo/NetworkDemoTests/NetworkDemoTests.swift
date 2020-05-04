//
//  NetworkDemoTests.swift
//  NetworkDemoTests
//
//  Created by tango on 2020/5/4.
//  Copyright © 2020 tangorios. All rights reserved.
//

import XCTest
@testable import NetworkDemo

class NetworkDemoTests: XCTestCase {

//    var sender: TestRequestSender!
//
//    override func setUp() {
//        super.setUp()
//        sender = TestRequestSender()
//    }
//
//    override func tearDown() {
//        sender = nil
//        super.tearDown()
//    }
//
//    // add test for userRequest can handle for user defined request.
//    func testUserRequest() {
//        sender.send(UserRequest(name: "tango")) { user in
//            XCTAssertNotNil(user)
//            XCTAssertEqual(user!.name, "Tango")
//        }
//    }

    var sender: NetworkEngineMock!
    
    override func setUp() {
        super.setUp()
        sender = NetworkEngineMock()
    }
    
    override func tearDown() {
        sender = nil
        super.tearDown()
    }
    
    func testSend() {
        sender.send(UserRequest(name: "tango")) { user in
            XCTAssertNotNil(user)
            XCTAssertEqual(user!.name, "Tango")
        }
    }
    
}

// let a mock class confirm the protocol to return certain values
class NetworkEngineMock: NetworkEngine {
    func send<T>(_ r: T, handler: @escaping (T.Response?) -> Void) where T : Request {
        switch r.path {
        case "/user/tango":
            guard let fileURL = Bundle(for: NetworkDemoTests.self).url(forResource: "user:tango", withExtension: "") else {
                fatalError()
            }
            guard let data = try? Data(contentsOf: fileURL) else {
                fatalError()
            }
            handler(T.Response.parse(data: data))
        default:
            fatalError("Unknown path")
        }
    }
}

//struct TestRequestSender: RequestSender {
//    func send<T : Request>(_ r: T, handler: @escaping (T.Response?) -> Void) {
//        switch r.path {
//        case "/user/tango":
//            guard let fileURL = Bundle(for: NetworkDemoTests.self).url(forResource: "user:tango", withExtension: "") else {
//                fatalError()
//            }
//            guard let data = try? Data(contentsOf: fileURL) else {
//                fatalError()
//            }
//            handler(T.Response.parse(data: data))
//        default:
//            fatalError("Unknown path")
//        }
//    }
//}
