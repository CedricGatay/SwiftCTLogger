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
    
    func testLogWithMultipleArgs(){
        TestCaseTwo.MultipleArguments("First", URL(string:"https://code-troopers.com")!).debug()
    }
    
    func testLogVarargs(){
        let rawStr = "There are two %@ arguments to log %@"
        let logCase = TestCaseTwo.MultipleArguments("First", URL(string: "https://code-troopers.com")!)
        let elementMirror = Mirror(reflecting: logCase)
        let args: [String] = elementMirror.children.filter {$0.label != nil}
            .map { child -> (label: String, args: [String]) in
                let extractedTupleValues: [String] = Mirror(reflecting: child.value).children.map { String(describing: $0.value) }
                return (label: child.label!,
                        args: extractedTupleValues.isEmpty
                            ? [String(describing: child.value)]
                            : extractedTupleValues)
        }
            .map { element in
                String(format: rawStr, arguments: element.args)
        }
        print(args)
    }
}
