//
//  XnorTests.swift
//  Logic Simulator XCTests
//
//  Created by Sonnie Hiles on 26/03/2020.
//  Copyright © 2020 Sonnie Hiles. All rights reserved.
//

import XCTest
@testable import Logic_Simulator

class XnorTests: XCTestCase {

    func testXnorFalseFalse() {
        //Give
        var xnor = Xnor()
        xnor.withInput(inputA: false, inputB: false)
        
        //When
        xnor.run()
        
        //Then
        XCTAssertTrue(xnor.output)
    }
    
    func testXnorTrueTrue() {
        //Given
        var xnor = Xnor()
        xnor.withInput(inputA: true, inputB: true)
        
        //When
        xnor.run()
        
        //Then
        XCTAssertTrue(xnor.output)
    }
    
    func testXnorFalseTrue() {
        //Given
        var xnor = Xnor()
        xnor.withInput(inputA: false, inputB: true)
        
        //When
        xnor.run()
        
        //Then
        XCTAssertFalse(xnor.output)
    }
    
    func testXnorTrueFalse() {
        //Given
        var xnor = Xnor()
        xnor.withInput(inputA: true, inputB: false)
        
        //When
        xnor.run()
        
        //Then
        XCTAssertFalse(xnor.output)
    }

}
