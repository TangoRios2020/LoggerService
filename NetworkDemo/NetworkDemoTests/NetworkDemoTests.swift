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

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    var sender: TestRequestSender!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sender = TestRequestSender()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sender = nil
        super.tearDown()
    }
        
    func testUserRequest() {
        sender.send(UserRequest(name: "tango")) {
            user in
            XCTAssertNotNil(user)
            XCTAssertEqual(user!.name, "Tango")
        }
    }

}

struct TestRequestSender: RequestSender {
    func send<T : Request>(_ r: T, handler: @escaping (T.Response?) -> Void) {
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
