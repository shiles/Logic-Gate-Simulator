//
//  OuputTests.swift
//  Logic Simulator XCTests
//
//  Created by Sonnie Hiles on 26/03/2020.
//  Copyright © 2020 Sonnie Hiles. All rights reserved.
//

import XCTest
@testable import Logic_Simulator

class OuputTests: XCTestCase {

    func testInputFalse() {
        //Given
        var output = Output()
        output.withInput(inputA: false)
        
        //When
        output.run()

        //Then
        XCTAssertFalse(output.output)
    }

    func testInputTrue() {
        //Given
        var output = Output()
        output.withInput(inputA: true)
        
        //When
        output.run()

        //Then
        XCTAssertTrue(output.output)
    }

}
