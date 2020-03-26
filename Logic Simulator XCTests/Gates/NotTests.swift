//
//  NotTests.swift
//  Logic Simulator XCTests
//
//  Created by Sonnie Hiles on 26/03/2020.
//  Copyright © 2020 Sonnie Hiles. All rights reserved.
//

import XCTest
@testable import Logic_Simulator

class NotTests: XCTestCase {

    func testNotFalse() {
        //Given
        var not = Not()
        not.withInput(inputA: false)
        
        //When
        not.run()
        
        //Then
        XCTAssertTrue(not.output)
    }
    
    func testNotTrue() {
        //Given
        var not = Not()
        not.withInput(inputA: true)
        
        //When
        not.run()
        
        //Then
        XCTAssertFalse(not.output)
    }


}
