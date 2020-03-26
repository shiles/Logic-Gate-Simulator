//
//  InputTests.swift
//  Logic Simulator XCTests
//
//  Created by Sonnie Hiles on 26/03/2020.
//  Copyright © 2020 Sonnie Hiles. All rights reserved.
//

import XCTest
@testable import Logic_Simulator

class InputTests: XCTestCase {

    func testInputFalse() {
        //Given
        let input = Input(initialValue: false)
        
        //Then
        XCTAssertFalse(input.output)
    }
    
    func testInputTrue() {
        //Given
        let input = Input(initialValue: true)
        
        //Then
        XCTAssertTrue(input.output)
    }
}
