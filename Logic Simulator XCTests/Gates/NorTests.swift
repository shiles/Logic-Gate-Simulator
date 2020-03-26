//
//  NorTests.swift
//  Logic Simulator XCTests
//
//  Created by Sonnie Hiles on 26/03/2020.
//  Copyright © 2020 Sonnie Hiles. All rights reserved.
//

import XCTest
@testable import Logic_Simulator

class NorTests: XCTestCase {

    func testNorFalseFalse() {
        //Give
        var nor = Nor()
        nor.withInput(inputA: false, inputB: false)
        
        //When
        nor.run()
        
        //Then
        XCTAssertTrue(nor.output)
    }
    
    func testNorTrueTrue() {
        //Given
        var nor = Nor()
        nor.withInput(inputA: true, inputB: true)
        
        //When
        nor.run()
        
        //Then
        XCTAssertFalse(nor.output)
    }
    
    func testNorFalseTrue() {
        //Given
        var nor = Nor()
        nor.withInput(inputA: false, inputB: true)
        
        //When
        nor.run()
        
        //Then
        XCTAssertFalse(nor.output)
    }
    
    func testNorTrueFalse() {
        //Given
        var nor = Nor()
        nor.withInput(inputA: true, inputB: false)
        
        //When
        nor.run()
        
        //Then
        XCTAssertFalse(nor.output)
    }
}
