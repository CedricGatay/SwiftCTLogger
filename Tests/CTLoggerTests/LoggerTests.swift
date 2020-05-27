//
//  LoggerTests.swift
//  LoggerTests
//
//  Created by Cedric Gatay on 17/12/2018.
//  Copyright © 2018 Cedric Gatay. All rights reserved.
//

import XCTest
@testable import CTLogger

class CTLoggerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBasicLog(){
        TestCaseOne.FirstMessage.debug()
        TestCaseOne.SecondMessage.debug()
        TestCaseOne.FortyTwo.debug()
    }

    
    func testLogWithArgs(){
        TestCaseTwo.TooManyCalls("Please stop calling me").debug()
        TestCaseTwo.NetworkTimeOut(URL(string: "https://code-troopers.com")!).debug()
        TestCaseTwo.ComplexError(ErrorStructure(code:462, value: "This is utterly complex")).debug()
    }
}
