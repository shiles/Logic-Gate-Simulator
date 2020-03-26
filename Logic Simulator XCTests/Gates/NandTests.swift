//
//  NandTests.swift
//  Logic Simulator XCTests
//
//  Created by Sonnie Hiles on 26/03/2020.
//  Copyright © 2020 Sonnie Hiles. All rights reserved.
//

import XCTest
@testable import Logic_Simulator

class NandTests: XCTestCase {

      func testNandFalseFalse() {
          //Give
          var nand = Nand()
          nand.withInput(inputA: false, inputB: false)
          
          //When
          nand.run()
          
          //Then
          XCTAssertTrue(nand.output)
      }
      
      func testNandTrueTrue() {
          //Given
          var nand = Nand()
          nand.withInput(inputA: true, inputB: true)
          
          //When
          nand.run()
          
          //Then
          XCTAssertFalse(nand.output)
      }
      
      func testNandFalseTrue() {
          //Given
          var nand = Nand()
          nand.withInput(inputA: false, inputB: true)
          
          //When
          nand.run()
          
          //Then
          XCTAssertTrue(nand.output)
      }
      
      func testNandTrueFalse() {
          //Given
          var nand = Nand()
          nand.withInput(inputA: true, inputB: false)
          
          //When
          nand.run()
          
          //Then
          XCTAssertTrue(nand.output)
      }
}
