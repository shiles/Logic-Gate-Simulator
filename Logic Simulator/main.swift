//
//  main.swift
//  Logic Simulator
//
//  Created by Sonnie Hiles on 09/03/2020.
//  Copyright © 2020 Sonnie Hiles. All rights reserved.
//

import Foundation

// Inputs
var inputA = Input(initialValue: false)
var inputB = Input(initialValue: false)

// Gates
var norA = Nor()
var norB = Nor()
norA.inputs = [inputA, norB]
norB.inputs = [inputB, norA]

// Outputs
var outputA = Output()
var outputB = Output()
outputA.inputs = [norA]
outputB.inputs = [norB]

// Build Runner + Simulate Logic
let runner = GateRunner(for: [inputA, inputB, norA, norB, outputA, outputB])
runner.simulate()

// Test Output
print("Output A \(outputA.output)")
print("Output B \(outputB.output)")
