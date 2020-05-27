//
//  TestCaseOne.swift
//  LoggerTests
//
//  Created by Cedric Gatay on 07/01/2019.
//  Copyright © 2019 Cedric Gatay. All rights reserved.
//

import Foundation
import CTLogger

enum TestCaseOne: Int{
    case FirstMessage
    case SecondMessage
    case FortyTwo = 42
}

extension TestCaseOne: Loggable{
    static var digitAmount = 6
}
