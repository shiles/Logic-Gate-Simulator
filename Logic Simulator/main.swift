//
//  main.swift
//  Logic Simulator
//
//  Created by Sonnie Hiles on 09/03/2020.
//  Copyright © 2020 Sonnie Hiles. All rights reserved.
//

import Foundation

// MARK: - Full Adder Example Circuit

// Inputs
var inputA = Input(initialValue: true)
var inputB = Input(initialValue: true)
var inputC = Input(initialValue: false)

// Gates
var xorA = Xor()
var xorB = Xor()
var andA = And()
var andB = And()
var or   = Or()

xorA.inputs = [inputA, inputB]
xorB.inputs = [inputC, xorA]
andA.inputs = [xorA, inputC]
andB.inputs = [inputA, inputB]
or.inputs   = [andA, andB]

// Outputs
var outputSum = Output()
var outputCarry = Output()
outputSum.inputs = [xorB]
outputCarry.inputs = [or]

// Test Output
inputA.output = false
inputB.output = false
inputC.output = false
Runner.simulate([inputA, or, xorA, xorB, andA, or, inputB, inputC, xorA, outputSum, outputCarry, andB])

// Print output
print("Sum: \(outputSum.output)")
print("Carry: \(outputCarry.output)")
print("\n")

// MARK: - Nands Example Circuit

// Number Two
var input1 = Input(initialValue: false)
var input2 = Input(initialValue: false)

var nand1 = Nand()
var nand2 = Nand()
var otpt1 = Output()
var otpt2 = Output()

nand1.inputs = [input1, nand2]
nand2.inputs = [input2, nand1]
otpt1.inputs = [nand1]
otpt2.inputs = [nand2]

Runner.simulate([nand1, nand2, otpt1, otpt2])

print("A: \(otpt1.output)")
print("B: \(otpt2.output)")
print("\n")
