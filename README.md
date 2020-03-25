# Logic Gate Simulator

## Overview

A funtional prototype for the simulation used in the [Logic-Gate-Recogniser](https://github.com/shiles/Logic-Gate-Recogniser) project. It supports simulating both combinatorial and sequential logic. The simulation will continue to execute until a stable circuit is found.

The follow gates are supported:
- NOT
- AND
- NAND
- OR
- NOR
- XOR
- XNOR
- INPUT
- OUTPUT

## Example Circuit

Circuits are built programatically, here is an example of a simple not gate, with in input and and output. This can be passed to the `Runner` which will simulate it and produce a output value.

```swift
// Initialise Gates
let input = Input(initialValue: true)
let not = Not()
let output = Output()

// Make Connections
not.inputs = [input]
output.inputs = [output]

// Built Model
let model = [input, not, ouput]
```