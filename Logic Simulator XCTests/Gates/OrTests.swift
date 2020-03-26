//
//  OrTests.swift
//  Logic Simulator XCTests
//
//  Created by Sonnie Hiles on 26/03/2020.
//  Copyright © 2020 Sonnie Hiles. All rights reserved.
//

import XCTest
@testable import Logic_Simulator

class OrTests: XCTestCase {

     func testOrFalseFalse() {
           //Given
           var or = Or()
           or.withInput(inputA: false, inputB: false)
           
           //When
           or.run()
           
           //Then
           XCTAssertFalse(or.output)
       }
       
       func testOrTrueTrue() {
           //Given
           var or = Or()
           or.withInput(inputA: true, inputB: true)
           
           //When
           or.run()
           
           //Then
           XCTAssertTrue(or.output)
       }
       
       func testOrFalseTrue() {
           //Given
           var or = Or()
           or.withInput(inputA: false, inputB: true)
           
           //When
           or.run()
           
           //Then
           XCTAssertTrue(or.output)
       }
       
       func testOrTrueFalse() {
           //Given
           var or = Or()
           or.withInput(inputA: true, inputB: false)
           
           //When
           or.run()
           
           //Then
           XCTAssertTrue(or.output)
       }
}
