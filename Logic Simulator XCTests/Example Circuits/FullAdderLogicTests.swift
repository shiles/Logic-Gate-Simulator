//
//  FullAdderLogicTests.swift
//  Logic Simulator XCTests
//
//  Created by Sonnie Hiles on 26/03/2020.
//  Copyright © 2020 Sonnie Hiles. All rights reserved.
//

import XCTest
@testable import Logic_Simulator

// Combinatorial Example
struct FullAdder {
    // Inputs
    var inputA = Input(initialValue: false)
    var inputB = Input(initialValue: false)
    var inputC = Input(initialValue: false)
    
    // Ouputs
    let outputSum = Output()
    let outputCarry = Output()
    
    var model: GateModel {
        // Intermediary Gates
        let xorA = Xor()
        let xorB = Xor()
        let andA = And()
        let andB = And()
        let or   = Or()

        // Connections
        xorA.inputs = [inputA, inputB]
        xorB.inputs = [inputC, xorA]
        andA.inputs = [xorA, inputC]
        andB.inputs = [inputA, inputB]
        or.inputs   = [andA, andB]
        outputSum.inputs = [xorB]
        outputCarry.inputs = [or]
        
        return [inputA, or, xorA, xorB, andA, or, inputB, inputC, xorA, outputSum, outputCarry, andB]
    }
}

class FullAdderLogicTests: XCTestCase {

    func testFullAdderFalseFalseFalse() {
        // Given
        let fullAdder = FullAdder()
        fullAdder.inputA.output = false
        fullAdder.inputB.output = false
        fullAdder.inputC.output = false
        
        // When
        Runner.simulate(fullAdder.model)
        
        // Then
        XCTAssertFalse(fullAdder.outputSum.output)
        XCTAssertFalse(fullAdder.outputCarry.output)
    }
    
    func testFullAdderFalseFalseTrue() {
        // Given
        let fullAdder = FullAdder()
        fullAdder.inputA.output = false
        fullAdder.inputB.output = false
        fullAdder.inputC.output = true
        
        // When
        Runner.simulate(fullAdder.model)
        
        // Then
        XCTAssertTrue(fullAdder.outputSum.output)
        XCTAssertFalse(fullAdder.outputCarry.output)
    }
    
    func testFullAdderFalseTrueFalse() {
       // Given
       let fullAdder = FullAdder()
       fullAdder.inputA.output = false
       fullAdder.inputB.output = true
       fullAdder.inputC.output = false
       
       // When
       Runner.simulate(fullAdder.model)
       
       // Then
       XCTAssertTrue(fullAdder.outputSum.output)
       XCTAssertFalse(fullAdder.outputCarry.output)
   }
    
    func testFullAdderFalseTrueTrue() {
        // Given
        let fullAdder = FullAdder()
        fullAdder.inputA.output = false
        fullAdder.inputB.output = true
        fullAdder.inputC.output = true
        
        // When
        Runner.simulate(fullAdder.model)
        
        // Then
        XCTAssertFalse(fullAdder.outputSum.output)
        XCTAssertTrue(fullAdder.outputCarry.output)
    }
    
    func testFullAdderTrueFalseFalse() {
        // Given
        let fullAdder = FullAdder()
        fullAdder.inputA.output = true
        fullAdder.inputB.output = false
        fullAdder.inputC.output = false
        
        // When
        Runner.simulate(fullAdder.model)
        
        // Then
        XCTAssertTrue(fullAdder.outputSum.output)
        XCTAssertFalse(fullAdder.outputCarry.output)
    }
    
    func testFullAdderTrueFalseTrue() {
        // Given
        let fullAdder = FullAdder()
        fullAdder.inputA.output = true
        fullAdder.inputB.output = false
        fullAdder.inputC.output = true
        
        // When
        Runner.simulate(fullAdder.model)
        
        // Then
        XCTAssertFalse(fullAdder.outputSum.output)
        XCTAssertTrue(fullAdder.outputCarry.output)
    }
    
    func testFullAdderTrueTrueFalse() {
       // Given
       let fullAdder = FullAdder()
       fullAdder.inputA.output = true
       fullAdder.inputB.output = true
       fullAdder.inputC.output = false
       
       // When
       Runner.simulate(fullAdder.model)
       
       // Then
       XCTAssertFalse(fullAdder.outputSum.output)
       XCTAssertTrue(fullAdder.outputCarry.output)
   }
    
    func testFullAdderTrueTrueTrue() {
        // Given
        let fullAdder = FullAdder()
        fullAdder.inputA.output = true
        fullAdder.inputB.output = true
        fullAdder.inputC.output = true
        
        // When
        Runner.simulate(fullAdder.model)
        
        // Then
        XCTAssertTrue(fullAdder.outputSum.output)
        XCTAssertTrue(fullAdder.outputCarry.output)
    }

}
