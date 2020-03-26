//
//  Bool+ExtensionsTests.swift
//  Logic Simulator XCTests
//
//  Created by Sonnie Hiles on 26/03/2020.
//  Copyright © 2020 Sonnie Hiles. All rights reserved.
//

import XCTest
@testable import Logic_Simulator

class Bool_ExtensionsTests: XCTestCase {

    func testXorOperatorTrueTrue() {
        // When
        let result = true ^ true
        
        // Then
        XCTAssertFalse(result)
    }
    
    func testXorOperatorFalseTrue() {
        // When
        let result = false ^ true
        
        // Then
        XCTAssertTrue(result)
    }
    
    func testXorOperatorTrueFalse() {
        // When
        let result = true ^ false
        
        // Then
        XCTAssertTrue(result)
    }
    
    func testXorOperatorFalseFalse() {
        // When
        let result = false ^ false
        
        // Then
        XCTAssertFalse(result)
    }
    

}
