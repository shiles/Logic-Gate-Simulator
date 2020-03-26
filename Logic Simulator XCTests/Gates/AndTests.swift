//
//  AndTests.swift
//  Logic Simulator XCTests
//
//  Created by Sonnie Hiles on 26/03/2020.
//  Copyright © 2020 Sonnie Hiles. All rights reserved.
//

import XCTest

class AndTests: XCTestCase {

   func testAndFalseFalse() {
        //Give
        var and = And()
        and.withInput(inputA: false, inputB: false)
        
        //When
        and.run()
        
        //Then
        XCTAssertFalse(and.output)
    }
    
    func testAndTrueTrue() {
        //Given
        var and = And()
        and.withInput(inputA: true, inputB: true)
        
        //When
        and.run()
        
        //Then
        XCTAssertTrue(and.output)
    }
    
    func testAndFalseTrue() {
        //Given
        var and = And()
        and.withInput(inputA: false, inputB: true)
        
        //When
        and.run()
        
        //Then
        XCTAssertFalse(and.output)
    }
    
    func testAndTrueFalse() {
        //Given
        var and = And()
        and.withInput(inputA: true, inputB: false)
        
        //When
        and.run()
        
        //Then
        XCTAssertFalse(and.output)
    }

}
