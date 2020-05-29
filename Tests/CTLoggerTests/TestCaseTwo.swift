//
//  TestCaseTwo.swift
//  LoggerTests
//
//  Created by Cedric Gatay on 08/01/2019.
//  Copyright © 2019 Cedric Gatay. All rights reserved.
//

import Foundation
import CTLogger

enum TestCaseTwo{
    case TooManyCalls(String)
    case NetworkTimeOut(URL)
    case ComplexError(ErrorStructure)
    case MultipleArguments(String, URL)
}

struct ErrorStructure{
    let code: Int
    let value: String
}

extension TestCaseTwo:Loggable{
    var rawValue: Int {
        switch self {
        case .TooManyCalls:
            return 1
        case .NetworkTimeOut:
            return 2
        case .ComplexError:
            return 3
        case .MultipleArguments:
            return 4
        }
    }
}
