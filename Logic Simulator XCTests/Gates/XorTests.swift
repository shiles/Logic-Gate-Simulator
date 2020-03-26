//
//  XorTests.swift
//  Logic Simulator XCTests
//
//  Created by Sonnie Hiles on 26/03/2020.
//  Copyright © 2020 Sonnie Hiles. All rights reserved.
//

import XCTest
@testable import Logic_Simulator

class XorTests: XCTestCase {

    func testXorFalseFalse() {
        //Give
        var xor = Xor()
        xor.withInput(inputA: false, inputB: false)
        
        //When
        xor.run()
        
        //Then
        XCTAssertFalse(xor.output)
    }
    
    func testXorTrueTrue() {
        //Given
        var xor = Xor()
        xor.withInput(inputA: true, inputB: true)
        
        //When
        xor.run()
        
        //Then
        XCTAssertFalse(xor.output)
    }
    
    func testXorFalseTrue() {
        //Given
        var xor = Xor()
        xor.withInput(inputA: false, inputB: true)
        
        //When
        xor.run()
        
        //Then
        XCTAssertTrue(xor.output)
    }
    
    func testXorTrueFalse() {
        //Given
        var xor = Xor()
        xor.withInput(inputA: true, inputB: false)
        
        //When
        xor.run()
        
        //Then
        XCTAssertTrue(xor.output)
    }
}
