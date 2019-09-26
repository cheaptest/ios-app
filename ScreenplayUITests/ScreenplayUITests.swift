//
//  ScreenplayUITests.swift
//  ScreenplayUITests
//
//  Created by Xiaoxing Hu on 25/09/19.
//  Copyright © 2019 huxiaoxing. All rights reserved.
//

import XCTest

class ScreenplayUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    func testWithScreenplay() {
        var user = User()
        user.does(HasTodos(.basic))
        user.perform(LaunchApp())
        user.should(SeeTodos("buy milk"))
    }

}
