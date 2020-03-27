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
    
    var model: GateModel {
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
    
    var permutations: [GateModel] {
        permute(items: model)
    }
    
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

func permute<C: Collection>(items: C) -> [[C.Iterator.Element]] {
    var scratch = Array(items)
    var result: [[C.Iterator.Element]] = []

    func heap(_ n: Int) {
        if n == 1 {
            result.append(scratch)
            return
        }

        for i in 0..<n-1 {
            heap(n-1)
            let j = (n%2 == 1) ? 0 : i
            scratch.swapAt(j, n-1)
        }
        heap(n-1)
    }

    heap(scratch.count)

    return result
}

class OrderingLogicTests: XCTestCase {

    func testHalfAdderFalseFalse() {
        //Given
        let halfAdder = HalfAdder()
        halfAdder.inputA.output = false
        halfAdder.inputB.output = false
        let modelPermuations = halfAdder.permutations
        
        for model in modelPermuations {
            // When
            Runner.simulate(model)
            
            // Then
            XCTAssertFalse(halfAdder.outputSum.output)
            XCTAssertFalse(halfAdder.outputCarry.output)
        }
        
    }
    
    func testHalfAdderTrueFalse() {
        // Given
        let halfAdder = HalfAdder()
        halfAdder.inputA.output = true
        halfAdder.inputB.output = false
        let modelPermuations = halfAdder.permutations
        
        for model in modelPermuations {
            // When
            Runner.simulate(model)
            
            // Then
            XCTAssertTrue(halfAdder.outputSum.output)
            XCTAssertFalse(halfAdder.outputCarry.output)
        }
    }
    
    func testHalfAdderFalseTrue(){
        // Given
        let halfAdder = HalfAdder()
        halfAdder.inputA.output = false
        halfAdder.inputB.output = true
        let modelPermuations = halfAdder.permutations
        
        for model in modelPermuations {
            // When
            Runner.simulate(model)
            
            // Then
            XCTAssertTrue(halfAdder.outputSum.output)
            XCTAssertFalse(halfAdder.outputCarry.output)
        }
    }
    
    func testHalfAdderTrueTrue() {
        // Given
        let halfAdder = HalfAdder()
        halfAdder.inputA.output = true
        halfAdder.inputB.output = true
        let modelPermuations = halfAdder.permutations
        
        for model in modelPermuations {
            // When
            Runner.simulate(model)
            
            // Then
            XCTAssertFalse(halfAdder.outputSum.output)
            XCTAssertTrue(halfAdder.outputCarry.output)
        }
    }
}
