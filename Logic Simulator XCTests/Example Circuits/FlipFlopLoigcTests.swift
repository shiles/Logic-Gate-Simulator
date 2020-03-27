//
//  FlipFlopLoigcTests.swift
//  Logic Simulator XCTests
//
//  Created by Sonnie Hiles on 26/03/2020.
//  Copyright © 2020 Sonnie Hiles. All rights reserved.
//

import XCTest
@testable import Logic_Simulator

// Sequential Example
struct FlipFlop {
    // Inputs
    let inputSet   = Input(initialValue: false)
    let inputReset = Input(initialValue: false)
    
    // Outputs
    let outputA = Output()
    let outputB = Output()
    
    let model: GateModel
    
    init() {
        // Intermediary Gates
        let norA = Nor()
        let norB = Nor()
        
        // Conections
        norA.inputs = [inputReset, norB]
        norB.inputs = [inputSet, norA]
        outputA.inputs = [norA]
        outputB.inputs = [norB]
        
        model = [inputSet, inputReset, norA, norB, outputA, outputB]
    }
}

class FlipFlopLoigcTests: XCTestCase {
    
    func testFlipFlopTrueFalse() {
        // Given
        let flipFlop = FlipFlop()
        flipFlop.inputSet.output = true
        flipFlop.inputReset.output = false
        
        // When
        Runner.simulate(flipFlop.model)
        
        // Then
        XCTAssertTrue(flipFlop.outputA.output)
        XCTAssertFalse(flipFlop.outputB.output)
    }
    
    func testFlipFlopFalseTrue() {
        // Given
        let flipFlop = FlipFlop()
        flipFlop.inputSet.output = false
        flipFlop.inputReset.output = true
        
        // When
        Runner.simulate(flipFlop.model)
        
        // Then
        XCTAssertFalse(flipFlop.outputA.output)
        XCTAssertTrue(flipFlop.outputB.output)
    }
    
    func testFlipFlopFalseFalse() {
        // Given
        let flipFlop = FlipFlop()
        flipFlop.inputSet.output = false
        flipFlop.inputReset.output = false

        // When
        Runner.simulate(flipFlop.model)

        // Then
        XCTAssertTrue(flipFlop.outputA.output)
        XCTAssertFalse(flipFlop.outputB.output)
    }
    
    func testFlipFlopTrueTrue() {
        // Given
        let flipFlop = FlipFlop()
        flipFlop.inputSet.output = true
        flipFlop.inputReset.output = true

        // When
        Runner.simulate(flipFlop.model)

        // Then
        XCTAssertFalse(flipFlop.outputA.output)
        XCTAssertFalse(flipFlop.outputB.output)
    }
    
    func testFlipFlopFalseFalseAfterFalseTrue() {
        // Given - Set Initial State
        let flipFlop = FlipFlop()
        flipFlop.inputSet.output = false
        flipFlop.inputReset.output = true
        Runner.simulate(flipFlop.model)
        XCTAssertFalse(flipFlop.outputA.output)
        XCTAssertTrue(flipFlop.outputB.output)
        
        // Given - New State
        flipFlop.inputSet.output = false
        flipFlop.inputReset.output = false
        
        // When
        Runner.simulate(flipFlop.model)

        // Then
        XCTAssertFalse(flipFlop.outputA.output)
        XCTAssertTrue(flipFlop.outputB.output)
    }

    func testFlipFlopFalseFalseAfterTrueFalse(){
        // Given - Set Initial State
        let flipFlop = FlipFlop()
        flipFlop.inputSet.output = true
        flipFlop.inputReset.output = false
        Runner.simulate(flipFlop.model)
        XCTAssertTrue(flipFlop.outputA.output)
        XCTAssertFalse(flipFlop.outputB.output)
        
        // Given - New State
        flipFlop.inputSet.output = false
        flipFlop.inputReset.output = false
        
        // When
        Runner.simulate(flipFlop.model)

        // Then
        XCTAssertTrue(flipFlop.outputA.output)
        XCTAssertFalse(flipFlop.outputB.output)
    }
}
