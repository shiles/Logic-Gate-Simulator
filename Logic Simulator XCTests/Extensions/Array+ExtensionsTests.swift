//
//  Array+ExtensionsTests.swift
//  Logic Simulator XCTests
//
//  Created by Sonnie Hiles on 25/03/2020.
//  Copyright © 2020 Sonnie Hiles. All rights reserved.
//

import XCTest
@testable import Logic_Simulator

class Array_ExtensionsTests: XCTestCase {

    func testSecondWithElement() {
        // Given
        let list = [1,2,3]
        
        // When
        let second = list.second
        
        // Then
        XCTAssertNotNil(second)
        XCTAssertEqual(2, second)
    }
    
    func testSecondNilElement() {
        // Given
        let list = [1]
        
        // When
        let second = list.second
        
        // Then
        XCTAssertNil(second)
    }

}
