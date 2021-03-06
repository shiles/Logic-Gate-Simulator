//
//  Gates.swift
//  Logic Simulator
//
//  Created by Sonnie Hiles on 09/03/2020.
//  Copyright © 2020 Sonnie Hiles. All rights reserved.
//

import Foundation

public protocol Gate {
    var inputs: [Gate] { get set }
    var output: Bool { get }
    var hasChanged: Bool { get }
    
    func run()
}

extension Gate {
    
    mutating func withInput(inputA: Bool, inputB: Bool? = nil) {
        let inA = Input(initialValue: inputA)
        var inB: Input?

        if let inputB = inputB { inB = Input(initialValue: inputB) }

        self.inputs = [inA, inB].compactMap { $0 }
    }
}

public class Not: Gate {
    public var inputs: [Gate] = []
    public var output: Bool = false
    public var hasChanged: Bool = false
    
    public init() {}
    
    public func run() {
        guard let input = inputs.first?.output else { fatalError() }
        let val = !input
        hasChanged = output != val
        output = val
    }
}

public class Or: Gate {
    public var inputs: [Gate] = []
    public var output: Bool = false
    public var hasChanged: Bool = false
    
    public init() {}
    
    public func run() {
        guard let first = inputs.first?.output, let second = inputs.second?.output else { fatalError() }
        let val = first || second
        hasChanged = output != val
        output = val
    }
}

public class Nor: Gate {
    public var inputs: [Gate] = []
    public var output: Bool = false
    public var hasChanged: Bool = false

    public init() {}
    
    public func run() {
        guard let first = inputs.first?.output, let second = inputs.second?.output else { fatalError() }
        let val = !(first || second)
        hasChanged = output != val
        output = val
    }
}

public class And: Gate {
    public var inputs: [Gate] = []
    public var output: Bool = false
    public var hasChanged: Bool = false
    
    public init() {}
    
    public func run() {
        guard let first = inputs.first?.output, let second = inputs.second?.output else { fatalError() }
        let val = first && second
        hasChanged = output != val
        output = val
    }
}

public class Nand: Gate {
    public var inputs: [Gate] = []
    public var output: Bool = false
    public var hasChanged: Bool = false
   
    public init() {}
        
    public func run() {
        guard let first = inputs.first?.output, let second = inputs.second?.output else { fatalError() }
        let val = !(first && second)
        hasChanged = output != val
        output = val
    }
}

public class Xor: Gate {
    public var inputs: [Gate] = []
    public var output: Bool = false
    public var hasChanged: Bool = false
    
    public init() {}
    
    public func run() {
        guard let first = inputs.first?.output, let second = inputs.second?.output else { fatalError() }
        let val = first ^ second
        hasChanged = output != val
        output = val
    }
}

public class Xnor: Gate {
    public var inputs: [Gate] = []
    public var output: Bool = false
    public var hasChanged: Bool = false
    
    public init() {}
    
    public func run() {
        guard let first = inputs.first?.output, let second = inputs.second?.output else { fatalError() }
        let val = !(first ^ second)
        hasChanged = output != val
        output = val
    }
}

public class Input: Gate {
    public var inputs: [Gate] = []
    public var output: Bool = false
    public var hasChanged: Bool = false
    
    public init() {}
    
    public init(initialValue: Bool) {
        output = initialValue
    }
    
    public func run() {}
}

public class Output: Gate {
    public var inputs: [Gate] = []
    public var output: Bool = false
    public var hasChanged: Bool = true
    public init() {}
    
    public func run() {
        guard let first = inputs.first?.output else { fatalError() }
        output = first
        hasChanged = false
    }
}
