//
//  OrderingLogicTests.swift
//  Logic Simulator XCTests
//
//  Created by Sonnie Hiles on 26/03/2020.
//  Copyright © 2020 Sonnie Hiles. All rights reserved.
//

import XCTest

struct HalfAdder {
    // Inputs
    let inputA = Input(initialValue: false)
    let inputB = Input(initialValue: false)
    
    // Outputs
    let outputSum = Output()
    let outputCarry = Output()
    
    // Models
    var modelForward: GateModel {
        // Intermediary Gates
        let xor = Xor()
        let and = And()
        
        // Conections
        xor.inputs = [inputA, inputB]
        and.inputs = [inputA, inputB]
        outputSum.inputs = [xor]
        outputCarry.inputs = [and]
        
        return [inputA, inputB, xor, and, outputSum, outputCarry]
    }
    
    var modelBackwards: GateModel {
        // Intermediary Gates
        let xor = Xor()
        let and = And()
        
        // Conections
        xor.inputs = [inputA, inputB]
        and.inputs = [inputA, inputB]
        outputSum.inputs = [xor]
        outputCarry.inputs = [and]
        
        return [outputCarry, outputSum, and, xor, inputB, inputA]
    }
    
    var modelRandom: GateModel {
        // Intermediary Gates
        let xor = Xor()
        let and = And()
        
        // Conections
        xor.inputs = [inputA, inputB]
        and.inputs = [inputA, inputB]
        outputSum.inputs = [xor]
        outputCarry.inputs = [and]
        
        return [xor, outputSum, and, inputB, outputCarry, inputA]
    }
    
}

class OrderingLogicTests: XCTestCase {

    func testHalfAdderForwardsFalseFalse() {
        // Given
        let halfAdder = HalfAdder()
        halfAdder.inputA.output = false
        halfAdder.inputB.output = false
        
        // When
        Runner.simulate(halfAdder.modelForward)
        
        // Then
        XCTAssertFalse(halfAdder.outputSum.output)
        XCTAssertFalse(halfAdder.outputCarry.output)
    }
    
    func testHalfAdderBackwardsFalseFalse() {
        // Given
        let halfAdder = HalfAdder()
        halfAdder.inputA.output = false
        halfAdder.inputB.output = false
        
        // When
        Runner.simulate(halfAdder.modelBackwards)
        
        // Then
        XCTAssertFalse(halfAdder.outputSum.output)
        XCTAssertFalse(halfAdder.outputCarry.output)
    }
    
    func testHalfAdderRandomFalseFalse() {
        // Given
        let halfAdder = HalfAdder()
        halfAdder.inputA.output = false
        halfAdder.inputB.output = false
        
        // When
        Runner.simulate(halfAdder.modelRandom)
        
        // Then
        XCTAssertFalse(halfAdder.outputSum.output)
        XCTAssertFalse(halfAdder.outputCarry.output)
    }
    
    func testHalfAdderForwardsTrueFalse() {
        // Given
        let halfAdder = HalfAdder()
        halfAdder.inputA.output = true
        halfAdder.inputB.output = false
        
        // When
        Runner.simulate(halfAdder.modelForward)
        
        // Then
        XCTAssertTrue(halfAdder.outputSum.output)
        XCTAssertFalse(halfAdder.outputCarry.output)
    }
    
    func testHalfAdderBackwardsTrueFalse() {
        // Given
        let halfAdder = HalfAdder()
        halfAdder.inputA.output = true
        halfAdder.inputB.output = false
        
        // When
        Runner.simulate(halfAdder.modelBackwards)
        
        // Then
        XCTAssertTrue(halfAdder.outputSum.output)
        XCTAssertFalse(halfAdder.outputCarry.output)
    }
    
    func testHalfAdderRandomTrueFalse() {
        // Given
        let halfAdder = HalfAdder()
        halfAdder.inputA.output = true
        halfAdder.inputB.output = false
        
        // When
        Runner.simulate(halfAdder.modelRandom)
        
        // Then
        XCTAssertTrue(halfAdder.outputSum.output)
        XCTAssertFalse(halfAdder.outputCarry.output)
    }
    
    func testHalfAdderForwardsFalseTrue() {
        // Given
        let halfAdder = HalfAdder()
        halfAdder.inputA.output = false
        halfAdder.inputB.output = true
        
        // When
        Runner.simulate(halfAdder.modelForward)
        
        // Then
        XCTAssertTrue(halfAdder.outputSum.output)
        XCTAssertFalse(halfAdder.outputCarry.output)
    }
    
    func testHalfAdderBackwardsFalseTrue() {
        // Given
        let halfAdder = HalfAdder()
        halfAdder.inputA.output = false
        halfAdder.inputB.output = true
        
        // When
        Runner.simulate(halfAdder.modelBackwards)
        
        // Then
        XCTAssertTrue(halfAdder.outputSum.output)
        XCTAssertFalse(halfAdder.outputCarry.output)
    }
    
    func testHalfAdderRandomFalseTrue() {
        // Given
        let halfAdder = HalfAdder()
        halfAdder.inputA.output = false
        halfAdder.inputB.output = true
        
        // When
        Runner.simulate(halfAdder.modelRandom)
        
        // Then
        XCTAssertTrue(halfAdder.outputSum.output)
        XCTAssertFalse(halfAdder.outputCarry.output)
    }

    func testHalfAdderForwardsTrueTrue() {
        // Given
        let halfAdder = HalfAdder()
        halfAdder.inputA.output = true
        halfAdder.inputB.output = true
        
        // When
        Runner.simulate(halfAdder.modelForward)
        
        // Then
        XCTAssertFalse(halfAdder.outputSum.output)
        XCTAssertTrue(halfAdder.outputCarry.output)
    }
    
    func testHalfAdderBackwardsTrueTrue() {
        // Given
        let halfAdder = HalfAdder()
        halfAdder.inputA.output = true
        halfAdder.inputB.output = true
        
        // When
        Runner.simulate(halfAdder.modelBackwards)
        
        // Then
        XCTAssertFalse(halfAdder.outputSum.output)
        XCTAssertTrue(halfAdder.outputCarry.output)
    }
    
    func testHalfAdderRandomTrueTrue() {
        // Given
        let halfAdder = HalfAdder()
        halfAdder.inputA.output = true
        halfAdder.inputB.output = true
        
        // When
        Runner.simulate(halfAdder.modelRandom)
        
        // Then
        XCTAssertFalse(halfAdder.outputSum.output)
        XCTAssertTrue(halfAdder.outputCarry.output)
    }

}
